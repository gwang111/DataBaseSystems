	select distinct mas.namefirst as first, mas.namelast as last, mas.weight
	from
	(
		select playerid, yearid, ab, h
		from batting
		where stint = 2
	) as sec
	join
	(
		select playerid, yearid, ab, h
		from batting
		where stint = 1
	) as firs 
	on firs.playerid = sec.playerid and firs.yearid = sec.yearid
	join master mas 
		on mas.playerid = sec.playerid
	where sec.ab > firs.ab and sec.h < firs.h
	order by mas.weight desc
