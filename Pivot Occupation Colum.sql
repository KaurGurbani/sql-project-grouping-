--Table: OCCUPATIONS(Name, Occupation)
--Goal:Pivot names under their Occupation type, in alphabetical order.
--Output Columns:Doctor, Professor, Singer, Actor

SELECT
  MIN(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
  MIN(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
  MIN(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
  MIN(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
  SELECT Name, Occupation,
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
  FROM OCCUPATIONS
) AS Ranked
GROUP BY rn;
