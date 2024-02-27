from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import migration, script, partial

script = ui.op(name="ESCALAS_SCRIPT")(partial(script, file="assets/migrations/nanda/v3_nanda_escalas.sql"))
migration = ui.op(name="ESCALAS_MIGRACIONES")(migration)


@ui.op(name="ESCALAS_CSV")
def csv() -> list:
    data = lcsv("assets/csv/escalas.csv", delimiter=";")
    return data


@ui.op(name="ESCALAS_DSL")
def dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_escala ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    eliminado BOOLEAN DEFAULT FALSE \n"
             ");")
    return sql.getvalue()


@ui.op(name="ESCALA_INSERCIONES")
def inserts(data: list) -> str:
    postgres, sql = connection()
    for codigo, nombre, *_ in data:
        postgres(f"insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) "
                 f"values ('{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V3_MIGRACIONES_NANDA_ESCALAS")
def escalas():
    migration(script(dsl(), inserts(csv())))
