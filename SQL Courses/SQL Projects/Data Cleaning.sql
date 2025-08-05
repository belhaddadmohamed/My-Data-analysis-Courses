create table layoffs_staging like layoffs;
insert into layoffs_staging
select *
from layoffs;

-- ------------------------------------------------------
-- 1- Remove Duplicates
-- 2- Data Standardization
-- 3- Null and Blank values
-- 4- Remove any columns / rows
-- ------------------------------------------------------

-- 1- Remove Duplicates
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Make the result in a real table
insert into layoffs_staging2
	select *, row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
	from layoffs_staging;
-- Delete the duplicates (row_num > 1)   
delete 
from layoffs_staging2
where row_num > 1;

-- -----------------------------------------------------------------
-- 2- Standardizing the data
update layoffs_staging2 set company = trim(company);
select trim(company) from layoffs_staging2;

select distinct industry 
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2 set industry = 'Crypto' 
where industry like 'crypto%';

-- There's a 'united states' with a dot at the end 
select distinct country 
from layoffs_staging2
where country like 'united states%';

update layoffs_staging2 set country = trim(trailing '.' from country)
where country like 'united states%';

-- Convert the date from txt ==> date
select `date`, str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2 set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;


-- -----------------------------------------------------------------------------
-- 3- Null and Blank values
select *
from layoffs_staging2
where industry is null or industry = '';

select * 
from layoffs_staging2
where company = "Airbnb";

select t1.company, t1.industry, t2.company, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company and t1.location = t2.location
where (t1.industry is null or t1.industry = '') and (t2.industry is not null or t2.industry != '');

-- We had problems with blank we decided to change them to Null
update layoffs_staging2 
set industry = null 
where industry = '';

update layoffs_staging2 t1 
join layoffs_staging2 t2 on t1.company = t2.company and t1.location = t2.location
set t1.industry = t2.industry
where t1.industry is null and t2.industry is not null;


-- Get rid of rows wich have Null values on both total_laid_off and percentage_laid_off columns
select *
from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

delete from layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;











