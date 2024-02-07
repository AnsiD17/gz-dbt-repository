with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id as products_id,
        cast(revenue as float64) as revenue,
        cast(quantity as float64) as quantity,
        revenue,
        quantity

    from source

)

select * from renamed
