-- Without Window Function
select gender, avg(s.salary)
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id
group by gender;

-- Without Window Function
-- We can use another fields rather than just 'gender'
select d.first_name, gender, salary, avg(s.salary) over(partition by gender)
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id;
    
    
-- Rolling Total = Running Total = Cumulative Sum
select d.first_name, gender, salary, sum(s.salary) over(partition by gender order by d.employee_id) 'Rolling_Total'
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id;
    

-- Using Aggregate function: row_number(), rank(), dense_rank() 
select d.employee_id, d.first_name, gender, salary, 
row_number() over(partition by gender) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics d
join employee_salary s
	on d.employee_id = s.employee_id;
