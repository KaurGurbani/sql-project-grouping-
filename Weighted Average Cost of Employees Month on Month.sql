-- Example assuming columns: month, bu, employee_id, salary, weight
SELECT 
  month,
  bu,
  SUM(salary * weight) / SUM(weight) AS weighted_avg_cost
FROM EmployeeCost
GROUP BY month, bu;
