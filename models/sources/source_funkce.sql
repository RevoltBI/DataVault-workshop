SELECT
    *
    ,CURRENT_TIMESTAMP() AS edwLoadDate -- v idealnim pripade timestamp
    ,'t_funkce' AS edwRecordSource -- nazev tabulky, ze ktere radek pochazi
FROM {{ source('matastav','T_FUNKCE')}}