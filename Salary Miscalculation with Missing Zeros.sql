--Problem:Samantha's keyboard had a broken 0 key, so she:
--Removed 0s from salary values before calculating the average.
--You need to:Calculate the actual average salary, Calculate the miscalculated average salary (with all 0s removed from salary values)
--Return the difference, rounded up to the nearest integer

SELECT 
  CEIL(AVG(Salary) - AVG(CAST(REPLACE(Salary, '0', '') AS UNSIGNED))) AS error
FROM Employees;

--AVG(Salary) = actual average
--REPLACE(Salary, '0', '') = remove all 0s from the value
--CAST(... AS UNSIGNED) = convert modified salary string to a number
--AVG(...) = average of miscalculated salaries
--CEIL(...) = round the result up to the nearest integer
