with
    produto as (
        select *
        from {{ ref('stg_products') }}
    )

    , categoria as (
        select *
        from {{ ref('stg_productcategory') }}
    )

    , subcategoria as (
        select *
        from {{ ref('stg_productsubcategory') }}
    )

    , modelo as (
        select *
        from {{ ref('stg_productmodel') }}
    )

    , joined as (
        select 
            produto.pk_produto
            , produto.nome_produto
            , categoria.nome_categoria_produto
            , subcategoria.nome_subcategoria as nome_subcategoria_produto
            , modelo.nome_modelo_produto
        from produto
        left join subcategoria
            on produto.fk_subcategoria = subcategoria.pk_subcategoria_produto
        left join categoria
            on subcategoria.fk_categoria_produto = categoria.pk_categoria_produto
        left join modelo
            on produto.fk_modelo_produto = modelo.pk_modelo_produto

    )

select *
from joined