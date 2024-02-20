from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.ui import ui
from binacle.jobs.common import Database, migration, script, partial

script = ui.op(name="CLASES_SCRIPT")(partial(script, file="assets/migrations/nanda/v2_nanda_clases.sql"))
migration = ui.op(name="CLASES_MIGRACIONES")(migration)


@ui.op(name="CLASES_CSV")
def csv():
    data = lcsv("assets/csv/nanda_clases.csv")
    return data


@ui.op(name="CLASES_DSL")
def dsl():
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
    return sql.getvalue()


@ui.op(name="CLASES_INSERCIONES")
def inserts(data, database: Database):
    pout, _ = connection(database.url)
    pin, sql = connection()

    for clase, nombre, dominio in data:
        result = list(pout(f"select  id from estandares.nanda_dominio where dominio = '{dominio}' limit 1;"))
        if result:
            dominio_id = result[0].id
            pin(f"insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) "
                f"values ({dominio_id},'{clase}', '{nombre}', '1', FALSE);")

    return sql.getvalue()


@ui.ops()
@ui.graph(name="V2_MIGRAR_NANDA_CLASES")
def clases():
    migration(script(dsl(), inserts(csv())))
