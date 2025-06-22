--Contest Duration: March 01, 2016 → March 15, 2016
--Tables:Hackers(hacker_id, name), Submissions(submission_date, submission_id, hacker_id, score)
--Goal:For each contest day:
--Count total number of unique hackers who made at least one submission.
--Identify the hacker_id and name of the hacker who made the maximum number of submissions that day.
--If there's a tie, pick the lowest hacker_id.
--Sort the output by submission_date

-- Step 1: Count submissions per hacker per day
WITH HackerSubmissions AS (
    SELECT 
        submission_date,
        hacker_id,
        COUNT(*) AS submissions
    FROM Submissions
    GROUP BY submission_date, hacker_id
),

-- Step 2: Find maximum submissions per day
MaxSubmissionsPerDay AS (
    SELECT 
        submission_date,
        MAX(submissions) AS max_subs
    FROM HackerSubmissions
    GROUP BY submission_date
),

-- Step 3: Join to get top hacker(s) per day
TopHackers AS (
    SELECT 
        hsd.submission_date,
        hsd.hacker_id,
        hs.submissions
    FROM HackerSubmissions hsd
    JOIN MaxSubmissionsPerDay mspd 
        ON hsd.submission_date = mspd.submission_date 
        AND hsd.submissions = mspd.max_subs
)

-- Final output: Total hackers and top hacker per day
SELECT 
    t.submission_date,
    (SELECT COUNT(DISTINCT hacker_id) 
     FROM Submissions s 
     WHERE s.submission_date = t.submission_date) AS total_hackers,
    t.hacker_id,
    h.name
FROM TopHackers t
JOIN Hackers h ON t.hacker_id = h.hacker_id
-- Resolve tie: Pick lowest hacker_id per day
WHERE t.hacker_id = (
    SELECT MIN(hacker_id)
    FROM TopHackers t2
    WHERE t2.submission_date = t.submission_date
)
ORDER BY t.submission_date;
