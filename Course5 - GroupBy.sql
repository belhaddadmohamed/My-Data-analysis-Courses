-- GROUP BY 
select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
group by gender;

select occupation, AVG(salary)
from employee_salary
group by occupation;

-- ORDER BY 
 select salary 
 from employee_salary
 order by salary desc;
 
 select *
 from employee_demographics
 order by gender desc, age;
 -- We can replace the columns just by thier numbers 
 
 
 
 