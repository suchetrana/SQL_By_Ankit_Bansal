/*
String Functions:

*/

use day6;

show tables;

select emp_name, length(emp_name) as name_length,
       left(emp_name, 4) as first_character,
       right(emp_name, 5) as last_character,
       substr(emp_name, 3, 5) as substring,
       position('a' in emp_name) as pos_character

from employee;

/*

null handling functions
usage if you want not see null you can replace with some value
*/


# if salary == null then replace with 0
# coalesce use for multiple value always use coalesce

SELECT emp_id, salary, IFNULL(salary, 0) AS new_sal,
       coalesce(emp_id, salary,0) as new_col  # here if emp_id is null then pick salary , if salary is null then pick value
FROM employee;

/*
cast functions

*/
SELECT order_id, sales, cast(sales AS signed ) AS sales_int
FROM orders
LIMIT 4;

/*

set functions
only 2 functions
union - gives all rows combined in table,
union all - remove duplicates (from any table)
intersect - for only common data
except - give data that is not common in
*/

create table orders_east (
    price int,
    dir varchar(50)
);
create table orders_west (
    price int,
    dir varchar(50)
);

insert into orders_east values(101, 'east');
insert into orders_east values(102, 'east');
insert into orders_west values(103, 'west');
insert into orders_west values(104, 'west');

select *
from orders_east
except
select *
from orders_west;