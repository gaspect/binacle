import os
if __name__ == "__main__":
    os.environ["DAGSTER_HOME"] = os.path.abspath("./assets/dagster/home")
    os.environ["PYTHONLEGACYWINDOWSSTDIO"] = str(True)
    try:
        os.system("dagster dev")
    except KeyboardInterrupt:
        print("👋👋👋👋👋👋👋")