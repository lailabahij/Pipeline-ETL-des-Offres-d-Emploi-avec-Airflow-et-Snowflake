{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "job_id" AS job_id,

    "inferred" AS inferred,

    INITCAP(TRIM("type")) AS benefit_type

FROM {{ source('bronze', 'BENEFITS_RAW') }}

WHERE "job_id" IS NOT NULL
  AND "type" IS NOT NULL