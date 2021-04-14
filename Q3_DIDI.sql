Create view Analy
AS
SELECT
	reserve_visitors,
	(case when visit_date >= '2017-04-30 00:00:00.000' and visit_date <= '2017-05-06 00:00:00.000' then '18' else
			case when visit_date >= '2017-05-07 00:00:00.000' and visit_date <= '2017-05-13 00:00:00.000' then '19' else
			case when visit_date >= '2017-05-14 00:00:00.000' and visit_date <= '2017-05-20 00:00:00.000' then '20' else 
			case when visit_date >= '2017-05-21 00:00:00.000' and visit_date <= '2017-05-27 00:00:00.000' then '21' else 
			case when visit_date >= '2017-05-28 00:00:00.000' and visit_date <= '2017-05-31 00:00:00.000' then '22' else null end end end end end)  as week_didi
	/*Creamos una nueva columna con el número de la semana para facilitar la comparación*/
	FROM 
		[dbo].[restaurants_visitors$]
	where 
		visit_date > '2017-04-29 00:00:00.000'
	/*Filtramos las fechas que nos solicitan para no traer más de lo necesario*/