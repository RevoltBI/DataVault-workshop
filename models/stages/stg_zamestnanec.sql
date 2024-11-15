{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 'source_zamestnanec'
ldts: 'EDWLOADDATE'                 # loaddatetimestamp
rsrc: 'EDWRECORDSOURCE'             # record source
hashed_columns: 
    hk_zamestnanec_h:
        - 'IDZAM'
    hk_pobocka_h:
        - 'IDPOB'
    hk_funkce_h:
        - 'IDFCE'
    hk_zamestnanec_l:
        - 'IDZAM'
        - 'IDPOB'
        - 'IDFCE'
    hd_zamestnanec_s:
        is_hashdiff: true
        use_rtrim: true
        columns:
            - 'PRIJMENI'
            - 'JMENO'
            - 'TITUL'
            - 'PLAT'
            - 'NADRIZENY'
{%- endset -%} 

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model'),
                    ldts=metadata_dict.get('ldts'),
                    rsrc=metadata_dict.get('rsrc'),
                    hashed_columns=metadata_dict.get('hashed_columns')
                    ) }}