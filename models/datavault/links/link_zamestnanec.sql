{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
link_hashkey: 'hk_zamestnanec_l'
foreign_hashkeys: 
    - 'hk_zamestnanec_h'
    - 'hk_pobocka_h'
    - 'hk_funkce_h'
source_models: 
    - name: stg_zamestnanec
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey'),
        foreign_hashkeys=metadata_dict.get('foreign_hashkeys'),
        source_models=metadata_dict.get('source_models')
        ) }}