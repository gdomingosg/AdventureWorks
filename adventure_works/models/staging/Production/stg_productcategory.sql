with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'productcategory') }}
    )

    , renomeacao as (
        select
            productcategoryid as pk_categoria_produto
            , [name] as nome_categoria_produto
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao