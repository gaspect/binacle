from .dominio_migrations import *
from .clase_migration import *
from binacle.ui import ui, FilesystemIOManager


@ui.resource(name="io_manager", base_dir="assets/data")
class Manager(FilesystemIOManager):
    ...
