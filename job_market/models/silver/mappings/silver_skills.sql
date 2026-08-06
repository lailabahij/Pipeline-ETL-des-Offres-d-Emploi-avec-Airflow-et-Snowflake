{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    UPPER(TRIM("skill_abr")) AS skill_abr,

    INITCAP(TRIM("skill_name")) AS skill_name

FROM {{ source('bronze', 'SKILLS_RAW') }}

WHERE "skill_abr" IS NOT NULL
  AND "skill_name" IS NOT NULL