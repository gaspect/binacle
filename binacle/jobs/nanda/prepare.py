from datetime import datetime
import os
from binacle.ui import ui
from binacle.jobs.common import Database, script, partial, migration
from binacle.sql import connection

preparacion_script = ui.op(name="NANDA_PREPARACION_SCRIPT")(
    partial(script, file="assets/migrations/nanda/v0_nanda_preparacion.sql"))
preparacion_migration = ui.op(name="PREPARACION_MIGRACIONES")(migration)


@ui.op(name="NANDA_PREPARACION_SALVAR_DB")
def preparacion_database_backup(database: Database):
    os.system(
        f'pg_dumpall -U {database.username} -h {database.hostname} -p {database.port} > assets/backups/{str(datetime.now())}.sql')


@ui.op(name="NANDA_PREPARACION_BORRAR_ANTIGUO")
def preparacion_database_delete(database: Database):
    pout, _ = connection(database.url)
    pin, sql = connection()

    for row in pout(
            "SELECT tablename FROM pg_catalog.pg_tables where schemaname='estandares' and tablename ~ 'nanda.*' ;"):
        pin(f"DROP TABLE IF EXISTS estandares.{row.tablename} CASCADE;")
    return sql.getvalue()


@ui.op(name="NANDA_PREPARACION_DLS")
def preparacion_dsl(database: Database):
    return ""  # We need this for reuse the script creation operation


@ui.ops()
@ui.graph(name="V0_NANDA_PREPARAR_DB")
def preparar():
    preparacion_database_backup()
    preparacion_migration(preparacion_script(preparacion_dsl(), preparacion_database_delete()))
