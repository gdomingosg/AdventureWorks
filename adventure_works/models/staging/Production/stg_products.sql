with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'product') }}
    )

    renomeacao as (
        select 
            	cast(productid as number(38,0) as id_produto
                , cast(name as varchar) as nome_produto
                , cast(finishedgoodsflag as boolean) as
                , cast(reorderpoint as number) as
                , cast(standardcost as float) as
                , cast(listprice as float) as
                , cast(size as varchar) as
                , cast(sizeunitmeasurecode as varchar) as
                , cast(weightunitmeasurecode as varchar) as
                , cast(weight as float,) as
                , cast(productline as varchar) as
                , cast(class as varchar) as
                , cast(style as varchar) as
                , cast(productsubcategoryid as number(38,0)) as
                , cast(productmodelid as number(38,0)) as
                , cast(sellstartdate as varchar) as
                , cast(sellenddate as varchar) as
                , cast(discontinueddate as number(38,0)) as
                , cast(rowguid as varchar) as
                , cast(modifieddate as varchar) as
        from fonte
    )

select *
from renomeacao