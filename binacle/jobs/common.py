from binacle.ui import ui
from binacle.sql import connection
from functools import partial as builtin_partial


@ui.resource(name="database", url="postgresql://postgres:postgres@localhost:5432/postgres")
class Database:
    url: str


def script(dsl, inserts, file):
    with open(file, mode="w", encoding="utf-8") as f:
        f.write(dsl + inserts)
    return file


def migration(s: str, database: Database) -> bool:
    with open(s, mode="r", encoding="utf-8") as f:
        postgres, _ = connection(database.url)
        postgres(f.read())
    return True


def partial(function, *args, **kwargs):
    obj = builtin_partial(function, *args, **kwargs)
    obj.__name__ = function.__name__
    return obj
