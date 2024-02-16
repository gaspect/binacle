from .dominio_migrations import *
from .clase_migration import *
from .escala_migration import *
from .tipo_escala_migration import *
from .noc_migration import *
from binacle.ui import ui, FilesystemIOManager


@ui.resource(name="io_manager", base_dir="assets/dagster/data")
class Manager(FilesystemIOManager):
    ...
