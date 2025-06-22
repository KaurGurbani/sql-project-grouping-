--Assumptions:
--Table: EmployeeCost(job_family, location, cost), location values: 'India' or 'International'
--Goal:For each job_family, show:% cost from India, % cost from International

SELECT 
  job_family,
  ROUND(SUM(CASE WHEN location = 'India' THEN cost ELSE 0 END) * 100.0 / SUM(cost), 2) AS india_cost_pct,
  ROUND(SUM(CASE WHEN location = 'International' THEN cost ELSE 0 END) * 100.0 / SUM(cost), 2) AS intl_cost_pct
FROM EmployeeCost
GROUP BY job_family;
