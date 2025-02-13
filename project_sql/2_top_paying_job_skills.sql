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

/*Most In-Demand Skills:

Python and SQL are the most frequently mentioned skills (5 times each), highlighting their importance for Data Analysts.
Excel follows with 3 mentions, showing its continued relevance.
Popular BI & Visualization Tools:

Power BI and Tableau appear twice, indicating demand for dashboarding and data visualization.
Libraries like Pandas, Matplotlib, and Seaborn suggest a focus on Python-based data analysis.
Machine Learning & Big Data:

TensorFlow, PyTorch, Hugging Face, and Hadoop indicate a demand for AI/ML knowledge.
Snowflake suggests the need for cloud-based data warehousing.
Specialized & Emerging Skills:

Rust, Go, Solidity, and GDPR hint at specialized or regulatory-focused roles.
DAX and Alteryx show demand for advanced data transformation tools. 
[
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "python"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "r"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "pandas"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "jupyter"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "matplotlib"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "plotly"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "ggplot2"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "dplyr"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "seaborn"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "excel"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "power bi"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "dax"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "alteryx"
  },
  {
    "job_id": 731233,
    "job_title": "Data Analyst Director",
    "salary_year_avg": "225000.0",
    "company_name": "CliftonLarsonAllen",
    "skills": "git"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "sql"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "python"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "go"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "solidity"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "rust"
  },
  {
    "job_id": 1733003,
    "job_title": "Data Science Associate",
    "salary_year_avg": "179000.0",
    "company_name": "Fidelity Investments",
    "skills": "snowflake"
  },
  {
    "job_id": 712928,
    "job_title": "Sr Quality Data Analyst",
    "salary_year_avg": "175000.0",
    "company_name": "MultiPlan Inc.",
    "skills": "sql"
  },
  {
    "job_id": 712928,
    "job_title": "Sr Quality Data Analyst",
    "salary_year_avg": "175000.0",
    "company_name": "MultiPlan Inc.",
    "skills": "excel"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "python"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "c++"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "pandas"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "numpy"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "tensorflow"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "pytorch"
  },
  {
    "job_id": 1393428,
    "job_title": "Research Scientist",
    "salary_year_avg": "175000.0",
    "company_name": "Lazarus",
    "skills": "hugging face"
  },
  {
    "job_id": 566479,
    "job_title": "Principal People Data Analyst (Remote)",
    "salary_year_avg": "175000.0",
    "company_name": "CHARLES RIVER LABORATORIES INTERNATIONAL, INC",
    "skills": "gdpr"
  },
  {
    "job_id": 1249814,
    "job_title": "Business / Data Analyst",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "hadoop"
  },
  {
    "job_id": 1249814,
    "job_title": "Business / Data Analyst",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "excel"
  },
  {
    "job_id": 1249814,
    "job_title": "Business / Data Analyst",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "tableau"
  },
  {
    "job_id": 914557,
    "job_title": "ESG Data Analyst, VP",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "sql"
  },
  {
    "job_id": 914557,
    "job_title": "ESG Data Analyst, VP",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "python"
  },
  {
    "job_id": 914557,
    "job_title": "ESG Data Analyst, VP",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "tableau"
  },
  {
    "job_id": 914557,
    "job_title": "ESG Data Analyst, VP",
    "salary_year_avg": "147500.0",
    "company_name": "State Street",
    "skills": "power bi"
  },
  {
    "job_id": 1614977,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "Cognizant",
    "skills": "sql"
  },
  {
    "job_id": 1602027,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Motion Recruitment",
    "skills": "sql"
  },
  {
    "job_id": 1602027,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Motion Recruitment",
    "skills": "python"
  }
] */