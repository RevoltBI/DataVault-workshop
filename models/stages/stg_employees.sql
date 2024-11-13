{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_employees'
ldts: 'EDWLOADDATE'
rsrc: 'EDWRECORDSOURCE'
hashed_columns: 
    hk_employees_h:
        - 'IDZAM'
    hd_employees_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'PRIJMENI'
            - 'JMENO'
            - 'TITUL'
            - 'PLAT'
            - 'NADRIZENY'
            - 'IDPOB'
            - 'IDFCE'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}