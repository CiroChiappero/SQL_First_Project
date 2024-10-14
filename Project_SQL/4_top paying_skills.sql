/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG (salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short='Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/* Plugging the results of this query into ChatGPT provides the following insights:
The data highlights key trends in the most valued and lucrative skills for data analysts and tech professionals:

High-paying niche skills like SVN ($400,000) and Solidity ($179,000) show demand for experts in legacy systems and blockchain.

- Cloud infrastructure skills like Terraform ($146,734) and VMware ($147,500) are increasingly critical as businesses shift to scalable cloud solutions.

- Data science and machine learning tools, such as Keras ($127,013), PyTorch ($125,226), and Dplyr ($147,633), reflect growing AI integration across industries.

- Big data technologies like Kafka ($129,999) and Couchbase ($160,515) are essential for managing real-time and large-scale data systems.

- DevOps and automation tools (e.g., Ansible, GitLab) show strong demand, as they support streamlined development and deployment.

- Languages like Python, Golang ($155,000), and Scala ($115,480) are crucial for back-end and distributed system development.

In conclusion, tech professionals can boost their career potential by mastering cloud infrastructure, machine learning, and specialized programming languages, as well as exploring niche, high-demand fields like blockchain and AI automation.

*/