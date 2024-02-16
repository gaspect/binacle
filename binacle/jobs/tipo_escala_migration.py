from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database, MigrationFile


@ui.op()
def tipo_escala_load_csv() -> list:
    data = csv("assets/csv/escalas.csv", delimiter=";")
    return data

@ui.op()
def tipo_escala_create_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_tipo_escala ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    escala_fk INTEGER, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE, \n"
             "    CONSTRAINT nanda_escala_fk FOREIGN KEY (escala_fk) REFERENCES estandares.nanda_escala(id) \n"
             ");")
    return sql.getvalue()


@ui.op()
def tipo_escala_create_inserts(data: list, database:Database) -> str:
    pout, _ = connection(database.url)
    pin, sql = connection()
    for codigo, nombre, *_ in data:
        result = list(pout(f"select  id from estandares.nanda_escala where codigo = '{codigo}' limit 1;"))
        if result:
            id = result[0].id
            pin(f"insert  into  estandares.nanda_tipo_escala(escala_fk, codigo, nombre, version, deleted) "
                    f"values ('{id}', '{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.op()
def tipo_escala_make_script(dsl: str, inserts: str, migration_file: MigrationFile) -> str:
    with open(migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return migration_file.fileName


@ui.op()
def tipo_escala_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def tipo_escala_migrations():
    dsl = tipo_escala_create_dsl()
    inserts = tipo_escala_create_inserts(tipo_escala_load_csv())
    tipo_escala_migration(tipo_escala_make_script(dsl, inserts))
