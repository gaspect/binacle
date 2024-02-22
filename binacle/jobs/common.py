from binacle.ui import ui
from binacle.sql import connection
from functools import partial as builtin_partial, cached_property
from urllib import parse


@ui.resource(name="database", url="postgresql://postgres:postgres@localhost:5432/postgres")
class Database:
    url: str

    @cached_property
    def destructure(self):
        return parse.urlparse(self.url)

    @property
    def name(self):
        return self.destructure.path[1:]

    @property
    def username(self):
        return self.destructure.username

    @property
    def password(self):
        return self.destructure.password

    @property
    def hostname(self):
        return self.destructure.hostname

    @property
    def port(self):
        return self.destructure.port


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
