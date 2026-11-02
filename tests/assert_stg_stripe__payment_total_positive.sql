select
    order_id,
    sum(payment_amount) as total_amount
from {{ ref('stg_stripe__payment') }}
group by order_id
having total_amount < 0