import os
import io
from binacle.ui import ui
from binacle.jobs.common import migration

unir_ficheros = ui.op(name="NANDA_UNIR_MIGRACIONES")(migration)


@ui.op(name="LEER_MIGRACIONES")
def leer_ficheros():
    builtup = io.StringIO()
    for filename in sorted(os.listdir("assets/migrations/nanda")[:-1]):
        with open(filename) as f:
            builtup.write(f.read())
    return builtup.getvalue()


@ui.ops()
@ui.graph(name="V10_NANDA_UNIR_MIGRACIONES")
def nanda_unir():
    unir_ficheros(leer_ficheros())
