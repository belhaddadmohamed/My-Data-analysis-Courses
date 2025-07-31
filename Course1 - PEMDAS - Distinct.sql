select * 
from employee_demographics;

-- PEMDAS: Parenthesis/ Exponent/ Multiplication/ Division/ Addition/ Substruction ------------
select first_name, age, (age+20)*2
from employee_demographics;

-- Distinct ----------------------------
select distinct first_name, gender 
from employee_demographics;

select distinct gender
from employee_demographics;

