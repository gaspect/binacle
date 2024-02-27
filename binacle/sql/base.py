from io import StringIO
from sqlalchemy import create_engine
from sqlalchemy import text
import typing


def connection(url=None) -> typing.Tuple[typing.Callable, StringIO]:
    sql_store = StringIO()

    def executor(query):
        sql_store.write(query + "\n")
        return None

    if url:
        sql_engine = create_engine(url)

        def executor(query):
            sql_store.write(query + "\n")
            with sql_engine.begin() as conn:
                return conn.execute(text(query))

        return executor, sql_store

    return executor, sql_store
