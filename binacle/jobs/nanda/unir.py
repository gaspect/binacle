import os
import io
from binacle.ui import ui
from binacle.jobs.common import script, partial

unir_ficheros = ui.op(name="NANDA_UNIR_MIGRACIONES")(
    partial(script, file="assets/migrations/nanda/v10_nanda.sql", dsl=""))


@ui.op(name="LEER_MIGRACIONES")
def leer_ficheros():
    builtup = io.StringIO()
    for filename in sorted(os.listdir("assets/migrations/nanda"), key=lambda k: int(k[1:k.find("_")])):
        if not filename.startswith("v10_"):
            with open(f"assets/migrations/nanda/{filename}", encoding="utf-8") as f:
                builtup.write(f.read())
    return builtup.getvalue()


@ui.ops()
@ui.graph(name="V10_NANDA_UNIR_MIGRACIONES")
def nanda_unir():
    unir_ficheros(inserts=leer_ficheros())
