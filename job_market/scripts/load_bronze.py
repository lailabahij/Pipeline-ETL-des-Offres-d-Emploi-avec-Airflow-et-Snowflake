import os
import sys
import pandas as pd

from snowflake.connector.pandas_tools import write_pandas

# ===============================
# Racine du projet
# ===============================

BASE_DIR = os.path.dirname(
    os.path.dirname(os.path.abspath(__file__))
)

sys.path.append(BASE_DIR)

# ===============================
# Connexion Snowflake
# ===============================

from scripts.config.snowflake_connection import conn

# ===============================
# Dossier contenant les CSV
# ===============================

DATA_FOLDER = os.path.join(BASE_DIR, "data")

print(f"Lecture des données depuis : {DATA_FOLDER}")

# ===============================
# Parcours des fichiers CSV
# ===============================

for root, dirs, files in os.walk(DATA_FOLDER):

    for file in files:

        if file.endswith(".csv"):

            file_path = os.path.join(root, file)

            table_name = (
                os.path.splitext(file)[0].upper() + "_RAW"
            )

            print(f"\nLecture : {file_path}")

            df = pd.read_csv(file_path)

            success, nchunks, nrows, _ = write_pandas(
                conn=conn,
                df=df,
                table_name=table_name,
                auto_create_table=True,
                overwrite=True
            )

            if success:
                print(f"Table {table_name} chargée ({nrows} lignes)")
            else:
                print(f"Erreur lors du chargement de {table_name}")

# ===============================
# Fermeture de la connexion
# ===============================

conn.close()

print("\nToutes les tables Bronze ont été chargées avec succès.")