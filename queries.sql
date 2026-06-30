-- Query 1: Filter using WHERE to evaluate top-tier financial performers
-- Purpose: Extract names and streams of high earners clearing the 3.5 Lakh bar.
SELECT sl_no, ug_stream, salary 
FROM placements 
WHERE salary >= 350000;

-- Query 2: Segment using GROUP BY and aggregates to analyze stream performance
-- Purpose: Evaluate overall operational student count and average performance metrics by stream.
SELECT ug_stream, COUNT(*) as total_students, AVG(ug_percentage) as avg_ug_score
FROM placements
GROUP BY ug_stream;

-- Query 3: Rank using ORDER BY DESC to trace salary distribution
-- Purpose: Sort and reveal the top 5 highest entry packages achieved in placement cycles.
SELECT sl_no, ug_stream, specialisation, salary
FROM placements
ORDER BY salary DESC
LIMIT 5;
-- Query 4: Filter aggregated group subsets using HAVING
-- Purpose: Group students by their undergraduate stream and filter for major streams with more than 50 candidates.
SELECT ug_stream, COUNT(*) as student_count
FROM placements
GROUP BY ug_stream
HAVING COUNT(*) > 50;

-- Query 5: Evaluate ranges using BETWEEN for targeted assessment
-- Purpose: Isolate and review records for candidates tracking inside mid-tier scoring brackets.
SELECT sl_no, ug_percentage, placement_status
FROM placements
WHERE ug_percentage BETWEEN 65.0 AND 75.0;

-- Query 6: Complex multi-concept analytical evaluation
-- Purpose: Advanced combination query assessing the financial value of prior work experience.
-- Evaluates the absolute counts, average pay scale, and peak compensation for placed cohorts with background experience.
SELECT workex, COUNT(*) as candidate_volume, AVG(salary) as mean_package, MAX(salary) as absolute_peak
FROM placements
WHERE placement_status = 'Placed' AND ug_stream LIKE '%Sci%'
GROUP BY workex
ORDER BY mean_package DESC;