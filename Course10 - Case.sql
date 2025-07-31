-- Exampleparks_departmentsparks_departments
-- if salary < 50000 : +5% salary
-- if salary > 50000 : +7% salary
-- if Finance : 10% bonus
select first_name,
last_name,
salary,
case
	when salary < 50000 then salary * 1.05
    when salary >= 50000 then salary * 1.07
end as new_salary,
case
	when dept_id = 6 then salary * 0.1
    else 'no'
end as bonus
from employee_salary;

