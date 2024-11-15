{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'hk_zamestnanec_h'
src_hashdiff: 'hd_zamestnanec_s'
src_payload:
    - 'PRIJMENI'
    - 'JMENO'
    - 'TITUL'
    - 'PLAT'
    - 'NADRIZENY'
source_model: 'stg_zamestnanec'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey'),
                        src_hashdiff=metadata_dict.get('src_hashdiff'),
                        source_model=metadata_dict.get('source_model'),
                        src_payload=metadata_dict.get('src_payload')) }}