-- SQL query to group tasks into projects based on consecutive end dates
WITH ordered_tasks AS (
  SELECT *,
         ROW_NUMBER() OVER (ORDER BY Start_Date) AS rn --ROW_NUMBER() assigns a row number ordered by Start_Date.
  FROM Projects
),
grouped_tasks AS (
  SELECT *,
         DATE_SUB(Start_Date, INTERVAL rn DAY) AS grp --DATE_SUB(Start_Date, INTERVAL rn DAY) gives a common key for consecutive dates.
  FROM ordered_tasks
)
SELECT
  MIN(Start_Date) AS project_start,
  MAX(End_Date) AS project_end
FROM grouped_tasks
GROUP BY grp
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)) ASC, MIN(Start_Date);
--Grouping by this value groups all consecutive tasks together.
--Then, for each group, we take the MIN(Start_Date) and MAX(End_Date) to define the project.
--We sort the result by project duration and then start date.
