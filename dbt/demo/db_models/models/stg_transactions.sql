{{ config(materialized='view') }}

-- 模拟交易流水表
with transactions as (
    select 1 as tx_id, 101 as user_id, cast('2024-09-01' as date)  as tx_date, 100.00 as amount, 'deposit'  as tx_type
    union all
    select 2, 101, cast('2024-09-05' as date) , -30.00, 'withdraw'
    union all
    select 3, 102, cast('2024-09-06' as date) , 200.00, 'deposit'
    union all
    select 4, 101, cast('2024-09-10' as date), -50.00, 'withdraw'
    union all
    select 5, 103, cast('2024-09-10' as date), 500.00, 'deposit'
    union all
    select 5, 104, cast('2024-09-10' as date), -30.00, 'withdraw'
)

select *
from transactions