with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderheadersalesreason') }}
    )

    , renomeacao as (
        select
            cast(salesorderid as int) as fk_pedido
            , cast(salesreasonid as int) as fk_motivo_venda
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao