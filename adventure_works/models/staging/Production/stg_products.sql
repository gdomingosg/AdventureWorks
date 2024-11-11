with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'product') }}
    )

    , renomeacao as (
        select 
            	cast(productid as number(38,0)) as pk_produto
                , cast(productsubcategoryid as int) as fk_subcategoria
                , cast(productmodelid as int) as fk_modelo_produto
                , cast(name as varchar) as nome_produto
                , cast(finishedgoodsflag as boolean) as venda_permitida
                , cast(standardcost as float) as preco_custo_produto
                , cast(listprice as float) as preco_venda_produto
                , cast(size as varchar) as tamanho_produto
                , cast(sizeunitmeasurecode as varchar) as unidade_medida_tamanho
                , cast(weightunitmeasurecode as varchar) as unidade_medida_peso
                , cast(weight as number(18, 2)) as peso_produto
                , cast(productline as varchar) as linha_produto
                , cast(class as varchar) as classe_produto
                , cast(style as varchar) as estilo_produto
                , cast(sellstartdate as date) as data_inicio_venda
                , cast(sellenddate as date) as data_fim_venda
                , rowguid
                , cast(modifieddate as varchar) as data_alteracao
        from fonte
    )

select *
from renomeacao