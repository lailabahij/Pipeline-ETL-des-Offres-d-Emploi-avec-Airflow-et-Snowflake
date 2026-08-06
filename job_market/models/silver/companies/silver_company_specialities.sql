{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "company_id" AS company_id,

    INITCAP(TRIM("speciality")) AS speciality

FROM {{ source('bronze', 'COMPANY_SPECIALITIES_RAW') }}

WHERE "company_id" IS NOT NULL
  AND "speciality" IS NOT NULL