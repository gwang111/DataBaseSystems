SELECT DISTINCT teams.name
FROM (
	SELECT MAX(teams.yearid) as yearid, teams.franchid
	FROM (
		SELECT COUNT(yearid) AS losses, lcsround.teamidloser
		FROM (	
			SELECT DISTINCT seriespost.teamidloser, seriespost.yearid
			FROM seriespost
			WHERE seriespost.round LIKE '%LCS%'
		) AS lcsround
		GROUP BY lcsround.teamidloser
	) AS losers
	JOIN teams
		ON teams.teamid = losers.teamidloser
	WHERE losers.losses > 2
	GROUP BY teams.franchid
) AS megalosers
JOIN teams
	ON megalosers.yearid = teams.yearid
JOIN teamsfranchises
	ON teamsfranchises.franchid = teams.franchid
WHERE teams.franchid = megalosers.franchid
ORDER BY teams.name

