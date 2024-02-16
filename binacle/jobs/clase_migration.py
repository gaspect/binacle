from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database


@ui.resource(name="clase_migration_file", fileName="assets/migrations/nanda_clase.sql")
class ClaseMigrationFile:
    fileName: str


@ui.op()
def clase_load_csv():
    data = csv("assets/csv/nanda_clases.csv")
    return ui.Output(data, metadata={"value": ui.MetadataValue.json(data)})


@ui.op()
def clase_create_dsl():
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_clase ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    dominio_fk INTEGER, \n"
             "    clase TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_dominio_fk FOREIGN KEY (dominio_fk) REFERENCES estandares.nanda_dominio(id) \n"
             ");")
    return ui.Output(sql.getvalue(), metadata={
        "value": ui.MetadataValue.sql(sql.getvalue())
    })


@ui.op()
def clase_create_inserts(data, database: Database):
    pout, _ = connection(database.url)
    pin, sql = connection()

    for clase, nombre, dominio in data:
        result = list(pout(f"select  id from estandares.nanda_dominio where dominio = '{dominio}' limit 1;"))
        if result:
            id = result[0].id
            pin(f"insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) "
                f"values ({id},'{clase}', '{nombre}', '1', FALSE);")

    return ui.Output(sql.getvalue(), metadata={
        "value": ui.MetadataValue.sql(sql.getvalue())
    })


@ui.op()
def clase_make_script(dsl, data, clase_migration_file: ClaseMigrationFile):
    with open(clase_migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + data)
    return ui.Output(clase_migration_file.fileName,
                     metadata={"value": ui.MetadataValue.path(clase_migration_file.fileName)})


@ui.op()
def clase_migration(script, database: Database):
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def clase_migrations():
    dsl = clase_create_dsl()
    inserts = clase_create_inserts(clase_load_csv())
    clase_migration(clase_make_script(dsl, inserts))
