with
    motivo as (
        select *
        from {{ ref('stg_salesreason') }}
    )

    , pedido as (
        select *
        from {{ ref('stg_salesorderheadersalesreason') }}
    )

    , joined as (
        select
            pedido.fk_pedido
            , motivo.nome_motivo_venda
            , motivo.tipo_motivo_venda
        from pedido
        left join motivo
            on pedido.fk_motivo_venda = motivo.pk_motivo_venda
    )

select *
from joined
