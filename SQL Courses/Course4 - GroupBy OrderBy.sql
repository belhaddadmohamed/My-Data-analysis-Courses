select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
group by gender;

select occupation, AVG(salary)
from employee_salary
group by occupation;
