{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_customers_h'
src_hashdiff: 'hd_customers_s'
src_payload:
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
source_model: 'stg_customers'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey'),
                        src_hashdiff=metadata_dict.get('src_hashdiff'),
                        source_model=metadata_dict.get('source_model'),
                        src_payload=metadata_dict.get('src_payload')) }}