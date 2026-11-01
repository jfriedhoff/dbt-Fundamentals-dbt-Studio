with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

order_payment_line as (

    select
        o.customer_id,
        o.order_id,
        p.amount

    from orders o
    left join payments p on p.order_id = o.order_id
    where p.status = 'success'
)

select * from order_payment_line