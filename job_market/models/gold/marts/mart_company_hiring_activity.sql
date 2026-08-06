{{ config(
    materialized='table'
) }}

SELECT

    company_name,

    COUNT(job_id) AS total_jobs,

    SUM(views) AS total_views,

    SUM(applies) AS total_applies,

    AVG(views) AS average_views,

    AVG(applies) AS average_applies

FROM {{ ref('silver_postings') }}

GROUP BY company_name

ORDER BY total_jobs DESC