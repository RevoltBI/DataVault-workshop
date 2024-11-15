{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_pobocka'
ldts: 'EDWLOADDATE'                 # loaddatetimestamp
rsrc: 'EDWRECORDSOURCE'             # record source
hashed_columns: 
    hk_pobocka_h:
        - 'IDPOB'
    hd_pobocka_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'ZKRATKA'
            - 'NAZEV'
            - 'ULICE'
            - 'MESTO'
            - 'PSC'
            - 'TELEFON'
            - 'FAX'
            - 'EMAIL'
            - 'NAJEM'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}