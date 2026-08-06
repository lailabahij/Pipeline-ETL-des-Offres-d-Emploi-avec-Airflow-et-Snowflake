{{ config(
    materialized='table'
) }}

-- ==========================================================
-- Modèle : silver_postings
-- Description :
-- Nettoyage, standardisation et déduplication des offres
-- d'emploi provenant de la couche Bronze.
-- ==========================================================

WITH source AS (

    -- Chargement des données brutes
    SELECT *
    FROM {{ source('bronze', 'POSTINGS_RAW') }}

),

cleaned AS (

    SELECT

        /* ==================================================
           Identifiants
        ================================================== */

        CAST("job_id" AS BIGINT) AS job_id,
        CAST("company_id" AS BIGINT) AS company_id,

        /* ==================================================
        Entreprise
        - Utiliser le nom existant.
        - Sinon, tenter de l'extraire depuis la description.
        - Si aucune extraction n'est possible,
            remplacer par "Unknown".
        ================================================== */

        COALESCE(

            /* Nom déjà présent */
            NULLIF(TRIM("company_name"), ''),

            /* Exemple : "At Microsoft" */
            REGEXP_SUBSTR(
                TRIM("description"),
                'At ([^,\\n\\.]+)',
                1,
                1,
                'e',
                1
            ),

            /* Exemple : "Company Description: Microsoft ..." */
            REGEXP_SUBSTR(
                TRIM("description"),
                'Company Description:?\\s*([^\\n\\.]+)',
                1,
                1,
                'e',
                1
            ),

            /* Exemple : "Microsoft is looking for..." */
            REGEXP_SUBSTR(
                TRIM("description"),
                '^([^\\n]+?) is ',
                1,
                1,
                'e',
                1
            ),

            /* Valeur par défaut */
            'Unknown'

        ) AS company_name,

        /* ==================================================
           Informations sur le poste
        ================================================== */

        TRIM("title") AS title,

        TRIM("description") AS description,

        /* ==================================================
           Informations salariales
        ================================================== */

        CAST("min_salary" AS DOUBLE) AS min_salary,

        CAST("max_salary" AS DOUBLE) AS max_salary,

        CASE
            WHEN "med_salary" IS NULL
                 AND "min_salary" IS NOT NULL
                 AND "max_salary" IS NOT NULL
            THEN (
                    CAST("min_salary" AS DOUBLE)
                  + CAST("max_salary" AS DOUBLE)
                 ) / 2

            ELSE CAST("med_salary" AS DOUBLE)

        END AS med_salary,

        CAST("normalized_salary" AS DOUBLE) AS normalized_salary,

        /* ==================================================
           Informations de rémunération
        ================================================== */

        COALESCE(
            TRIM("pay_period"),
            'Unknown'
        ) AS pay_period,

        COALESCE(
            TRIM("currency"),
            'Unknown'
        ) AS currency,

        COALESCE(
            TRIM("compensation_type"),
            'Unknown'
        ) AS compensation_type,

        /* ==================================================
           Localisation
        ================================================== */

        TRIM("location") AS location,

        /* ==================================================
           Type de travail
        ================================================== */

        COALESCE(
            TRIM("formatted_work_type"),
            'Unknown'
        ) AS formatted_work_type,

        CASE
            WHEN "remote_allowed" = 1 THEN TRUE
            ELSE FALSE
        END AS remote_allowed,

        /* ==================================================
           Niveau d'expérience
        ================================================== */

        COALESCE(
            TRIM("formatted_experience_level"),
            'Not Specified'
        ) AS formatted_experience_level,

        /* ==================================================
           Compétences
        ================================================== */

        COALESCE(
            TRIM("skills_desc"),
            'Not Specified'
        ) AS skills_desc,

        /* ==================================================
           Activité de l'offre
        ================================================== */

        COALESCE(
            CAST("views" AS INTEGER),
            0
        ) AS views,

        COALESCE(
            CAST("applies" AS INTEGER),
            0
        ) AS applies,

        COALESCE(
            TRIM("application_type"),
            'Unknown'
        ) AS application_type,

        CASE
            WHEN "sponsored" = 1 THEN TRUE
            ELSE FALSE
        END AS sponsored,

                /* ==================================================
        Dates
        Conversion des timestamps Unix (millisecondes)
        en TIMESTAMP_NTZ.
        ================================================== */

        TO_TIMESTAMP_NTZ(
            CAST("listed_time" AS BIGINT),
            3
        ) AS listed_time,

        TO_TIMESTAMP_NTZ(
            CAST("original_listed_time" AS BIGINT),
            3
        ) AS original_listed_time,

        TO_TIMESTAMP_NTZ(
            CAST("expiry" AS BIGINT),
            3
        ) AS expiry,

        TO_TIMESTAMP_NTZ(
            CAST("closed_time" AS BIGINT),
            3
        ) AS closed_time

    FROM source

    /* ==================================================
       Conservation uniquement des enregistrements
       contenant les informations essentielles.
    ================================================== */

    WHERE
        "job_id" IS NOT NULL
        AND "title" IS NOT NULL
        AND "description" IS NOT NULL
        AND "location" IS NOT NULL

),

deduplicated AS (

    /* ==================================================
       Suppression des doublons.
       Conservation de la version la plus récente
       pour chaque offre d'emploi.
    ================================================== */

    SELECT *

    FROM cleaned

    QUALIFY ROW_NUMBER() OVER (

        PARTITION BY job_id

        ORDER BY listed_time DESC NULLS LAST

    ) = 1

)

-- ==========================================================
-- Résultat final de la couche Silver
-- ==========================================================

SELECT *

FROM deduplicated