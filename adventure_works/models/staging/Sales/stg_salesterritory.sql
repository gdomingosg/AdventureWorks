with
    fonte as (
        select *
        from {{ source('adventure_works', 'salesterritory') }}
    )

    , renomeacao as (
        select 
            territoryid as pk_territorio
            , name as nome_territorio
            , countryregioncode as fk_pais_regiao
            , "group" as nome_grupo_territorio
            , salesytd as vendas_acumuladas_ano
            , saleslastyear as vendas_ultimo_ano
            , costytd as custo_acumulado_ano
            , costlastyear as custo_ultimo_ano
            , rowguid
            , modifieddate as data_alteracao
        from fonte
    )

select *
from renomeacao