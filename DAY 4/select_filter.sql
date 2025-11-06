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
where city like 'B%'
limit 2;

select *
from orders;

# Aggregation in sql ->  count(), max(), min(), sum(), avg() and etc.

select count(*) as cnt, max(postal_code) as max
from orders;

select *
from orders
order by order_date desc
limit 5;

# group by

select country, count(*) as cnt
from orders
group by country;

# When you use an aggregate function (like MIN(), MAX(), SUM(), COUNT(), AVG(), etc.) alongside non-aggregated columns,
# every non-aggregated column in your SELECT must appear in your GROUP BY.

# Wrong eg:
select city
from orders
group by country, city;

# correct eg
select country, city, sum(order_id) as sum_orders
from orders
where city like 'H%'
group by country, city
order by sum_orders desc
limit 3;

# order of execution
#  from -> where -> group by -> select -> order by -> limit
# FROM → WHERE → GROUP → HAVING → SELECT → ORDER → LIMIT


select country, city, sum(order_id) as sum_orders
from orders
where city like 'H%'
group by country, city
having sum(order_id)
order by sum_orders desc;

# where vs having
# where -> use for particular row
# having -> used with aggregate fn's or group of values

select count(distinct city) as cnt_city, count(1) as cnt_1
from orders;

# any aggregate  fn ignore "null" values
/*
region, sales
"east",  100
"east",  null
"east",  200
*/

# select region, avg(sales) as avg_sales
# from orders group by region;
#  o/p 150

