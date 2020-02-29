SELECT gettheyears.yearid AS years
FROM (
	SELECT topmanagers.yearid, teams.teamid
	FROM (	
		SELECT managers.playerid, managers.teamid, managers.yearid
		FROM (
			SELECT MAX(managers.w) AS wins, managers.yearid
			FROM managers
			WHERE managers.yearid >= 1975
			GROUP BY managers.yearid
		) AS dubs
		JOIN managers
			ON dubs.wins = managers.w
		WHERE dubs.yearid = managers.yearid
	) AS topmanagers
	JOIN teams
		ON topmanagers.teamid = teams.teamid
	WHERE topmanagers.yearid = teams.yearid
	AND teams.divwin = 'Y'
	ORDER BY topmanagers.yearid DESC
) gettheyears
