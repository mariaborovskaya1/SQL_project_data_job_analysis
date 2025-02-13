WITH skills_demand AS 
(SELECT 
COUNT (job_title_short) AS skill_demand,
skills_dim.skill_id,
skills_dim.skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_location LIKE '%Boston%'
GROUP BY skills_dim.skill_id

),

 avg_salary AS
(SELECT 
ROUND(AVG (salary_year_avg), 0) AS salary_average,
skills_dim.skill_id
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id

)

SELECT skills_demand.skill_id,
skills_demand.skills,
skill_demand,
salary_average

FROM skills_demand
INNER JOIN avg_salary ON avg_salary.skill_id = skills_demand.skill_id
WHERE skill_demand > 10
ORDER BY 
salary_average DESC
LIMIT 25