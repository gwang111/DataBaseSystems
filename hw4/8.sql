SELECT al.yearid AS year, al.avgSalary/av.avgSalary AS ratio 
FROM
(
	SELECT salaries.yearid, SUM(salaries.salary)/COUNT(salaries.playerid) AS avgSalary
	FROM salaries
	JOIN allstarfull 
		ON allstarfull.playerid = salaries.playerid AND allstarfull.yearid = salaries.yearid
	GROUP BY salaries.yearid
) AS al
JOIN
(
	SELECT salaries.yearid, SUM(salaries.salary)/COUNT(salaries.playerid) AS avgSalary
	FROM salaries
	GROUP BY salaries.yearid
) AS av
ON av.yearid = al.yearid
ORDER BY al.yearid
