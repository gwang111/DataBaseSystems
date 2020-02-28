SELECT avgsperyear.franchname, AVG(avgsperyear.avgatt)
FROM (
	SELECT AVG(CAST(combinedtable.attendance AS DECIMAL)) AS avgatt, combinedtable.yearid, combinedtable.franchname
	FROM (	
		SELECT DISTINCT teamsfranchises.franchid,  filteredteam.yearid, filteredteam.attendance, teamsfranchises.franchname
		FROM (
			SELECT *
			FROM teams
			WHERE teams.yearid >= 1997
		) as filteredteam
		JOIN teamsfranchises
			ON filteredteam.franchid = teamsfranchises.franchid
	) as combinedtable
	GROUP BY combinedtable.franchname, combinedtable.yearid
) avgsperyear
GROUP BY avgsperyear.franchname
ORDER BY avgsperyear.franchname
