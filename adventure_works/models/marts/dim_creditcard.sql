with 
    credit_card as (
        select
            pk_cartao_credito
            , tipo_cartao_credito
            , data_alteracao
        from {{ ref('stg_creditcard') }}
    )

select *
from credit_card