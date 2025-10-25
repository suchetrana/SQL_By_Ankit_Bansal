create database DAY2;
USE day1_homework;

create table amazon_orders
(
    order_id       integer,
    order_date     date,
    product_name   varchar(100),
    total_price    decimal(10, 2),
    payment_method varchar(20)
);
# Making changes in existing table using 'ALTER' command.

# change data type of existing table
alter table amazon_orders
    modify order_date datetime;

# data type should be compatible
# if table is empty we can change in any data type

# adding new column in existing table
alter table amazon_orders
    add user_name varchar(70);

# dropping column
alter table amazon_orders
    add category varchar(5);

alter table amazon_orders
    drop column category;
# we can convert any datatype to varchar but performance we will loose

insert into amazon_orders(order_id, order_date, product_name, total_price, payment_method)
values (5, '2025-9-15 12-05-59', 'Watch', '47000', 'cash');


select *
from users;

