{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "industry_id" AS industry_id,

    INITCAP(TRIM("industry_name")) AS industry_name

FROM {{ source('bronze', 'INDUSTRIES_RAW') }}

WHERE "industry_id" IS NOT NULL
  AND "industry_name" IS NOT NULL