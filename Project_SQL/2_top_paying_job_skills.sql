/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_schedule_type,
        salary_year_avg,
        name AS company_name 
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC    

/* After the query is returned, I saved the CSV file and uploaded it to ChatGPT for further analysis.
These were the results:


The dataset provides details on various data analyst vacancies, including job schedules, average yearly salaries, company names, and relevant skills. To determine which skills are most valued for data analyst roles, I will analyze the most frequently occurring skills in the dataset and correlate them with salary.
I'll proceed with aggregating and analyzing this data to extract the most in-demand and highest-paying skills. ​​
The most frequently mentioned skills for data analyst roles in the dataset are:

SQL (8 mentions) – Average salary: $207,320
Python (7 mentions) – Average salary: $205,937
Tableau (6 mentions) – Average salary: $214,260
R (4 mentions) – Average salary: $215,313
Snowflake (3 mentions) – Average salary: $193,436
Excel (3 mentions) – Average salary: $215,610
Pandas (3 mentions) – Average salary: $215,610
AWS (2 mentions) – Average salary: $222,569
Power BI (2 mentions) – Average salary: $222,569
Oracle (2 mentions) – Average salary: $203,154

SQL, Python, and Tableau are the most in-demand skills, while AWS and Power BI are associated with the highest average salaries. ​