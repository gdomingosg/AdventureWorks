with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesreason') }}
    )

    , renomeacao as (
        select
            cast(salesreasonid as int) as razao_venda_id
            , cast(name as varchar) as nome_razao_venda
            , cast(reasontype as varchar) as tipo_razao_venda
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao