/*select            --take awhole table from int_sales_margin
orders_id,
date_date,
revenue,
quantity,
purchase_cost,
margin
from {{ ref("int_sales_margin") }}*/  


/*SELECT            --Before calculate different values from orders_id, SUM each revenue, quantity, purchase_cost, margin
  orders_id,
  date_date,
  ROUND(SUM(revenue),2) as revenue,
  ROUND(SUM(quantity),2) as quantity,
  ROUND(SUM(purchase_cost),2) as purchase_cost,
  ROUND(SUM(margin),2) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id,date_date
ORDER BY orders_id DESC*/

SELECT
  orders_id,
  max(date_date) as date_date,      --calculate different values from orders_id
  ROUND(SUM(revenue),2) as revenue,
  ROUND(SUM(quantity),2) as quantity,
  ROUND(SUM(purchase_cost),2) as purchase_cost,
  ROUND(SUM(margin),2) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id
ORDER BY orders_id DESC
