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
            , listagg(motivo.nome_motivo_venda, ' | ') within group (order by motivo.tipo_motivo_venda) as nome_motivo_venda
            , listagg(motivo.tipo_motivo_venda, ' | ') within group (order by motivo.tipo_motivo_venda) as tipo_motivo_venda
        from pedido
        left join motivo
            on pedido.fk_motivo_venda = motivo.pk_motivo_venda
        group by
            pedido.fk_pedido
    )

    , final as (
        select
            fk_pedido
            , nome_motivo_venda
            , replace(tipo_motivo_venda, 'other | other', 'other') tipo_motivo_venda
            , case 
                when tipo_motivo_venda like '%Promotion%' then 1
                else 0
            end as promotion
            , case 
                when tipo_motivo_venda like '%Other%' then 1
                else 0
            end as other
            , case 
                when tipo_motivo_venda like '%Marketing%' then 1
                else 0
            end as marketing
        from joined
    )

select *
from final