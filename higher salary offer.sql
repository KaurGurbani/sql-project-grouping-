SELECT S.Name --S.Name: the name of the student
FROM Students S --Join Students to Friends → to find each student's best friend
JOIN Friends F ON S.ID = F.ID
JOIN Packages P1 ON S.ID = P1.ID         -- Student's salary
JOIN Packages P2 ON F.Friend_ID = P2.ID  -- Friend's salary
WHERE P2.Salary > P1.Salary --Using WHERE clause to filter only those where friend's salary > student's salary
ORDER BY P2.Salary; --sort by best friend’s salary
