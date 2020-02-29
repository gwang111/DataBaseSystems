SELECT totSals.yearid AS year, sal AS salary
FROM (
	SELECT yearid, SUM(salary) AS sal
	FROM (
		SELECT *
		FROM (
			SELECT teams.teamid AS t, teams.yearid AS y
			FROM teams
			WHERE teams.wswin = 'Y'
		) AS champions
		JOIN salaries
			ON champions.t = salaries.teamid
			WHERE champions.y = salaries.yearid
	) AS champsals
	GROUP BY champsals.yearid, champsals.teamid
) totSals
ORDER BY sal DESC

