{{ config(
    materialized='table'
) }}

SELECT

    job_id,

    company_id,

    min_salary,

    med_salary,

    max_salary,

    normalized_salary,

    pay_period,

    currency,

    compensation_type

FROM {{ ref('silver_postings') }}

WHERE normalized_salary IS NOT NULL