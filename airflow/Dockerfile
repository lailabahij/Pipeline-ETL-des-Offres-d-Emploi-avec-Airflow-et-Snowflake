FROM apache/airflow:2.10.4

USER root

RUN apt-get update && apt-get install -y git

USER airflow

RUN pip install --no-cache-dir \
    dbt-core==1.12.0 \
    dbt-snowflake==1.12.0 \
    snowflake-connector-python \
    snowflake-connector-python[pandas] \
    pandas \
    python-dotenv