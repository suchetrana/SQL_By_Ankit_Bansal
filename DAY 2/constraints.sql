USE DAY2;
drop table a_orders;
create table a_orders
(
#     not null, unique constraint
    order_id       integer not null unique ,
    order_date     datetime,
    product_name   varchar(30),
    total_price    decimal(10, 2),
#     check constraint
    payment_method varchar(20) check ( payment_method in ('upi', 'credit card', 'net banking') ),
    discount integer check ( discount <= 20 ),
#     default constraint
    category varchar(30) default 'empty',
    primary key (order_id)
);

alter table a_orders
    modify total_price decimal(10, 2);

insert into a_orders(order_id, order_date, product_name, total_price, payment_method, discount)
values (1, '2025-10-25 02:54:10', 'Macbook', 543033.22, 'UPI', 20);

select *
from a_orders;

