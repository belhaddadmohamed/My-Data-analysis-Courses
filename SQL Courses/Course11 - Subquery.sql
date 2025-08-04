select *
from employee_demographics
where employee_id in (
	select employee_id
	from employee_salary
	where dept_id=6
);


select salary, (
	select avg(salary)
	from employee_salary
) as avg_salary
from employee_salary;


-- ---------------------------------------------------------
select gender, avg(age), min(age), max(age), count(age)
from employee_demographics
group by gender;
-- ---------------------------------------------------------
select avg(`max(age)`)
from (select gender, avg(age), min(age), max(age), count(age)
	  from employee_demographics
	  group by gender) as aggr_table











