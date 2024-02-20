from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import migration, script, partial

script = ui.op(name="NOC_SCRIPT")(partial(script, file="assets/migrations/nanda/v5_nanda_noc.sql"))
migration = ui.op(name="NOC_MIGRACIONES")(migration)


@ui.op(name="NOC_CSV")
def csv() -> list:
    data = lcsv("assets/csv/noc.csv", delimiter=";")
    return data


@ui.op(name="NOC_DSL")
def dsl() -> str:
    postgres, sql = connection()
    postgres("DROP TABLE IF EXISTS estandares.nanda_noc CASCADE;")
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_noc ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE \n"
             ");")
    return sql.getvalue()


@ui.op(name="NOC_INSRECINOES")
def inserts(data: list) -> str:
    postgres, sql = connection()
    for codigo, nombre, *_ in data:
        postgres(f"insert  into  estandares.nanda_noc(codigo, nombre, version, deleted) "
                 f"values ('{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V5_MIGRACIONES_NANDA_NOC")
def noc():
    migration(script(dsl(), inserts(csv())))
