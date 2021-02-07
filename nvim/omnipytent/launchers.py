from omnipytent.ext.terminal import TERMINAL_PANEL_WITHOUT_AUTOCLOSE
from omnipytent import *
import yaml
import json


last_run_config = None


@task
def rerun_vimspector():
    global last_run_config
    if last_run_config == None:
        return
    run_vimspector(last_run_config)


@task
def vimspector():
    with open(".vimspector.json", "r") as file:
        vimspector_config = json.load(file)

    entries = [
        value["configuration"] for value in vimspector_config["configurations"].values()
    ]

    entry = yield CHOOSE(
        entries,
        fmt="{name}".format_map,
        preview=lambda entry: yaml.dump(entry, default_flow_style=False),
    )
    global last_run_config
    last_run_config = entry
    run_vimspector(entry)


def run_vimspector(config):
    TERMINAL_PANEL_WITHOUT_AUTOCLOSE(
        config["type"], config["program"], *config["args"], size=15
    )
