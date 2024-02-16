import os
if __name__ == "__main__":
    os.environ["DAGSTER_HOME"] = os.path.abspath("./assets/dagster/home")
    os.system("dagster dev")
