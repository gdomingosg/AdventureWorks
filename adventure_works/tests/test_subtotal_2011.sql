/*
    Este teste garante que as vendas de 2011 estão
    de acordo com o valor de $12.646.112,16 auditado
    pela contabilidade. 
    
*/

with
    header as (
        select
            pk_pedido
            , data_pedido
        from {{ ref('stg_salesorderheader') }}
    )

    , detail as (
        select
            fk_pedido
            , (preco_unitario * quantidade) as faturamento_bruto
        from {{ ref('stg_salesorderdetail') }}
    )

    , vendas_2011 as (
        select 
            sum(detail.faturamento_bruto) as faturamento_bruto
        from header
        left join detail on header.pk_pedido = detail.fk_pedido
        where header.data_pedido between '2011-01-01' and '2011-12-31'
    ) -- $12.646.112,16

select *
from vendas_2011
where faturamento_bruto not between 12646112.15 and 12646112.20