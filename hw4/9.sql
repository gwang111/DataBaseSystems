SELECT salaries.yearid AS year, SUM(salaries.salary)/COUNT(DISTINCT salaries.teamid) AS salary
FROM salaries
GROUP BY salaries.yearid
ORDER BY salaries.yearid
