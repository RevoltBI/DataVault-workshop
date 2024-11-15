{{config(materialized = 'incremental')}}

{%- set yaml_metadata -%}
tracked_hashkey: hk_zamestnanec_l
is_active_alias: 'is_active'
source_model: stg_zamestnanec
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.eff_sat_v0(tracked_hashkey=metadata_dict.get('tracked_hashkey'),
                            source_model=metadata_dict.get('source_model'),
                            is_active_alias=metadata_dict.get('is_active_alias'),
                            src_ldts=metadata_dict.get('src_ldts'),
                            src_rsrc=metadata_dict.get('src_rsrc'),
                            source_is_single_batch=metadata_dict.get('source_is_single_batch'),
                            disable_hwm=metadata_dict.get('disable_hwm')) }}