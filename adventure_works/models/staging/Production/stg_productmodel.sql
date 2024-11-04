with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'productmodel') }}
    )

    , renomeacao as (
        select
            productmodelid as pk_modelo_produto
            , [name] as nome_modelo_produto
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao