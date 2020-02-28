select first, last, appearances

from

(select max(namefirst) as first, max(namelast) as last, count(a.playerid) as appearances, sum(h.votes) as votes

from master m

left join halloffame h on h.playerid = m.playerid

left join allstarfull a on a.playerid = m.playerid

where h.yearid = 2000

group by a.playerid

order by count(a.playerid) desc, sum(h.votes) desc

limit 8) as s

order by appearances desc, votes
