select *
from layoffs_staging2;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;


select stage, avg(percentage_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;


select substring(`date`, 1, 7) `month`, sum(total_laid_off) total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `month`
order by 1 asc;

-- Rolling Total / Running Total (Acumulative Sum)
with rolling_total as (
select substring(`date`, 1, 7) `month`, sum(total_laid_off) total_off
from layoffs_staging2
where substring(`date`, 1, 7) is not null
group by `month`
order by 1 asc
) 
select `month`, total_off, sum(total_off) over(order by `month`) as rolling_num
from rolling_total;

-- Ranking the most laid_off company
with ranked_laid_off (company, years, total_laid_off) as ( 
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *, rank() over(partition by years order by total_laid_off desc) as ranking
from ranked_laid_off
where years is not null
order by ranking;

-- Top 5 from the previous result table
with ranked_laid_off (company, years, total_laid_off) as ( 
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, industry, year(`date`)
), 
company_year_rank as (
select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from ranked_laid_off
where years is not null)
select *
from company_year_rank
where ranking <= 5
order by years desc









