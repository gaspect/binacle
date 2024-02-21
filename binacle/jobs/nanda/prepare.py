import psycopg
from datetime import datetime

from binacle.ui import ui
from binacle.jobs.common import Database, script, partial, migration
from binacle.sql import connection

preparacion_script = ui.op(name="PREPARACION_SCRIPT")(
    partial(script, file="assets/migrations/nanda/v0_preparacion.sql"))
preparacion_migration = ui.op(name="PREPARACION_MIGRACIONES")(migration)


@ui.op(name="DATABASE_BACKUP")
def database_backup(database: Database):
    with psycopg.connect(dbname=database.name,
                         user=database.username,
                         password=database.password,
                         host=database.hostname,
                         port=database.port
                         ) as conn:
        cursor = conn.cursor()
        cursor.execute(f'BACKUP DATABASE {database.name} TO '
                       f'assets/backups/backup-{datetime.now()}.sql')


@ui.op(name="OLD_NANDA_DELETE")
def database_delete(database: Database):
    pout, _ = connection(database.url)
    pin, sql = connection()

    for row in pout(
            "SELECT tablename FROM pg_catalog.pg_tables where schemaname='estandares' and tablename ~ 'nanda.*' ;"):
        pin(f"DROP TABLE IF EXISTS {row.tablename}")
    return sql


@ui.ops()
@ui.graph(name="V0_PREPARAR_DB")
def prepare():
    database_backup()
    migration(preparacion_script("", database_delete()))