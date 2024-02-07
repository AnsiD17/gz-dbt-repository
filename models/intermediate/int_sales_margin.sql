select
    date_date,
    orders_id,
    products_id,
    revenue,
    quantity,
    round((quantity * purchase_price), 2) as purchase_cost,
    round((revenue - (quantity * purchase_price)), 2) as margin
from {{ ref("stg_raw__sales") }}
join {{ ref("stg_raw__product") }} using (products_id)
