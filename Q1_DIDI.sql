SELECT top 5
	id ,
	AVG(reserve_visitors) as PROMEDIO_VISITAS
FROM 
	[dbo].[restaurants_visitors$]
LEFT OUTER JOIN /*Clasificamos la tabla de restaurants_visitors en base a date_info_V2 con el fin de poder filtrar holiday_flag*/
	[dbo].[date_info_V2$]
ON 
	[dbo].[restaurants_visitors$].visit_date=date_info_V2$.calendar_date
WHERE
	[holiday_flg]=1 /*Filtramos 1 indicando que es vacaciones*/
GROUP BY 
	id
order by
	 PROMEDIO_VISITAS desc