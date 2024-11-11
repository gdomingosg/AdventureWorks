with
    order_header as (
        select *
        from {{ ref('stg_salesorderheader') }}
    )

    , order_detail as (
        select *
        from {{ ref('stg_salesorderdetail') }}
    )

    , metricas as (
        select 
            order_detail.pk_detalhe_pedido
            , order_detail.fk_pedido
            , order_detail.fk_produto
            , order_header.fk_cliente
            , order_header.fk_endereco_cobranca
            , order_header.fk_endereco_entrega
            , order_header.fk_cartao_credito
            , order_header.data_pedido
            , order_header.data_vencimento
            , order_header.data_envio
            , order_detail.quantidade
            , order_detail.preco_unitario
            , order_detail.desconto
            , order_header.valor_imposto
            , valor_imposto / (count(1) over(partition by order_header.pk_pedido)) as valor_imposto_rateado
            , order_header.valor_frete
            , valor_frete / (count(1) over(partition by order_header.pk_pedido)) as valor_frete_rateado
            , order_header.valor_total as valor_total_pedido
            , order_header.status_sales
            , order_header.aprovacao_cartao_credito
            , order_detail.preco_unitario * order_detail.quantidade as faturamento_bruto
            , (order_detail.preco_unitario * order_detail.quantidade) * (1-order_detail.desconto) as faturamento_liquido
        from order_detail
        left join order_header
            on order_detail.fk_pedido = order_header.pk_pedido
    )

    , metricas_final as (
        select 
            *
            , faturamento_liquido + valor_frete_rateado + valor_imposto_rateado as valor_total_produto
        from metricas 
    )

select *
from metricas_final