CREATE DATABASE DAY3;

USE DAY3;

create table orders
(
    name_id   integer,
    name      varchar(50),
    order_id  integer,
    ship_date datetime,
    ship_mode varchar(50),
    city      varchar(50)
);


insert into orders(name_id, name, order_id, ship_date, ship_mode, city)
values (1, 'Suchet', 12,
        '2025-10-15 12:45:34', 'second class', 'Haridwar');


select ship_date
from orders;

select distinct ship_mode
from orders;


select distinct ship_mode
from orders
where ship_mode = 'First class';

alter table orders
    add column quanity integer;

update orders
set quanity = 5;

select order_id
from orders
where quanity >= 5
order by name_id desc
limit 5;

# Order of execution  from -> where -> order by -> limit

select ship_mode, ship_date
from orders
where ship_date between '2025-02-11 00:00:00' and '2025-3-12 00:00:00'
order by ship_mode desc;

select *
from orders
where ship_mode not in ('second class');

select *
from orders
where ship_mode in ('First class')
  or ship_date > '2025-03-30';  # or filter always increase the number of rows

select *
from orders
where ship_mode in ('First class') # and filter always decrease the number of rows
   and quanity > 5;

# add new column in select statement

select *, name_id/order_id as ratio, name_id+order_id as total
from orders;

# Pattern Matching -> like operator

select name, order_id
from orders
where name like 'Sa%';

select name, order_id
from orders
where name like '%a';

select name, order_id
from orders
where name like '%ri%';

select name, order_id, upper(name) as upper_name
from orders
where name like 'A%a' ;

select name, order_id, upper(name) as upper_name
from orders
where upper(name) like 'A%a' ;

select name, order_id, upper(name) as upper_name
from orders
where upper(name) like '__c%' ;  # 2 character must before c anything after this


select *
from orders
where name like '%l' escape '%m';

SELECT name, order_id
FROM orders
WHERE name REGEXP '^S[a-z]';