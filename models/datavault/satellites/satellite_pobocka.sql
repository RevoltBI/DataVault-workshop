{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_pobocka_h'
src_hashdiff: 'hd_pobocka_s'
src_payload:
    - 'ZKRATKA'
    - 'NAZEV'
    - 'ULICE'
    - 'MESTO'
    - 'PSC'
    - 'TELEFON'
    - 'FAX'
    - 'EMAIL'
    - 'NAJEM'
source_model: 'stg_pobocka'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey'),
                        src_hashdiff=metadata_dict.get('src_hashdiff'),
                        source_model=metadata_dict.get('source_model'),
                        src_payload=metadata_dict.get('src_payload')) }}