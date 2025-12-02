SELECT 
    s.products_id, 
    s.date_date, 
    s.orders_id,
    s.revenue, 
    s.quantity, 
    CAST(purchase_price AS float64) AS purchase_price, 
    ROUND(s.quantity*CAST(p.purchase_price AS float64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS float64),2) AS margin
from {{"stg_gz_raw_data__raw_gz_sales"}} as s
left join {{"stg_gz_raw_data__raw_gz_product"}} as p
    on sales.pdt_id = product.products_id
