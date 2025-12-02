select products_id, 
    date_date, 
    orders_id,
    revenue,
    quantity,
    CAST(purchSE_price AS FLOAT64),
    ROUND(sales.quantity * CAST(product.purchSE_price AS FLOAT64),2) AS purchase_cost,
    ROUND(sales.revenue - sales.quantity * CAST(product.purchSE_price AS FLOAT64),2) AS margin
from {{"gz_raw_data.raw_gz_sales"}} as sales
left join {{"gz_raw_data.raw_gz_product"}} as product
    on sales.pdt_id = product.products_id
