with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'productsubcategory') }}
    )

    , renomeacao as (
        select
            productsubcategoryid as id_subcategoria_produto
            , productcategoryid as id_categoria_produto
            , [name] as nome_subcategoria
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao