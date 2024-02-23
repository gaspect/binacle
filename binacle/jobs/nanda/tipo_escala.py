from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import Database, migration, script, partial

script = ui.op(name="TIPOS_DE_ESCALA_SCRIPT")(partial(script, file="assets/migrations/nanda/v4_nanda_tipo_escala.sql"))
migration = ui.op(name="TIPOS_DE_ESCALA_MIGRACIONES")(migration)


@ui.op(name="TIPOS_DE_ESCALA_CSV")
def csv() -> list:
    data = lcsv("assets/csv/escalas.csv", delimiter=";")
    return data


@ui.op(name="TIPOS_DE_ESCALA_DSL")
def dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_tipo_escala ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    escala_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    eliminado BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_escala_fk FOREIGN KEY (escala_fk) REFERENCES estandares.nanda_escala(id) \n"
             ");")
    return sql.getvalue()


@ui.op(name="TIPOS_DE_ESCALA_INSERCIONES")
def inserts(data: list, database: Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, *_ in data:
        result = list(pout(f"select  id from estandares.nanda_escala where codigo = '{codigo}' limit 1;"))
        if result:
            id = result[0].id
            pin(f"insert  into  estandares.nanda_tipo_escala(escala_fk, codigo, nombre, version, eliminado) "
                f"values ('{id}', '{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V4_MIGRAR_NANDA_TIPOS_DE_ESCALA")
def tipos_de_escala():
    migration(script(dsl(), inserts(csv())))
