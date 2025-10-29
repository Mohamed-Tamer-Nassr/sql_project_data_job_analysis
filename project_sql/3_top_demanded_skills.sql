/*
What are the most in-demand skills for my role?
*/


SELECT 
      skills,
      count(skills_job_dim.job_id) AS demanded_skills
FROM 
      job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
      job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demanded_skills DESC
LIMIT
      5
