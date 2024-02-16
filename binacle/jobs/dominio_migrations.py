from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database


@ui.resource(name="dominio_migration_file", fileName="assets/migrations/nanda_dmonio.sql")
class DominioMigrationFile:
    fileName: str


@ui.op()
def dominio_load_csv() -> list:
    data = csv("assets/csv/nanda_dominio.csv")
    return ui.Output(data, metadata={"value": ui.MetadataValue.json(data)})


@ui.op()
def dominio_create_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_dominio ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    dominio TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE \n"
             ");")
    return ui.Output(sql.getvalue(), metadata={
        "value": ui.MetadataValue.sql(sql.getvalue())
    })


@ui.op()
def dominio_create_inserts(data: list) -> str:
    postgres, sql = connection()
    for dominio_, nombre in data:
        postgres(f"insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) "
                 f"values ('{dominio_}', '{nombre}', '1', FALSE);")
    return ui.Output(sql.getvalue(), metadata={
        "value": ui.MetadataValue.sql(sql.getvalue())
    })


@ui.op()
def dominio_make_script(dsl: str, inserts: str, dominio_migration_file: DominioMigrationFile) -> str:
    with open(dominio_migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return ui.Output(dominio_migration_file.fileName,
                     metadata={"value": ui.MetadataValue.path(dominio_migration_file.fileName)})


@ui.op()
def dominio_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def dominio_migrations():
    dsl = dominio_create_dsl()
    inserts = dominio_create_inserts(dominio_load_csv())
    dominio_migration(dominio_make_script(dsl, inserts))
