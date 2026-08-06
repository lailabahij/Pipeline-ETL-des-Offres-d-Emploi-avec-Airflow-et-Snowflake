{{ config(materialized='table') }}

SELECT DISTINCT

    "company_id" AS company_id,

    TRIM("name") AS company_name,

    TRIM("description") AS description,

    "company_size" AS company_size,

    UPPER(TRIM("state")) AS state,

    UPPER(TRIM("country")) AS country,

    CASE
        WHEN "city" IS NULL THEN NULL
        WHEN TRIM("city") IN ('', '0', '-') THEN NULL
        ELSE INITCAP(TRIM("city"))
    END AS city,

    TRIM("address") AS address

FROM {{ source('bronze', 'COMPANIES_RAW') }}

WHERE "company_id" IS NOT NULL
AND "name" IS NOT NULL