CREATE TABLE t_changes
SELECT t1.rok, t1.average_price_change, t2.average_wage_change,
	t1.average_price_change - t2.average_wage_change AS 'changes'
FROM (
	SELECT rok, round(avg(percent_change),2) AS average_price_change
	FROM t_zmena_potravin
	WHERE percent_change IS NOT NULL
	GROUP BY rok) t1
JOIN (
	SELECT rok, round(avg(percent_change),2) AS average_wage_change 
	FROM t_mzdy_rozdily
	WHERE percent_change IS NOT NULL
	GROUP BY rok) t2
ON t1.rok = t2.rok;
