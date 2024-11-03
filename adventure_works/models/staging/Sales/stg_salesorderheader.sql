with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderheader') }}
    )

    , renomeacao as (
        select
            cast(salesorderid as int) as id_pedido
            , cast(revisionnumber as int) as numero_revisao
            , cast(orderdate as date) as data_pedido
            , cast(duedate as date) as data_vencimento
            , cast(shipdate as date) as data_envio
            , cast([status] as varchar) as status
            , cast(onlineorderflag as boolean) as pedido_online
            , purchaseordernumber as numero_ordem_compra
            , accountnumber as numero_conta
            , cast(customerid as int) as id_cliente
            , cast(salespersonid as int) as id_vendedor
            , cast(territoryid as int) as id_territorio
            , cast(billtoaddressid as ) as 
            , cast(shiptoaddressid as ) as 
            , cast(shipmethodid as ) as 
            , cast(creditcardid as ) as 
            , cast(creditcardapprovalcode as ) as 
            , cast(currencyrateid as ) as 
            , cast(subtotal as ) as 
            , cast(taxamt as ) as 
            , cast(freight as ) as 
            , cast(totaldue as ) as 
            , cast(comment as ) as 
            , cast(rowguid as ) as 
            , cast(modifieddate as ) as 
        from fonte
    )

select *
from renomeacao