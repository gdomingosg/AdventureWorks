with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderheadersalesreason') }}
    )

    , renomeacao as (
        select
            cast(salesorderid as int) as id_pedido
            , cast(salesreasonid as int) as razao_venda_id
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao