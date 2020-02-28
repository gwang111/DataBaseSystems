select yearid as year, sum(salary)/count(distinct teamid) as salary

from salaries

group by yearid

order by yearid
