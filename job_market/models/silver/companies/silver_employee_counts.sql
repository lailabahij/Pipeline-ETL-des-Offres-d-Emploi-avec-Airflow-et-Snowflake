{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "company_id" AS company_id,

    "employee_count" AS employee_count,

    "follower_count" AS follower_count,

    TO_TIMESTAMP("time_recorded") AS time_recorded

FROM {{ source('bronze', 'EMPLOYEE_COUNTS_RAW') }}

WHERE "company_id" IS NOT NULL
  AND "employee_count" IS NOT NULL