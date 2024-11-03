with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'personcreditcard') }}
    )

    , renomeacao as (
        select
            businessentityid as id_ent_comercial
            , creditcardid as id_cartao_credito
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao