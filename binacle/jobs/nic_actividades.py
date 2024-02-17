from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database, MigrationFile


@ui.op()
def nic_actividades_load_csv() -> list:
    data = csv("assets/csv/nic_actividades.csv", delimiter=";")
    return data

@ui.op()
def nic_actividades_create_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_nic_actividades ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    nic_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_nic_fk FOREIGN KEY (nic_fk) REFERENCES estandares.nanda_nic(id) \n"
             ");")
    return sql.getvalue()


@ui.op()
def nic_actividades_create_inserts(data: list, database:Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, nic in data:
        result_nic = list(pout(f"select  id from estandares.nanda_nic where codigo = '{nic}' limit 1;"))
        if result_nic:
           
            id_noc = result_nic[0].id
            
            pin(f"insert  into  estandares.nanda_nic_actividades(nic_fk, codigo, nombre, version, deleted) "
                    f"values ({id_noc}, '{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.op()
def nic_actividades_make_script(dsl: str, inserts: str, migration_file: MigrationFile) -> str:
    with open(migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return migration_file.fileName


@ui.op()
def nic_actividades_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def nic_actividades_migrations():
    dsl = nic_actividades_create_dsl()
    inserts = nic_actividades_create_inserts(nic_actividades_load_csv())
    nic_actividades_migration(nic_actividades_make_script(dsl, inserts))
