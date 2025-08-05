-- A Trigger is a set of instructions that automatically runs in response to specific database events like: INSERT UPDATE DELETE 
drop trigger if exists update_name;

delimiter $$
create trigger update_name
after update on employee_salary
for each row
begin
	update employee_demographics 
    set first_name=new.first_name, last_name=new.last_name
    where employee_id=new.employee_id;
end $$
delimiter ;


drop trigger if exists employee_insert ;
delimiter $$
create trigger employee_insert
after insert on employee_salary
for each row
begin 
	insert into employee_demographics(employee_id, first_name, last_name)
    values(new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into employee_salary(employee_id, first_name, last_name) values(13, 'mohamed', 'belhaddad');
select * from employee_demographics;



-- ----------------------------------------------------------------------------------
-- An event is a scheduled task—like a cron job—that runs SQL statements automatically at specified times or intervals.
delimiter $$
create event delete_retirees
on schedule every 20 second
do
begin
	delete 
    from employee_demographics
    where age >= 60;
end $$
delimiter ;


insert into employee_demographics(employee_id, age) values(15, 75);

