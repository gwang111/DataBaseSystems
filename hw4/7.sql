SELECT abalot.playerid, SUM(CAST(abalot.h AS DECIMAL)/CAST(abalot.totab AS DECIMAL)) AS career_avg
FROM (
	SELECT DISTINCT batting.playerid, batting.yearid, batting.teamid, batting.h, batting.ab, career.totab
	FROM (
		SELECT SUM(filteredb.ab) as totab, filteredb.playerid
		FROM (
			SELECT batting.playerid, batting.yearid, batting.teamid, batting.ab 
			FROM master
			JOIN batting
				ON master.playerid = batting.playerid
			WHERE master.birthyear >= 1958
			AND master.birthyear <= 1960
		) AS filteredb
		GROUP BY filteredb.playerid
	) AS career
	JOIN batting
		ON career.playerid = batting.playerid
	WHERE career.totab > 300
) AS abalot
GROUP BY abalot.playerid
ORDER BY SUM(CAST(abalot.h AS DECIMAL)/CAST(abalot.totab AS DECIMAL)) DESC
