from .nanda import *
from binacle.ui import ui, FilesystemIOManager


@ui.resource(name="io_manager", base_dir="assets/dagster/data")
class Manager(FilesystemIOManager):
    ...
