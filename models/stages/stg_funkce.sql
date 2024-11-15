{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_funkce'
ldts: 'EDWLOADDATE'                 # loaddatetimestamp
rsrc: 'EDWRECORDSOURCE'             # record source
hashed_columns: 
    hk_funkce_h:
        - 'IDFCE'
    hd_funkce_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'NAZEV'
            - 'OHODNOCENI'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}