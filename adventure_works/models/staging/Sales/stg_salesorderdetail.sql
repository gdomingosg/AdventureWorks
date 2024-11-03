with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderdetail') }}
    )

    , renomeacao as (
        select
            salesorderid as id_pedido
            , salesorderdetailid as id_detalhe_pedido
            , carriertrackingnumber as numero_rastreamento_transportadora
            , cast(orderqty as quantidade
            , productid as id_produto
            , specialofferid as id_oferta_especial
            , cast(unitprice as numeric(10,2)) as preco_unitario
            , cast(unitpricediscount as numeric(5,2)) as desconto
            , cast(modifieddate as date) as data_alteracao
            , rowguid
        from fonte
    )

select *
from renomeacao