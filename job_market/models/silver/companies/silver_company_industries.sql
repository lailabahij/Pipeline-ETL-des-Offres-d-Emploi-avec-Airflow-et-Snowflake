{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "company_id" AS company_id,

    INITCAP(TRIM("industry")) AS industry

FROM {{ source('bronze', 'COMPANY_INDUSTRIES_RAW') }}

WHERE "company_id" IS NOT NULL
  AND "industry" IS NOT NULL