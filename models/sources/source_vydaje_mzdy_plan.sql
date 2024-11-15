SELECT
    *
    ,CURRENT_TIMESTAMP() AS edwLoadDate -- v idealnim pripade timestamp
    ,'t_vydaje_mzdy_plan' AS edwRecordSource -- nazev tabulky, ze ktere radek pochazi
FROM {{ source('matastav','T_VYDAJE_MZDY_PLAN')}}