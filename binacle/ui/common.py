import dagster
from dagster._config.pythonic_config import ConfigurableResourceFactory
from typing import Callable


class _MetaValue(dagster.MetadataValue):
    @staticmethod
    def sql(sql: str):
        return dagster.MetadataValue.md(f"```sql\n {sql}\n```")


class _Dagster:
    def __init__(self):
        self._jobs = []
        self._assets = []
        self._resource = {
            "io_manager": dagster.FilesystemIOManager(base_dir="data")
        }
        self.Output = dagster.Output
        self.MaterializationResult = dagster.MaterializeResult
        self.MetadataValue = _MetaValue

    def __enter__(self):
        return self

    def assets(self, name=None, **kwargs):
        def flow_decorator(function: Callable[[], list[Callable]]):
            self._jobs.append(
                dagster.define_asset_job(name=name or function.__name__,
                                         selection=[f.__name__ for f in function()]))
            return function

        return flow_decorator

    def ops(self, **kwargs):
        def job_decorator(function):
            """
            :type function: object
            """
            if isinstance(function, dagster.GraphDefinition):
                job = function.to_job(**kwargs)
                self._jobs.append(job)
                return function
            else:
                to_return = dagster.job(function, **kwargs)
                self._jobs.append(to_return)
                return to_return

        return job_decorator

    @staticmethod
    def graph(**kwargs):
        def graph_decorator(function):
            if "name" in kwargs:
                name = kwargs.pop("name")
                fname = function.__name__
                function.__name__ = name
                g = dagster.graph(compose_fn=function, **kwargs)
                function.__name__ = fname
                return g
            return dagster.graph(compose_fn=function, **kwargs)

        return graph_decorator

    def resource(self, name: str = None, middlewares: list = None, **defaults):
        def resource_decorator(klass):
            if not issubclass(klass, ConfigurableResourceFactory):
                klass = type(f"{klass.__name__}Resource", (klass, dagster.ConfigurableResource), {})

            instance = klass(**defaults)

            if middlewares:
                for middleware in middlewares:
                    instance = middleware(instance)
            self._resource[name or klass.__name__] = instance
            return klass

        return resource_decorator

    def asset(self, **kwargs):
        def asset_decorator(function):
            if "name" in kwargs:
                name = kwargs.pop("name")
                fname = function.__name__
                function.__name__ = name
                new_asset = dagster.asset(compute_fn=function, **kwargs)
                function.__name__ = fname
            else:
                new_asset = dagster.asset(compute_fn=function, **kwargs)
            self._assets.append(new_asset)
            return function

        return asset_decorator

    @staticmethod
    def op(**kwargs):
        def op_decorator(function):
            if "name" in kwargs:
                name = kwargs.pop("name")
                fname = function.__name__
                function.__name__ = name
                o = dagster.op(compute_fn=function, **kwargs)
                function.__name__ = fname
                return o
            return dagster.op(compute_fn=function, **kwargs)

        return op_decorator

    def __call__(self):
        return dagster.Definitions(
            jobs=list(self._jobs),
            assets=list(self._assets),
            resources=self._resource
        )


ui = _Dagster()

FilesystemIOManager = dagster.FilesystemIOManager
