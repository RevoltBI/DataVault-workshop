SELECT
    *
    ,CURRENT_DATE() AS edwLoadDate -- v idealnim pripade timestamp
    ,'t_pobocky' AS edwRecordSource -- nazev tabulky, ze ktere radek pochazi
FROM {{ source('matastav','T_POBOCKY')}}