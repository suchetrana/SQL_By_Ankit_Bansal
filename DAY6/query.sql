use day6;
create table employee
(
    emp_id     int,
    emp_name   varchar(50),
    dept_id    int,
    salary     int,
    manager_id int,
    emp_age    int
);

INSERT INTO employee (emp_id, emp_name, dept_id, salary, manager_id, emp_age)
VALUES (6, 'Amit', 100, 75000, 2, 32),
       (7, 'Neha', 100, 68000, 2, 29),
       (8, 'Priya', 200, 82000, 5, 34),
       (9, 'Karan', 200, 60000, 5, 27),
       (10, 'Suman', 300, 90000, 2, 41),
       (11, 'Vikas', 300, 55000, 10, 26),
       (12, 'Anjali', 400, 120000, 2, 38),
       (13, 'Rahul', 400, 70000, 12, 30),
       (14, 'Pooja', 500, 65000, 5, 28),
       (15, 'Arjun', 500, 95000, 2, 36);

select salary
from employee;

select e1.emp_name as employee, e2.emp_name as manager
from employee e1
         inner join employee e2
                    on e1.manager_id = e2.emp_id;

# String Aggregation functions:
select dept_id, GROUP_CONCAT(emp_name, ', ' order by salary) as Array
from employee
group by dept_id;

select order_id,
       order_date,
       month(order_date) as mnth
from orders;

alter table orders
    add order_date date;



SELECT DAYNAME(CURDATE());
SELECT MONTHNAME(CURDATE());
SELECT YEAR(CURDATE());
SELECT DATE_FORMAT(CURDATE(), '%D');
SELECT WEEK(curdate());

SELECT ADDDATE(CURDATE(), INTERVAL 5 DAY);
SELECT ADDDATE(CURDATE(), INTERVAL -3 MONTH);

SELECT DATEDIFF('2025-12-31', '2025-12-01');



SELECT YEAR(order_date)  AS yr,
       MONTH(order_date) AS mon,
       DAY(order_date)   AS dy
FROM orders;

select *,
       case
           when emp_age > 20 then 'adult'
           else 'teenage'
           end as category
from employee;
# execute top to bottom