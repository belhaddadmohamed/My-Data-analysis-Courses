


delimiter $$
create procedure get_salary(emp_id int)
begin
	select salary 
    from employee_salary
    where employee_id = emp_id;
end $$
delimiter ;

call get_salary(8)


-- Method2: using in/ out/ inout
delimiter $$
create procedure get_full_name(in emp_id int, out full_name varchar(100))
begin 
	select concat(first_name, ' ', last_name)
    into full_name
    from employee_demographics
    where employee_id = emp_id;
end $$
delimiter ;

call get_full_name(6, @name);
select @name;



