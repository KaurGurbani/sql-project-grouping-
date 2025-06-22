-- SQL query to group tasks into projects based on consecutive end dates
WITH ordered_tasks AS (
  SELECT *,
         ROW_NUMBER() OVER (ORDER BY Start_Date) AS rn
  FROM Projects
),
grouped_tasks AS (
  SELECT *,
         DATE_SUB(Start_Date, INTERVAL rn DAY) AS grp
  FROM ordered_tasks
)
SELECT
  MIN(Start_Date) AS project_start,
  MAX(End_Date) AS project_end
FROM grouped_tasks
GROUP BY grp
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)) ASC, MIN(Start_Date);
