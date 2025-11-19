-- Database Joins
CREATE DATABASE DAY5;
USE day5;
CREATE TABLE orders
(
    order_id         INT,
    customer_id      INT            NOT NULL,
    product_id       INT            NOT NULL,
    order_date       DATETIME    DEFAULT CURRENT_TIMESTAMP,
    quantity         INT            NOT NULL CHECK (quantity > 0),
    total_amount     DECIMAL(10, 2) NOT NULL,
    payment_status   VARCHAR(20) DEFAULT 'Pending',
    shipping_address VARCHAR(255),
    delivery_date    DATE,
    created_at       TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
);

select *
from orders;

CREATE TABLE returns
(
    return_id     INT,
    order_id      INT            NOT NULL,
    customer_id   INT            NOT NULL,
    product_id    INT            NOT NULL,
    return_date   DATETIME    DEFAULT CURRENT_TIMESTAMP,
    quantity      INT            NOT NULL CHECK (quantity > 0),
    refund_amount DECIMAL(10, 2) NOT NULL,
    refund_status VARCHAR(20) DEFAULT 'Pending',
    return_reason VARCHAR(255),
    processed_at  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
);
# inner join -> fetches same data where order_id is same both table
select od.product_id, re.product_id
from orders  od
         inner join returns  re on od.order_id = re.order_id;


# left join
select od.product_id, re.product_id
from orders  od
         left join returns  re on od.order_id = re.order_id
where re.return_date is null;

# cross join
select *
from orders, returns;
# Method 2
select *
from orders , returns
order by orders.order_date;
# m3
select *
from orders od
inner join  returns on 1 = 1;

select od.product_id as order_product_id, re.quantity as quantity
    from orders od
inner  join returns re where od.quantity = re.product_id;

# right join -> everything from right table
# if not present in left table assign null

select od.product_id, re.product_id
from orders  od
         right join returns  re on od.order_id = re.order_id
where re.return_date is null;

# never use right join always use left join

# full outer join : is not supported in mysql

# select od.product_id,
# from orders as od
#           full outer join returns re on od.produc_id = re.product_id;

SELECT od.order_id, re.order_id
FROM orders od
         LEFT JOIN returns re ON od.order_id = re.order_id
UNION
SELECT od.order_id, re.order_id
FROM orders od
         RIGHT JOIN returns re ON od.order_id = re.order_id;