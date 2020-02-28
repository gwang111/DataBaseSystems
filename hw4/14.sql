SELECT DISTINCT final.awardid
FROM (	
	SELECT COUNT(mastercpy.yearid) as testconsecutive, mastercpy.awardid
	FROM (
		SELECT DISTINCT cpy3.awardid, cpy3.playerid, cpy3.yearid
		FROM (
			SELECT DISTINCT cpy1.awardid, cpy1.playerid, cpy1.yearid
			FROM (
				SELECT DISTINCT awardsplayers.awardid, awardsplayers.yearid, awardsplayers.playerid
				FROM awardsplayers
				WHERE awardsplayers.yearid >= 1950
				AND awardsplayers.yearid <= 1959
			) AS cpy1
			JOIN
			(
		    	SELECT DISTINCT awardsplayers.awardid, awardsplayers.yearid, awardsplayers.playerid
		   	 	FROM awardsplayers
		    	WHERE awardsplayers.yearid >= 1950
		   		AND awardsplayers.yearid <= 1959
			) AS cpy2
			ON cpy1.awardid = cpy1.awardid
			WHERE cpy1.playerid = cpy2.playerid
			AND ABS(cpy1.yearid - cpy2.yearid) = 1
		) AS cpy3
		JOIN 
		(
	   	    SELECT DISTINCT cpy1.awardid, cpy1.playerid, cpy1.yearid
	        FROM (
	            SELECT DISTINCT awardsplayers.awardid, awardsplayers.yearid, awardsplayers.playerid
	            FROM awardsplayers
	            WHERE awardsplayers.yearid >= 1950
	            AND awardsplayers.yearid <= 1959
	        ) AS cpy1
	        JOIN
	        (
	            SELECT DISTINCT awardsplayers.awardid, awardsplayers.yearid, awardsplayers.playerid
	            FROM awardsplayers
	            WHERE awardsplayers.yearid >= 1950
	            AND awardsplayers.yearid <= 1959
	        ) AS cpy2
	        ON cpy1.awardid = cpy1.awardid
	        WHERE cpy1.playerid = cpy2.playerid
	        AND ABS(cpy1.yearid - cpy2.yearid) = 1
	    ) AS cpy4
		ON cpy3.awardid = cpy4.awardid
		WHERE cpy3.playerid = cpy4.playerid
		AND ABS(cpy3.yearid - cpy4.yearid) = 1
	) AS mastercpy
	GROUP BY mastercpy.awardid, mastercpy.playerid
) AS final
WHERE testconsecutive = 3
