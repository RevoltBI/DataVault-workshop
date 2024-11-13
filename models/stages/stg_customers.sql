{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_customers'
ldts: '"edwLoadDate"'
rsrc: '"edwRecordSource"'
hashed_columns: 
    hk_customers_h:
        - '"idzak"'
    hd_customers_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - '"ICO"'
            - '"Zkratka"'
            - '"Nazev"'
            - '"Ulice"'
            - '"Mesto"'
            - '"PSC"'
            - '"Kredit"'
            - '"Telefon"'
            - '"Fax"'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get(source_model),
                    ldts=metadata_dict.get(ldts),
                    rsrc=metadata_dict.get(rsrc),
                    hashed_columns=metadata_dict.get(hashed_columns)
                    ) }}