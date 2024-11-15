{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_pobocka_h'
business_keys: 
    - 'IDPOB'
source_models: 
    - name: stg_pobocka
    - name: stg_zamestnanec
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')
                    ) }}