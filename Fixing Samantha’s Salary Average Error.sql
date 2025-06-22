SELECT 
  CEIL(AVG(salary) - AVG(CAST(REPLACE(salary, '0', '') AS UNSIGNED))) AS error
FROM Employees;

--AVG(salary) → actual average salary
--REPLACE(salary, '0', '') → removes all zero digits from the salary
--CAST(... AS UNSIGNED) → converts the altered string back into a number
--AVG(...) → average of those altered numbers
--CEIL(...) → rounds the difference up to the next integer
