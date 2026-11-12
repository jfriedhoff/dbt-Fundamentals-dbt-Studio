with payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

final as (
    select
        order_id,
        coalesce(sum(case when payment_status = 'success' then payment_amount end), 0) as amount
    from payments
    group by 1
)

select * from final
