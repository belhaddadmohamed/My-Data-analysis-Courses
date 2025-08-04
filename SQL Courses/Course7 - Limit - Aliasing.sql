-- Limit 
select occupation
from employee_salary
order by occupation desc
limit 5;

select occupation
from employee_salary
order by occupation desc
limit 2, 1;

-- Aliasing
select occupation, avg(salary) avg_salary
from employee_salary
where occupation like '%manager%'
group by occupation
having avg_salary > 75000;

