from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database, MigrationFile


@ui.op()
def nic_load_csv() -> list:
    data = csv("assets/csv/nic.csv",delimiter=";")
    return data


@ui.op()
def noc_reload_csv() -> list:
    data = csv("assets/csv/noc.csv",delimiter=";")
    return data

@ui.op()
def nic_create_dsl() -> str:
    postgres, sql = connection()
    postgres("DROP TABLE IF EXISTS estandares.nanda_nic CASCADE;")
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_nic ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    noc_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE \n"
             ");")
    return sql.getvalue()


@ui.op()
def nic_create_inserts(data_nic: list, data_noc:list, database:Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    
    for  nic_codigo, nic_nombre, *_ in data_nic:
        for noc_codigo,_, *nics in data_noc:
            if nic_codigo in nics:
                results = list(pout(f"select id from estandares.nanda_noc where codigo = '{noc_codigo}' limit 1;"))
                if results:
                    id = results[0].id
                    pin(f"insert  into  estandares.nanda_nic(noc_fk, codigo, nombre, version, deleted) "
                                f"values ({id}, '{nic_codigo}', '{nic_nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.op()
def nic_make_script(dsl: str, inserts: str, migration_file: MigrationFile) -> str:
    with open(migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return migration_file.fileName


@ui.op()
def nic_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def nic_migrations():
    dsl = nic_create_dsl()
    inserts = nic_create_inserts(nic_load_csv(), noc_reload_csv())
    nic_migration(nic_make_script(dsl, inserts))
