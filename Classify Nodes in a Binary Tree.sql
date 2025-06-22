--Table:BST(N, P)
--N = node
--P = parent (can be NULL if node is the root)
--Goal:Output the type of each node, ordered by N:
--Root: if P IS NULL
--Leaf: if it’s not a parent of any other node
--Inner: otherwise

SELECT 
  N,
  CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
    ELSE 'Inner'
  END AS NodeType
FROM BST
ORDER BY N;
