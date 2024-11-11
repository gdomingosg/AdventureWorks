with
    fonte as (
        select *
        from {{ source('adventure_works', 'address') }}
    )

    , renomeacao as (
        select 
            addressid as pk_endereco
            , stateprovinceid as fk_estado_provincia
            , addressline1 as nome_endereco_1
            , addressline2 as nome_endereco_2
            , city as nome_cidade
            , rowguid
            , modifieddate as data_alteracao
        from fonte
    )

select *
from renomeacao