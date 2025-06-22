-- Aggregate stats from views and submissions, joined by challenge -> college -> contest
SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    SUM(ss.total_submissions) AS total_submissions,
    SUM(ss.total_accepted_submissions) AS total_accepted_submissions,
    SUM(vs.total_views) AS total_views,
    SUM(vs.total_unique_views) AS total_unique_views
FROM Contests c
JOIN Colleges co ON c.contest_id = co.contest_id
JOIN Challenges ch ON ch.college_id = co.college_id
LEFT JOIN View_Stats vs ON vs.challenge_id = ch.challenge_id
LEFT JOIN Submission_Stats ss ON ss.challenge_id = ch.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING 
    SUM(ss.total_submissions) > 0 OR
    SUM(ss.total_accepted_submissions) > 0 OR
    SUM(vs.total_views) > 0 OR
    SUM(vs.total_unique_views) > 0
ORDER BY c.contest_id;

--Tables Involved:
--Contests(contest_id, hacker_id, name)
--Colleges(college_id, contest_id)
--Challenges(challenge_id, college_id)
--View_Stats(challenge_id, total_views, total_unique_views)
--Submission_Stats(challenge_id, total_submissions, total_accepted_submissions)

--Goal:
--For each contest_id, print:
--contest_id, hacker_id, name
--Sum of:
--total_submissions
--total_accepted_submissions
--total_views
--total_unique_views
--Exclude contests where all four sums are 0.

--Order by contest_id.
