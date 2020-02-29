SELECT master.namefirst AS first, master.namelast AS last
FROM
(
	SELECT batting.playerid, batting.yearid, batting.ab, batting.h
	FROM batting
	WHERE batting.stint = 2
) AS sec
JOIN
(
	SELECT batting.playerid, batting.yearid, batting.ab, batting.h
	FROM batting
	WHERE batting.stint = 1
) AS firs 
ON firs.playerid = sec.playerid AND firs.yearid = sec.yearid
JOIN master 
	ON master.playerid = sec.playerid
WHERE sec.ab > firs.ab AND sec.h < firs.h
ORDER BY master.weight DESC
