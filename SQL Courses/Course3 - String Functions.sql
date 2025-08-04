SELECT
  CONCAT('Mohamed', ' ', 'Islem') AS full_name,
  LENGTH('été') AS byte_length,
  CHAR_LENGTH('été') AS char_length,
  LOWER('HELLO') AS lower_text,
  UPPER('world') AS upper_text,
  SUBSTRING('OpenAI ChatGPT', 1, 6) AS substring_example,
  TRIM('   hello   ') AS trimmed_text,
  LTRIM('   hello') AS left_trimmed,
  RTRIM('hello   ') AS right_trimmed,
  REPLACE('I love PHP', 'PHP', 'MySQL') AS replaced_text,
  INSTR('Data Science', 'Science') AS position_instr,
  LOCATE('Science', 'Data Science') AS position_locate,
  REVERSE('abc') AS reversed_text,
  LEFT('Mohamed', 3) AS left_part,
  RIGHT('Mohamed', 3) AS right_part,
  FORMAT(12345.6789, 2) AS formatted_number;

-- ----------------------------------------------------------
select first_name, last_name, concat(first_name, last_name) full_name
from employee_demographics;

select birth_date, substring(birth_date, 6, 2) as birth_month
from employee_demographics;

select first_name, locate("lie", first_name)
from employee_demographics;

select first_name, left(first_name, 2)
from employee_demographics;

select trim("   sdfs dfsdfsfs f ds   ") trimmed_text