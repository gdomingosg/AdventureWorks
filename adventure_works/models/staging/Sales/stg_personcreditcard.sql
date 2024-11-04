with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'personcreditcard') }}
    )

    , renomeacao as (
        select
            creditcardid as fk_cartao_credito
            , businessentityid as fk_ent_comercial
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao