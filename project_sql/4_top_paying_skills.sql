SELECT 
ROUND(AVG (salary_year_avg), 0) AS salary_average,
skills_dim.skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY salary_average DESC
LIMIT 10 

/*Ultra-Premium Skill: SVN ($400K) – Likely tied to niche roles, executive positions, or rare demand.
Top-Paying Emerging Skills ($140K–$179K):
Blockchain & AI: Solidity ($179K), MXNet ($149K), DataRobot ($155K).
Cloud & DevOps: Terraform ($146K), VMware ($147K), Couchbase ($160K).
Specialized Tech: Golang ($155K), Dplyr ($147K), Twilio ($138K).
 */
