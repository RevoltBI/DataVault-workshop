{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_vydaje_mzdy_skutecnost'
ldts: 'EDWLOADDATE'                 # loaddatetimestamp
rsrc: 'EDWRECORDSOURCE'             # record source
hashed_columns: 
    hk_polozka_deniku_h:
        - 'IDPOL'
    hk_zamestnanec_h:
        - 'IDZAM'
    hk_polozka_deniku_plan_h:
        - 'IDREFPOL'
    hk_vydaje_mzdy_skutecnost_l:
        - 'IDPOL'
        - 'IDZAM'
        - 'IDREFPOL'
    hd_vydaje_mzdy_skutecnost_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'DATUM'
            - 'CASTKA'
            - 'DRUH'
            - 'PROTISTRANA'
            - 'UCET'
            - 'POZN'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}