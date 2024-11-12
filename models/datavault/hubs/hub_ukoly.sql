{{ datavault4dbt.hub(
    hashkey='UKOLY_KEY',  
    business_keys='"idukolu"',  
    source_models={
        'STG_T_UKOLY': {  
            'bk_columns': '"idukolu"',  
            'rsrc_static': 'T'  
        }
    },
    src_ldts='LOAD_DATETIME',  
    src_rsrc='SOURCE'  
) }}
