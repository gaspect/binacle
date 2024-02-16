from binacle.ui import ui


@ui.resource(name="database", url="postgresql://postgres:postgres@localhost:5432/postgres")
class Database:
    url: str


@ui.resource(name="migration_file", fileName="assets/migrations/v2_nanda_clase.sql")
class MigrationFile:
    fileName: str
