-- Assuming destination has same structure as source
INSERT INTO TargetTable
SELECT *
FROM SourceTable
EXCEPT
SELECT *
FROM TargetTable;
