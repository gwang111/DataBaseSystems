SELECT s.playerid, s.h/s.ab AS career_avg
FROM
(
    SELECT master.playerid, sum(batting.h) AS h, sum(batting.ab) AS ab
    FROM master
    LEFT JOIN batting
        ON batting.playerid = master.playerid
    WHERE master.birthyear >= 1958
    AND master.birthyear <= 1960
    GROUP BY master.playerid
) AS s
WHERE s.ab > 300
ORDER BY s.h/s.ab DESC
