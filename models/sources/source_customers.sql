SELECT * 
        ,CURRENT_DATE() AS edwLoadDate
        ,'t' AS edwRecordSource
FROM {{ source('matastav', 'T_ZAKAZNICI') }}