from binacle.ui import ui


@ui.resource(name="database", url="postgresql://postgres:postgres@localhost:5432/postgres")
class Database:
    url: str
