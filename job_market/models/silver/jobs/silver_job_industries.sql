{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "job_id",

    INITCAP(TRIM("industry_id")) AS industry_id

FROM {{ source('bronze', 'JOB_INDUSTRIES_RAW') }}

WHERE"job_id"IS NOT NULL
  AND "industry_id" IS NOT NULL