select al.yearid as year, al.avgSalary/av.avgSalary as ratio from

(select s.yearid, sum(s.salary)/count(s.playerid) as avgSalary

from salaries s

join allstarfull a on a.playerid = s.playerid and a.yearid = s.yearid

group by s.yearid) as al

join

(select yearid, sum(salary)/count(playerid) as avgSalary

from salaries

group by yearid) as av

on av.yearid = al.yearid

order by al.yearid
