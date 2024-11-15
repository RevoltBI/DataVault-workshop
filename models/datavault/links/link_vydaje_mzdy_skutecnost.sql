{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_vydaje_mzdy_skutecnost_l'
foreign_hashkeys: 
    - 'hk_polozka_deniku_h'
    - 'hk_zamestnanec_h'
    - 'hk_polozka_deniku_plan_h'
source_models: 
    - name: stg_vydaje_mzdy_skutecnost
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey'),
        foreign_hashkeys=metadata_dict.get('foreign_hashkeys'),
        source_models=metadata_dict.get('source_models')
        ) }}