with
    endereco as (
        select *
        from {{  ref('stg_address')}}
    )

    , est_prov as (
        select *
        from {{ ref('stg_stateprovince') }}
    )

    , pais_reg as (
        select *
        from {{ ref('stg_countryregion') }}
    )

    , terr as (
        select *
        from {{ ref('stg_salesterritory') }}
    )

    , joined as (
        select
            endereco.pk_endereco
            , endereco.nome_cidade
            , est_prov.nome_estado_provincia
            , pais_reg.nome_pais
            , terr.nome_territorio
            , terr.nome_grupo_territorio
        from endereco
        left join est_prov
            on endereco.fk_estado_provincia = est_prov.pk_estado_provincia
        left join pais_reg
            on est_prov.fk_pais_regiao = pais_reg.pk_pais_regiao
        left join terr
            on est_prov.fk_territorio = terr.pk_territorio

    )

select *
from joined