--Goal:Print all prime numbers ≤ 1000 on a single line, separated by &.

WITH RECURSIVE Numbers AS (
  SELECT 2 AS num
  UNION ALL
  SELECT num + 1 FROM Numbers WHERE num < 1000
),
Primes AS (
  SELECT num FROM Numbers n
  WHERE NOT EXISTS (
    SELECT 1 FROM Numbers d 
    WHERE d.num < n.num AND d.num > 1 AND MOD(n.num, d.num) = 0
  )
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS Prime_Numbers
FROM Primes;
