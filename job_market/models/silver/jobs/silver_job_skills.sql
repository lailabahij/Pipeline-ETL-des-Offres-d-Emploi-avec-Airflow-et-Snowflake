{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    "job_id",

    UPPER(TRIM("skill_abr")) AS skill_abr

FROM {{ source('bronze', 'JOB_SKILLS_RAW') }}

WHERE "job_id" IS NOT NULL
  AND "skill_abr" IS NOT NULL