from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import migration, script, partial

script = ui.op(name="DOMINIO_SCRIPT")(partial(script, file="assets/migrations/nanda/v1_nanda_dominios.sql"))
migration = ui.op(name="DOMINIO_MIGRACIONES")(migration)


@ui.op(name="DOMINIO_CSV")
def csv() -> list:
    data = lcsv("assets/csv/nanda_dominio.csv")
    return data


@ui.op(name="DOMINIO_DSL")
def dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_dominio ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    dominio TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE \n"
             ");")
    return sql.getvalue()


@ui.op(name="DOMINIO_INSERCIONES")
def inserts(data: list) -> str:
    postgres, sql = connection()
    for dominio_, nombre in data:
        postgres(f"insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) "
                 f"values ('{dominio_}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V1_MIGRAR_NANDA_DOMINIOS")
def dominios():
    migration(script(dsl(), inserts(csv())))
