select * 
from employee_demographics d, employee_salary s
where d.employee_id = s.employee_id;

select *
from employee_demographics d
right join employee_salary s
on d.employee_id = s.employee_id;

-- Self join
-- Example: Employees have the same occupation
select emp1.first_name, emp2.first_name, emp1.occupation
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id < emp2.employee_id and emp1.occupation = emp2.occupation;

-- Joining Multiple tables 
select d.employee_id, d.first_name, department_name
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id
join parks_departments p
	on p.department_id = s.dept_id;



