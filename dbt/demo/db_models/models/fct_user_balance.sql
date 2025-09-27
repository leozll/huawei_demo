{{ config(materialized='table') }}

-- 基于交易流水聚合用户余额
with base as (
    select *
    from {{ ref('stg_transactions') }}
),
user_balance as (
    select
        user_id,
        sum(amount) as balance,
        count(*) as tx_count,
        max(tx_date) as last_tx_date
    from base
    group by user_id
)

select *
from user_balance