SELECT t1.rok, t1.gdp_change, t2.average_price_change, t2.average_wage_change
FROM (
	SELECT rok, population, gini, gdp,
		round(((gdp - (lag(gdp) OVER (ORDER BY rok))) * 100) / (lag(gdp) OVER (ORDER BY rok)), 2) AS gdp_change
	FROM t_jan_visnak_project_sql_secondary_final
	WHERE country = 'Czech republic'
	ORDER BY rok) t1
JOIN (
	SELECT rok, average_price_change, average_wage_change
	FROM t_changes) t2
ON t1.rok = t2.rok;
