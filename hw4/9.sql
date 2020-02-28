SELECT totteamsals.yearid AS year, AVG(totteamsals.teamtot) AS salary
FROM (	
	SELECT SUM(CAST(teamsals.salary AS DECIMAL)) as teamtot, teamsals.teamid, teamsals.yearid
	FROM (
		SELECT DISTINCT salaries.teamid, salaries.playerid, salaries.yearid, salaries.salary
		FROM teams
		JOIN salaries
			ON teams.teamid = salaries.teamid
		WHERE teams.yearid = salaries.yearid
	) AS teamsals
	GROUP BY teamsals.teamid, teamsals.yearid
) AS totteamsals
GROUP BY totteamsals.yearid
ORDER BY totteamsals.yearid
