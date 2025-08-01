-- Temporary tables: are a type of database object that store intermediate results for a specific session or transaction.

-- Method1
create temporary table temp_table
(
	first_name varchar(50),
    last_name varchar(50),
    favourite_movie varchar(100)
);

insert into temp_table 
values 
('Mohamed', 'Belhaddad', 'Home Alone'),
('Mansour', 'Belkhadi', 'Fast and Furious');

select *
from temp_table;

-- ---------------------------------------------------
-- Method2
create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000;

select *
from salary_over_50k
