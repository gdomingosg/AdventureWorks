with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'customer') }}
    )

    , renomeacao as (
        select
            customerid as id_cliente
            , personid as id_usuario
            , storeid as id_loja
            , territoryid as id_territorio
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao