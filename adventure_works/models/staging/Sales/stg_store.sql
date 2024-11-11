with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'store') }}
    )

    , renomeacao as (
        select
            businessentityid as fk_customer
            , name as nome_loja
            , salespersonid as fk_vendedor
            , modifieddate as data_alteracao
        from fonte
    )

select *
from renomeacao