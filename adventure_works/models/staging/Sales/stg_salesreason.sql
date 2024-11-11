with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesreason') }}
    )

    , renomeacao as (
        select
            cast(salesreasonid as int) as pk_motivo_venda
            , cast(name as varchar) as nome_motivo_venda
            , cast(reasontype as varchar) as tipo_motivo_venda
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao