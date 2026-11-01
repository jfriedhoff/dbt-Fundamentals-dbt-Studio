with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
        id as orders_id,
        user_id as customer_id,
        order_date,
        status as order_status,
        _etl_loaded_at

    from source

)

select * from renamed