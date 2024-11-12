{{ config(materialized='view') }}

SELECT
    *
    ,{{ dbt_utils.generate_surrogate_key(['"idukolu"']) }} AS UKOLY_KEY -- Vytvoří unikátní klíč pro záznamy v tabulce `matastav`
    ,CURRENT_TIMESTAMP() AS LOAD_DATETIME
    ,NULL AS SOURCE
FROM {{ source('matastav', '"t_ukoly"') }}
