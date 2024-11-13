SELECT * 
        ,CURRENT_DATE() AS "edwLoadDate"
        ,'t' AS "edwRecordSource"
FROM {{{{ source('matastav', 't_zamestnanci') }}}}