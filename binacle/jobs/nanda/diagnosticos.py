from binacle.ui import ui
from binacle.csv import csv as lcsv
from binacle.sql import connection
from binacle.jobs.common import Database, migration, script, partial

diagnosticos_script = ui.op(name="DIAGNOSTICOS_SCRIPT")(
    partial(script, file="assets/migrations/nanda/v9_nanda_diagnosticos.sql"))
diagnosticos_migration = ui.op(name="DIAGNOSTICOS_MIGRACIONES")(migration)


@ui.op(name="DIAGNOSTICOS_CSV")
def diagnosticos_csv() -> list:
    data = lcsv("assets/csv/diagnosticos.csv")
    return data


@ui.op(name="DIAGNOSTICOS_NIC_CSV")
def diagnosticos_nic_csv() -> list:
    data = lcsv("assets/csv/nic.csv", delimiter=";")
    return data


@ui.op(name="DIAGNOSTICOS_DSL")
def diagnosticos_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_diagnostico ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    clase_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    eliminado BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_clase_fk FOREIGN KEY (clase_fk) REFERENCES estandares.nanda_clase(id) \n"
             ");")

    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_nic_nanda_diagnostico ( \n"
             "    nanda_fk INTEGER, \n"
             "    nic_fk   INTEGER, \n"
             "    CONSTRAINT nanda_rel FOREIGN KEY (nanda_fk) REFERENCES estandares.nanda_diagnostico(id), \n"
             "    CONSTRAINT nic_rel FOREIGN KEY (nic_fk) REFERENCES estandares.nanda_nic(id) \n"
             ");")

    return sql.getvalue()


@ui.op(name="DIAGNOSTICOS_INSERCIONES")
def diagnosticos_inserts(diagnosticos: list, nics: list, database: Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for id, raw_data in enumerate(diagnosticos, 1):
        dominio, clase, codigo, nombre, *_ = raw_data
        clase_result = list(
            pout(f"select clase.id from estandares.nanda_clase as clase join estandares.nanda_dominio as "
                 f"dominio on clase.dominio_fk = dominio.id where clase.clase='{clase}' and "
                 f"dominio.dominio='{dominio}' limit 1;"))
        if clase_result:
            clase_id = clase_result[0].id
            pin(f"insert  into  estandares.nanda_diagnostico(id, clase_fk, codigo, nombre, version, eliminado) "
                f"values ({id}, {clase_id}, '{codigo}', '{nombre}', '1', FALSE);")

            for nic_codigo, __, *nandas in nics:
                if codigo in nandas:
                    nic_result = list(pout(f"select id from estandares.nanda_nic where codigo='{nic_codigo}' limit  1;"))
                    if nic_result:
                        nic_id = nic_result[0].id
                        pin(f"insert into estandares.nanda_nic_nanda_diagnostico(nanda_fk, nic_fk)"
                            f" values ({id}, {nic_id});")
    return sql.getvalue()


@ui.ops()
@ui.graph(name="V9_MIGRAR_NANDA_DIAGNOSTICOS")
def diagnosticos():
    diagnosticos_migration(diagnosticos_script(diagnosticos_dsl(), diagnosticos_inserts(diagnosticos_csv(), diagnosticos_nic_csv())))
