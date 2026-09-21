create database smartphone_usage;
use smartphone_usage;

select*from smartphone_usage;
rollback;
select* from smartphone_usage;
select count(*) from smartphone_usage;

-- Null/missing-value check.
select * from smartphone_usage
where age is null or daily_screen_time_hours is null or addiction_level is null;

-- Gender-level addiction counts
select gender,count(*),sum(case when addicted_label=1 then 1 else 0 end) as addicted_count
from smartphone_usage
group by gender;


-- Stress level comparison by addiction status
select addicted_label, stress_level,count(*)
from smartphone_usage
group by addicted_label, stress_level
order by addicted_label, stress_level;

-- Addiction level distribution
SELECT addiction_level, COUNT(*), AVG(daily_screen_time_hours), AVG(sleep_hours)
FROM smartphone_usage
GROUP BY addiction_level;

-- Baseline usage averages
SELECT AVG(daily_screen_time_hours), AVG(sleep_hours), AVG(stress_level = 'High')
FROM smartphone_usage;

-- Screen time comparison by academic/work impact
SELECT academic_work_impact, AVG(daily_screen_time_hours), AVG(social_media_hours), AVG(gaming_hours)
FROM smartphone_usage
GROUP BY academic_work_impact;

