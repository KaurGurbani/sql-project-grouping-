--Table:STATION(ID, CITY, STATE, LAT_N, LONG_W)
--Goal:
--Calculate the Manhattan Distance between:
--Point 1: min(LAT_N), min(LONG_W)
--Point 2: max(LAT_N), max(LONG_W)
--Round the result to 4 decimal places.

-- Compute Manhattan Distance: |a - c| + |b - d|
SELECT ROUND(
  ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)),4
) AS Manhattan_Distance
FROM STATION;


