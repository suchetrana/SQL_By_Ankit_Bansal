create database day6;
use day6;
select sub
from orders o
left join  returns r on o.order = r.order
group by o.category
having count(distinct  r.return ) = 3;

SELECT
    o.customer_id
FROM orders AS o
         JOIN order_items AS oi
              ON o.order_id = oi.order_id
         JOIN products AS p
              ON oi.product_id = p.product_id
WHERE o.order_date >= '2024-01-01'
  AND o.order_date < '2025-01-01'
GROUP BY o.customer_id
HAVING COUNT(DISTINCT p.product_id) = 3;