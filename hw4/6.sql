SELECT s.first, s.last, appearances
FROM
(
	SELECT MAX(master.namefirst) AS first, MAX(master.namelast) AS last, COUNT(allstarfull.playerid) AS appearances, SUM(halloffame.votes) AS votes
	FROM master
	LEFT JOIN halloffame ON halloffame.playerid = master.playerid
	LEFT JOIN allstarfull ON allstarfull.playerid = master.playerid
	WHERE halloffame.yearid = 2000
	GROUP BY allstarfull.playerid
	ORDER BY COUNT(allstarfull.playerid) DESC, SUM(halloffame.votes) DESC
	limit 8
) AS s
ORDER BY s.appearances desc, s.votes
