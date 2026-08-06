{{ config(
    materialized='table'
) }}

SELECT

    formatted_experience_level,

    location,

    AVG(normalized_salary) AS average_salary,

    MIN(min_salary) AS minimum_salary,

    MAX(max_salary) AS maximum_salary,

    COUNT(*) AS total_jobs

FROM {{ ref('silver_postings') }}

WHERE normalized_salary IS NOT NULL

GROUP BY

    formatted_experience_level,

    location