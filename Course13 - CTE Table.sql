-- CTE is a temporary result set that's named and which you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
-- CTEs are absolutely necessary to reduce complex queries down to standard readable and reusable pieces of code
with CTE_Example (Gender, Avg_sal, Min_sal, Max_sal, Count_sal) as 
(
select gender, avg(salary), min(salary), max(salary), count(salary)
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id
group by gender
)
select *
from CTE_Example;


-- Complex CTE
with CTE_Example as 
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select * 
from CTE_Example c1
join CTE_Example2 c2
	on c1.employee_id = c2.employee_id
