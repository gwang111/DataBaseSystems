SELECT avgsperyear.franchname AS franchise, AVG(avgsperyear.avgatt) AS attendance
FROM (
	SELECT AVG(CAST(combinedtable.attendance AS DECIMAL)) AS avgatt, combinedtable.yearid, combinedtable.franchname
	FROM (	
		SELECT teamsfranchises.franchid,  filteredteam.yearid, filteredteam.attendance, teamsfranchises.franchname
		FROM (
			SELECT *
			FROM teams
			WHERE teams.yearid >= 1997
		) AS filteredteam
		JOIN teamsfranchises
			ON filteredteam.franchid = teamsfranchises.franchid
	) AS combinedtable
	GROUP BY combinedtable.franchname, combinedtable.yearid
) AS avgsperyear
GROUP BY avgsperyear.franchname
ORDER BY avgsperyear.franchname
