SELECT COUNT(*)	
FROM(
	SELECT DISTINCT *
	FROM (
			SELECT * 
			FROM master 
			WHERE master.height < 72
		) AS short, 
		(
			SELECT * 
			FROM batting 
			WHERE batting.ab >= 50 
			AND batting.yearid = 1995
		) AS  batters
	WHERE short.playerid = batters.playerid
	AND CAST(batters.h AS DECIMAL) / CAST(batters.ab AS DECIMAL) > 0.300
) AS distinctbatters
