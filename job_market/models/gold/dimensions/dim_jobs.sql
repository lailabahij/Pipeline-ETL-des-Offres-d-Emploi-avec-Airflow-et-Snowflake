{{ config(
    materialized='table'
) }}

SELECT

    job_id,
    title,
    description,
    location,
    formatted_work_type,
    formatted_experience_level,
    remote_allowed,
    application_type

FROM {{ ref('silver_postings') }}