SELECT DISTINCT nyplayers.namefirst AS first, nyplayers.namelast AS last, nyplayers.birthcity AS city
FROM (
	SELECT master.playerid, master.birthcity, master.namefirst, master.namelast
	FROM master
	WHERE master.birthstate = 'NY'
) AS nyplayers
JOIN
(
	SELECT DISTINCT appearances.playerid
	FROM teams
	JOIN appearances
		ON teams.teamid = appearances.teamid
	WHERE teams.franchid = 'NYY'
) AS yankees
ON nyplayers.playerid = yankees.playerid
ORDER BY nyplayers.namelast
