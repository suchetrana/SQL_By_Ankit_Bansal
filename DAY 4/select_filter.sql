create database DAY4;
use day4;

CREATE TABLE orders
(
    row_id        INT PRIMARY KEY,
    order_id      VARCHAR(20),
    order_date    DATETIME,
    ship_date     DATETIME,
    ship_mode     VARCHAR(50),
    customer_id   VARCHAR(20),
    customer_name VARCHAR(100),
    segment       VARCHAR(50),
    country       VARCHAR(100),
    city          VARCHAR(100),
    state         VARCHAR(100),
    postal_code   VARCHAR(10)
);

update orders
set city = null
where city like 'B%' limit 2;
