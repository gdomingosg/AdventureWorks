with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'productsubcategory') }}
    )

    , renomeacao as (
        select
            cast(productsubcategoryid as int) as pk_subcategoria_produto
            , cast(productcategoryid as int) as fk_categoria_produto
            , cast(name as varchar) as nome_subcategoria
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao