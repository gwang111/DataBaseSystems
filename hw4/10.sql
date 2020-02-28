SELECT DISTINCT schools.name_full, topschools.players
FROM (	
	SELECT colallstars.schoolid, COUNT(colallstars.playerid) AS players
	FROM (
		SELECT DISTINCT allstarfull.playerid, collegeplaying.schoolid
		FROM collegeplaying
		JOIN allstarfull
		ON collegeplaying.playerid = allstarfull.playerid
	) as colallstars
	GROUP BY colallstars.schoolid
) AS topschools
JOIN schools
 ON topschools.schoolid = schools.schoolid
ORDER BY topschools.players DESC
limit 10
