SELECT
	day_of_week ,
	AVG(reserve_visitors) as PROMEDIO_VISITAS
FROM 
	[dbo].[restaurants_visitors$]
LEFT OUTER JOIN /*Clasificamos la tabla de restaurants_visitors en base a date_info_V2 con el fin de poder filtrar day_of_the_week*/
	[dbo].[date_info_V2$]
ON 
	[dbo].[restaurants_visitors$].visit_date=date_info_V2$.calendar_date
GROUP BY 
	day_of_week
order by
	 PROMEDIO_VISITAS desc