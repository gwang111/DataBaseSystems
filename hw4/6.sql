SELECT final.namefirst, final.namelast, final.apps, final.votes
FROM(
	SELECT DISTINCT master.namefirst, master.namelast, topeight.apps, topeight.votes
	FROM (
		SELECT COUNT(asapps.yearid) AS apps, asapps.playerid, asapps.votes
		FROM (
			SELECT DISTINCT filthof.playerid, allstarfull.yearid, filthof.votes
			FROM (
				SELECT *
				FROM halloffame
				WHERE halloffame.yearid = 2000
			) AS filthof
			JOIN allstarfull
				ON filthof.playerid = allstarfull.playerid
		) AS asapps
		GROUP BY asapps.playerid, asapps.votes
	) AS topeight
	JOIN master
		ON topeight.playerid = master.playerid
	ORDER BY topeight.apps DESC, topeight.votes DESC 
) AS final
limit 8
