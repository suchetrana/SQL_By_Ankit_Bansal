create database day1_homework;
use day1_homework;
create table users
(
    user_id      integer,
    name         varchar(25),
    password     varchar(40),
    created_date date,
    age          integer
);

insert into users(user_id, name, password, created_date, age)
values (1, 'Sanket Singh', 'SpringBoot', '2025-10-24', 27);

INSERT INTO users (user_id, name, password, created_date, age)
VALUES (11, 'Amit', 'pwd@123', '2024-01-10', 25),
       (2, 'Suchet', 'pass#999', '2024-01-12', 24),
       (3, 'Rohan', 'hello123', '2024-02-01', 28),
       (4, 'Meena', 'meena@12', '2024-02-05', 22),
       (5, 'Suresh', 'sur#789', '2024-02-08', 26),
       (6, 'Pooja', 'poo@pass', '2024-03-01', 23),
       (7, 'Vikas', 'vik8090', '2024-03-10', 29),
       (8, 'Neha', 'nh#234', '2024-04-01', 24),
       (9, 'Raju', 'raj_pass', '2024-04-05', 30),
       (10, 'Kiran', 'kir12345', '2024-04-08', 27);

select *
from users order by user_id, name desc;

delete
from users;

