{{ config(
    materialized='table'
) }}

SELECT DISTINCT

    CAST(listed_time AS DATE) AS date,

    YEAR(listed_time) AS year,

    MONTH(listed_time) AS month,

    DAY(listed_time) AS day,

    QUARTER(listed_time) AS quarter,

    DAYNAME(listed_time) AS weekday

FROM {{ ref('silver_postings') }}

WHERE listed_time IS NOT NULL