with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'customer') }}
    )

    , renomeacao as (
        select
            cast(customerid as int) as pk_cliente
            , cast(personid as int) as fk_usuario
            , cast(storeid as int) as fk_loja
            , cast(territoryid as int) as fk_territorio
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao