-- LIKE: using % 
select *
from employee_demographics
where first_name like '%lie';

-- LIKE: using _ 
select *
from employee_demographics
where first_name like 'a__';