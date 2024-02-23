from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import Database, migration, script, partial

script = ui.op(name="INDICADORES_SCRIPT")(partial(script, file="assets/migrations/nanda/v6_nanda_indicadores.sql"))
migration = ui.op(name="INDICADORES_MIGRACIONES")(migration)


@ui.op(name="INDICADORES_CSV")
def csv() -> list:
    data = lcsv("assets/csv/indicadores.csv", delimiter=";")
    return data


@ui.op(name="INDICADORES_DSL")
def dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_indicadores ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    escala_fk INTEGER, \n"
             "    noc_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    eliminado BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_escala_fk FOREIGN KEY (escala_fk) REFERENCES estandares.nanda_escala(id), \n"
             "    CONSTRAINT nanda_noc_fk FOREIGN KEY (noc_fk) REFERENCES estandares.nanda_noc(id) \n"
             ");")
    return sql.getvalue()


@ui.op(name="INDICADORES_INSERCIONES")
def inserts(data: list, database: Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, escala, noc in data:
        result_escala = list(pout(f"select  id from estandares.nanda_escala where codigo = '{escala}' limit 1;"))
        result_noc = list(pout(f"select  id from estandares.nanda_noc where codigo = '{noc}' limit 1;"))
        if result_escala and result_noc:
            id_escala = result_escala[0].id
            id_noc = result_noc[0].id

            pin(f"insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, eliminado) "
                f"values ({id_noc}, {id_escala}, '{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V6_MIGRACIONES_NANDA_INDICADORES")
def indicadores():
    migration(script(dsl(), inserts(csv())))
