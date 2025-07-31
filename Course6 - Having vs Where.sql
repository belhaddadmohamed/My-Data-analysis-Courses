select gender, AVG(age), MAX(age)
from employee_demographics
group by gender
having MAX(age)>60;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary)>75000



