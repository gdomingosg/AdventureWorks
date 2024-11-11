with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'salesorderheader') }}
    )

    , renomeacao as (
        select
            cast(salesorderid as int) as pk_pedido
            , cast(customerid as int) as fk_cliente
            , cast(salespersonid as int) as fk_vendedor
            , cast(territoryid as int) as fk_territorio
            , cast(billtoaddressid as int) as fk_endereco_cobranca
            , cast(shiptoaddressid as int) as fk_endereco_entrega
            , cast(shipmethodid as int) as fk_tipo_entrega
            , cast(creditcardid as int) as fk_cartao_credito
            , cast(currencyrateid as int) as fk_taxa_moeda
            , cast(orderdate as date) as data_pedido
            , cast(duedate as date) as data_vencimento
            , cast(shipdate as date) as data_envio
            , case
                when status = 1 then 'In process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled'
            end as status_sales
            , cast(onlineorderflag as boolean) as pedido_online
            , accountnumber as numero_conta
            , cast(creditcardapprovalcode as varchar) as aprovacao_cartao_credito
            , cast(subtotal as float) as valor_subtotal
            , cast(taxamt as float) as valor_imposto
            , cast(freight as float) as valor_frete
            , cast(totaldue as float) as valor_total
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao