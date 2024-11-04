with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'countryregion') }}
    )

    , renomeacao as (
        select
            countryregioncode as pk_pais_regiao 
            , [name] as nome_pais
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao