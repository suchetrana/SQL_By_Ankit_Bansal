create DATABASE Introduction_To_SQL;

use Introduction_To_SQL;

# DDL -> data definition language
create table amazon_orders
(
    order_id       integer,
    order_date     date,
    product_name   varchar(100),
    total_price    decimal(10, 2),
    payment_method varchar(20)
);

# delete a table
drop table amazon_orders;

# DML -> data manipulation language
insert into amazon_orders
values (1, '2022-11-01', 'Iphone 14 pro', 90000, 'upi
');
insert into amazon_orders
values (2, '2022-10-01', 'Ipad pro', 90000, 'upi
');
insert into amazon_orders
values (3, '202-01-01', 'Macbook pro', 90000, 'upi
');

insert into amazon_orders (order_id, order_date, product_name, total_price, payment_method)
values (4, '2022-11-01', 'Airpods pro', 90000, 'upi'),
       (5, '2022-11-01', 'S25 ultra ', 90000, 'credit-card');

# to delete data
delete from amazon_orders;

# DQL -> data query language
# limiting rows
select *
from amazon_orders
limit 2;

# sort data by order_date

select *
from amazon_orders
order by order_date desc, total_price;




