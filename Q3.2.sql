select
	[week_didi],
	sum([reserve_visitors]) as visits,
	lag(sum([reserve_visitors]),1) over (order by week_didi asc) as periodo_anterior,
	/*Colocamos de forma tabular el periodo anterior para poder compararlo facilmente*/
	((sum([reserve_visitors])-lag(sum([reserve_visitors]),1) over (order by week_didi asc))/lag(sum([reserve_visitors]),1) over (order by week_didi asc)) as growth
	/*Dividimos la diferncia de la semana anterior entre la semana anterior*/ 
from
	[dbo].[Analy]
group by 
	week_didi