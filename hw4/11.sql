SELECT DISTINCT teams.park
FROM (
	SELECT seriespost.teamidwinner AS t, seriespost.yearid
	FROM seriespost
	WHERE seriespost.round LIKE '%DS%'
) AS dsw
JOIN teams
	ON dsw.t = teams.teamid
WHERE dsw.yearid = teams.yearid
AND teams.park NOT LIKE '%field$'
AND teams.park NOT LIKE '%park%'
AND teams.park NOT LIKE '%stadium%'
AND teams.park NOT LIKE '%Field%'
AND teams.park NOT LIKE '%Park%'
AND teams.park NOT LIKE '%Stadium%'
ORDER BY teams.park
