{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_customers'
ldts: 'EDWLOADDATE'
rsrc: 'EDWRECORDSOURCE'
hashed_columns: 
    hk_customers_h:
        - 'IDZAK'
    hk_customers_employees_l:
        - 'IDZAK'
        - 'IDZAM'
    hk_employees_h:
        - 'IDZAM'
    hd_customers_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'ICO'
            - 'ZKRATKA'
            - 'NAZEV'
            - 'ULICE'
            - 'MESTO'
            - 'PSC'
            - 'KREDIT'
            - 'TELEFON'
            - 'FAX'
            - 'WWW'
            - 'POZN'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}