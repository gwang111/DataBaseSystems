SELECT COUNT(DISTINCT totsv.playerid)
FROM (
	SELECT SUM(pitching.sv) AS svs, pitching.playerid, pitching.yearid
	FROM pitching
	WHERE pitching.yearid >= 1975
	GROUP BY pitching.yearid, pitching.playerid
) AS totsv
WHERE totsv.svs > 40
