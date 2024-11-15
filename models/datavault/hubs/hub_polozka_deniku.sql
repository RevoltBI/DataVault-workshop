{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
hashkey: 'hk_polozka_deniku_h'
business_keys: 
    - 'IDPOL'
source_models: 
    - name: stg_vydaje_mzdy_plan
    - name: stg_vydaje_mzdy_skutecnost
    - name: stg_vydaje_mzdy_skutecnost
      hk_column: 'hk_polozka_deniku_plan_h'
      bk_columns:
          - IDREFPOL
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey'),
                    business_keys=metadata_dict.get('business_keys'),
                    source_models=metadata_dict.get('source_models')
                    ) }}