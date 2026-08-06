{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "salary_id",

    "job_id",

    COALESCE(
        "max_salary",
        MEDIAN("max_salary")OVER (PARTITION BY "pay_period")
    ) AS "max_salary",

    COALESCE(
        "med_salary",
        MEDIAN("med_salary") OVER (PARTITION BY "pay_period")
    ) AS"med_salary",

    COALESCE(
        "min_salary",
        MEDIAN("min_salary") OVER (PARTITION BY "pay_period")
    ) AS "min_salary",

    UPPER(TRIM("pay_period")) AS "pay_period",

    UPPER(TRIM("currency")) AS "currency",

    UPPER(TRIM("compensation_type")) AS "compensation_type"

FROM {{ source('bronze', 'SALARIES_RAW') }}

WHERE "salary_id" IS NOT NULL
  AND "job_id" IS NOT NULL