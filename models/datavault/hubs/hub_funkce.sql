{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_funkce_h'
business_keys: 
    - 'IDFCE'
source_models: 
    - name: stg_zamestnanec
    - name: stg_funkce
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')
                    ) }}