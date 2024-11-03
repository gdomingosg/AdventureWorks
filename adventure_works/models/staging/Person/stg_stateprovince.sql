with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'stateprovince') }}
    )

    , renomeacao as (
        select
            stateprovinceid as id_estado_provincia
            , stateprovincecode as codigo_estado_provincia
            , countryregioncode as codigo_pais_regiao
            , [name] as nome_estado_provincia
            , territoryid as id_territorio
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao