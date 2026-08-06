from airflow import DAG
from airflow.operators.bash import BashOperator

from datetime import datetime, timedelta


DBT_PROJECT_PATH="/opt/airflow/job_market"


default_args={
    "owner":"data_engineer",
    "start_date":datetime(2026,1,1),
    "retries":2,
    "retry_delay":timedelta(minutes=5)
}


with DAG(
    dag_id="job_market_pipeline",
    default_args=default_args,
    schedule="@daily",
    catchup=False
) as dag:


    load_bronze = BashOperator(

        task_id="load_data_to_bronze",

        bash_command="""

        python /opt/airflow/job_market/scripts/load_bronze.py

        """

    )


    dbt_silver = BashOperator(
        task_id="run_dbt_silver",
        bash_command=f"""
        cd {DBT_PROJECT_PATH}
        dbt run --select silver --no-partial-parse
        """
    )


    dbt_gold = BashOperator(
    task_id="run_dbt_gold",
    bash_command=f"""
    cd {DBT_PROJECT_PATH}
    dbt run --select gold --no-partial-parse
    """
    )


    load_bronze >> dbt_silver >> dbt_gold