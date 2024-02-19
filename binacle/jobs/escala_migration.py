from binacle.ui import ui
from binacle.csv import csv
from binacle.sql import connection
from .common import Database, MigrationFile


@ui.op()
def escala_load_csv() -> list:
    data = csv("assets/csv/escalas.csv", delimiter=";")
    return data

@ui.op()
def escala_create_dsl() -> str:
    postgres, sql = connection()
    postgres("CREATE TABLE IF NOT EXISTS estandares.nanda_escala ( \n"
             "    id SERIAL PRIMARY KEY, \n"
             "    codigo TEXT NOT NULL, \n"
             "    nombre TEXT NOT NULL, \n"
             "    version TEXT NOT NULL, \n"
             "    deleted BOOLEAN DEFAULT FALSE \n"
             ");")
    return sql.getvalue()


@ui.op()
def escala_create_inserts(data: list) -> str:
    postgres, sql = connection()
    for codigo, nombre, *_ in data:
        postgres(f"insert  into  estandares.nanda_escala(codigo, nombre, version, deleted) "
                 f"values ('{codigo}', '{nombre}', '1', FALSE);")
    return sql.getvalue()


@ui.op()
def escala_make_script(dsl: str, inserts: str, migration_file: MigrationFile) -> str:
    with open(migration_file.fileName, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return migration_file.fileName


@ui.op()
def escala_migration(script: str, database: Database) -> bool:
    with open(script, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


@ui.ops()
@ui.graph()
def escala_migrations():
    dsl = escala_create_dsl()
    inserts = escala_create_inserts(escala_load_csv())
    escala_migration(escala_make_script(dsl, inserts))
