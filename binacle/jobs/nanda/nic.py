from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import Database, migration, script, partial

script = ui.op(name="NIC_SCRIPT")(partial(script, file="assets/migrations/nanda/v7_nanda_nic.sql"))
migration = ui.op(name="NIC_MIGRACIONES")(migration)


@ui.op(name="NIC_CSV")
def nic_csv() -> list:
    data = lcsv("assets/csv/nic.csv", delimiter=";")
    return data


@ui.op(name="NIC_NOC_CSV")
def noc_csv() -> list:
    data = lcsv("assets/csv/noc.csv", delimiter=";")
    return data


@ui.op(name="NIC_DSL")
def dsl() -> str:
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


@ui.op(name="NIC_INSERCIONES")
def inserts(data_nic: list, data_noc: list, database: Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()

    for nic_codigo, nic_nombre, *_ in data_nic:
        for noc_codigo, _, *nics in data_noc:
            if nic_codigo in nics:
                results = list(pout(f"select id from estandares.nanda_noc where codigo = '{noc_codigo}' limit 1;"))
                if results:
                    noc_id = results[0].id
                    pin(f"insert  into  estandares.nanda_nic(noc_fk, codigo, nombre, version, deleted) "
                        f"values ({noc_id}, '{nic_codigo}', '{nic_nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V7_MIGRACIONES_NANDA_NIC")
def nic():
    migration(script(dsl(), inserts(nic_csv(), noc_csv())))
