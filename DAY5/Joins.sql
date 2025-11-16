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

select  od.order_date as order_date, re.return_date as return_date
from orders as od inner join returns as re on od.order_id = re.order_id;

SELECT od.order_id, od.customer_id, od.product_id, od.order_date,
       re.return_date, re.refund_amount, re.return_reason
FROM orders AS od
         INNER JOIN returns AS re ON od.order_id = re.order_id;

SELECT od.order_id, od.customer_id, od.product_id, od.order_date
FROM orders AS od
         LEFT JOIN returns AS re ON od.order_id = re.order_id
WHERE re.order_id IS NULL;

SELECT re.return_id, re.order_id, re.customer_id, re.return_date
FROM orders AS od
         RIGHT JOIN returns AS re ON od.order_id = re.order_id
WHERE od.order_id IS NULL;

SELECT customer_id, SUM(refund_amount) AS total_refund
FROM returns
GROUP BY customer_id;
