SELECT DISTINCT Salary
FROM Employees E1
WHERE 5 > (
  SELECT COUNT(DISTINCT Salary)
  FROM Employees E2
  WHERE E2.Salary > E1.Salary
);
