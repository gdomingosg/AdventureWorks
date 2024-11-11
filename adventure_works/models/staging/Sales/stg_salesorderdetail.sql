with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderdetail') }}
    )

    , renomeacao as (
        select
            salesorderdetailid as pk_detalhe_pedido
            , salesorderid as fk_pedido
            , productid as fk_produto
            , specialofferid as fk_oferta_especial
            , carriertrackingnumber as numero_rastreamento_transportadora
            , cast(orderqty as int) as quantidade
            , cast(unitprice as numeric(15,4)) as preco_unitario
            , cast(unitpricediscount as numeric(5,2)) as desconto
            , cast(modifieddate as date) as data_alteracao
            , rowguid
        from fonte
    )

select *
from renomeacao