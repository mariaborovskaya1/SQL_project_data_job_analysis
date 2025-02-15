# Intoduction
🚀 Explore the Data Job Market! This project dives into Data Analyst roles, uncovering the highest-paying jobs, the most in-demand skills, and where high demand meets top salaries in data analytics! 📊💰
SQL queries? Check them out here: [project_sql folder](/project_sql/)
# Background
Fueled by the drive to master the Data Analyst job market, this project was created to identify top-paying, in-demand skills, making it easier for others to land the best opportunities! 
### The questions i wanted to answer through my SQL queries were:
1. What are the top paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data analytics?
4. Which skills are associated with higher salaries? 
5. What are the most optimal skills to learn? 
# Tools I Used
For my deep dive into the data analyst job market, i harnessed the power of several key tools:
- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The choden database managment system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database managment and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking. 

# The Analysis
Each query for this project aimed ar investigating specific aspects of the data analyst job market. Here's how i approached each question: 
### 1. Top Paying Data Analyst Jobs
to identify the highest-paying roles i filtred data analyst positions by average yearly salary and locations, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
SELECT
job_id,
job_title_short,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date,
name AS company_name

FROM job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL 
AND job_location LIKE '%Boston%'
ORDER BY salary_year_avg DESC
LIMIT 10
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.



### 2.Skills for Top Paying Jobs
To understand what skills are requiered fot the top-paying jobs, i joined the job postings with the skills data, providing employees value for high-compensation roles.
```sql
WITH top_paying_jobs AS
(SELECT
job_id,
job_title,
salary_year_avg,
name AS company_name

FROM job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL 
AND job_location LIKE '%Boston%'
ORDER BY salary_year_avg DESC
LIMIT 10)

SELECT 
top_paying_jobs.*,
skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
```
Here's the breakdown of the most demanded skills for the top 10 highest paying  data analyst jobs in 2023:
- Python 🐍 (5 roles) – Essential for data manipulation, ML, and automation.
- SQL 🗄️ (4 roles) – Core skill for querying and managing databases.
- Excel 📑 (3 roles) – Still crucial for data analysis and reporting.
- Tableau & Power BI 📈 (2 roles each) – Popular visualization tools.



![hghghgh](assets\wp13208048.webp)




Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results

### 3. In-Demand Skills for Data Analyst
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.
```sql
SELECT 
COUNT (job_title_short) AS skill_demand,
skills_dim.skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND job_location LIKE '%Boston%'
GROUP BY skills_dim.skills
ORDER BY skill_demand DESC
LIMIT 5
```
Here's the breakdown of the most demanded skills for data analysts in 2023
- SQL 🗄️ (516 jobs) – The top-required skill for managing and querying databases.
- Excel 📑 (395 jobs) – Still a key tool for data analysis and reporting.
- SAS 📊 (348 jobs) – Popular for statistical analysis in industries like finance and healthcare.
- Python 🐍 (324 jobs) – Essential for automation, data science, and machine learning.
- Tableau 📈 (295 jobs) – A leading tool for data visualization and business intelligence.








Table of the demand for the top 5 skills in data analyst job postings 


### 4. Skills Based on Salary 

```sql
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
```
Here's the breakdown of the results for top paying skills for Data Analysts 
- Blockchain (Solidity) & AI/ML (MXNet, DataRobot) skills are among the highest-paid.
- Cloud & Infrastructure skills (VMware, Terraform) are valuable for data engineering roles.
- R & NoSQL tools (Dplyr, Couchbase) remain highly paid but more niche.






Table of the average salary for the top 10 paying skills for data analysts 


### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have hgh salaries, offering a  strategic focus for skill development 
```sql
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
```
Here's the breakdown of the most optimal skills for Data Analysts in 2023

**Best Balance of Demand & Salary 💰**

- Python ($101K, 27 jobs) – The most optimal skill, offering high salaries and strong demand.
- SQL ($96K, 33 jobs) – The most in-demand skill, essential for database management.

**Strong Supporting Skills 📈**

- Tableau ($97K, 18 jobs) – A must-have for data visualization and business intelligence.
- R ($98K, 13 jobs) – Ideal for statistical analysis, especially in research and finance.
- Excel ($86K, 24 jobs) – Still widely used for data processing and reporting.





Table of the most optimal skills for data analyst sorted by salary 

# What I Learned

Throughout this adventure, i have turbochared my SQL toolkit with some serious firepower:
- **Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **Data Agregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
# Conclusions

### Insights
- **High Salary Potential 💰** – Salaries range from $184K to $650K, with top-paying roles in blockchain, AI/ML, and cloud infrastructure.

- **Most In-Demand Skills 🔥** – SQL (516 jobs) & Excel (395 jobs) dominate, while Python (324 jobs) remains essential for automation and machine learning.

- **Optimal Skills for Career Growth 📈** – Python ($101K) offers the best balance of salary & demand, while SQL, Tableau, and R provide strong career opportunities.
### Closing Thoughts 
As my first project, this experience greatly improved my SQL skills and gave me valuable insights into the data analyst job market. The findings serve as a guide for prioritizing skill development and job search strategies. For aspiring data analysts, focusing on high-demand and high-salary skills can provide a competitive edge. This project also reinforced the importance of continuous learning and staying adaptable to evolving trends in data analytics.