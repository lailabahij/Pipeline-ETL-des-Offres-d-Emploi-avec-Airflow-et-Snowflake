{{ config(
    materialized='table'
) }}

SELECT

    s.skill_abr,
    s.skill_name

FROM {{ ref('silver_skills') }} s