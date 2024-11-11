with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'stateprovince') }}
    )

    , renomeacao as (
        select
            stateprovinceid as pk_estado_provincia
            , stateprovincecode as fk_estado_provincia
            , countryregioncode as fk_pais_regiao
            , name as nome_estado_provincia
            , territoryid as fk_territorio
            , rowguid
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao