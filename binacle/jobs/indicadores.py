from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database, MigrationFile


@ui.op()
def indicadores_load_csv() -> list:
    data = csv("assets/csv/indicadores.csv", delimiter=";")
    return data

@ui.op()
def indicadores_create_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_indicadores ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    escala_fk INTEGER, \n"
             "    noc_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_escala_fk FOREIGN KEY (escala_fk) REFERENCES estandares.nanda_escala(id), \n"
             "    CONSTRAINT nanda_noc_fk FOREIGN KEY (noc_fk) REFERENCES estandares.nanda_noc(id) \n"
             ");")
    return sql.getvalue()


@ui.op()
def indicadores_create_inserts(data: list, database:Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, escala, noc in data:
        result_escala = list(pout(f"select  id from estandares.nanda_escala where codigo = '{escala}' limit 1;"))
        result_noc = list(pout(f"select  id from estandares.nanda_noc where codigo = '{noc}' limit 1;"))
        if result_escala and result_noc:
            id_escala = result_escala[0].id
            id_noc = result_noc[0].id
            
            pin(f"insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) "
                    f"values ({id_noc}, {id_escala}, '{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.op()
def indicadores_make_script(dsl: str, inserts: str, migration_file: MigrationFile) -> str:
    with open(migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return migration_file.fileName


@ui.op()
def indicadores_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def indicadores_migrations():
    dsl = indicadores_create_dsl()
    inserts = indicadores_create_inserts(indicadores_load_csv())
    indicadores_migration(indicadores_make_script(dsl, inserts))
