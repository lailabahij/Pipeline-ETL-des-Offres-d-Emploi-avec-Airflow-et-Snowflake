{{ config(
    materialized='table'
) }}

SELECT

    c.company_id,
    c.company_name,
    c.description,
    c.company_size,
    c.city,
    c.state,
    c.country,
    c.address,

    i.industry,

    ec.employee_count,
    ec.follower_count

FROM {{ ref('silver_companies') }} c

LEFT JOIN {{ ref('silver_company_industries') }} i

ON c.company_id = i.company_id

LEFT JOIN {{ ref('silver_employee_counts') }} ec

ON c.company_id = ec.company_id