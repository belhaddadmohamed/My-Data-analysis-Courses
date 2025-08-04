select first_name, last_name, 'Old Man' as Info
from employee_demographics
where age > 40 and gender = 'Male'
union
select first_name, last_name, 'Old Woman'
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name, last_name, 'Highly Paid'
from employee_salary
where salary > 70000;