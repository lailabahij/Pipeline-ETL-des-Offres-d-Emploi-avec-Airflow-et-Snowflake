{{ config(
    materialized='table'
) }}

SELECT

    job_id,

    company_id,

    listed_time,

    expiry,

    closed_time,

    views,

    applies,

    sponsored,

    remote_allowed,

    formatted_work_type,

    formatted_experience_level

FROM {{ ref('silver_postings') }}