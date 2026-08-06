{{ config(
    materialized='table'
) }}

SELECT

    s.skill_name,

    COUNT(*) AS total_jobs

FROM {{ ref('silver_job_skills') }} js

JOIN {{ ref('silver_skills') }} s

ON js.skill_abr = s.skill_abr

GROUP BY s.skill_name

ORDER BY total_jobs DESC