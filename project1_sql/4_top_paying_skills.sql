
/*
Answer: what are top skills based on salary?
- Look at the average salary associated with each skill 
- Focuses on roles with specified salaries regardless of the location
- Why? It reweals how different skills impact salary levels and helps define most financially rewarding skills
*/ 


select
    skills,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' AND salary_year_avg is not null
    and job_work_from_home = True   
GROUP BY skills 
ORDER BY avg_salary DESC
limit 25