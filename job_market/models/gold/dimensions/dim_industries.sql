{{ config(
    materialized='table'
) }}

SELECT

    industry_id,
    industry_name

FROM {{ ref('silver_industries') }}