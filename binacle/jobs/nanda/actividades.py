from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import Database, migration, script, partial

actividades_script = ui.op(name="ACTIVIDADES_SCRIPT")(
    partial(script, file="assets/migrations/nanda/v8_nic_actividades.sql"))
actividades_migration = ui.op(name="ACTIVIDADES_MIGRACIONES")(migration)


@ui.op(name="ACTIVIDADES_CSV")
def actividades_csv() -> list:
    data = lcsv("assets/csv/nic_actividades.csv", delimiter=";")
    return data


@ui.op(name="ACTIVIDADES_DSL")
def actividades_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_nic_actividades ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    nic_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    eliminado BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_nic_fk FOREIGN KEY (nic_fk) REFERENCES estandares.nanda_nic(id) \n"
             ");")
    return sql.getvalue()


@ui.op(name="ACTIVIDADES_INSERCIONES")
def actividades_inserts(data: list, database: Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, nic in data:
        result_nic = list(pout(f"select  id from estandares.nanda_nic where codigo = '{nic}' limit 1;"))
        if result_nic:
            nic_id = result_nic[0].id
            scaped_name = nombre.replace("'", "`")
            pin(f"insert  into  estandares.nanda_nic_actividades(nic_fk, codigo, nombre, version, eliminado) "
                f"values ({nic_id}, '{codigo}', '{scaped_name}', '1', FALSE);")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V8_MIGRAR_NANDA_ACTIVIDADES")
def actividades():
    actividades_migration(actividades_script(actividades_dsl(), actividades_inserts(actividades_csv())))
