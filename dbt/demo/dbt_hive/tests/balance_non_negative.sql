select *
from {{ ref('fct_user_balance') }}
where balance < 0