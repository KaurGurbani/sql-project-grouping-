--Assumptions: Table: Employees(sub_band)
SELECT 
  sub_band,
  COUNT(*) AS headcount,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Employees), 2) AS headcount_percent
FROM Employees
GROUP BY sub_band;
