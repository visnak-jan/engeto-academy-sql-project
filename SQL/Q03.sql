CREATE OR REPLACE TABLE t_zmena_potravin
SELECT rok, product_name, average_price,
	round(((average_price - (lag(average_price) OVER (PARTITION BY product_name  ORDER BY rok))) * 100) / (lag(average_price) OVER (PARTITION BY product_name  ORDER BY rok)), 2) AS percent_change
FROM t_jan_visnak_project_sql_primary_final
GROUP BY rok, product_name 
ORDER BY product_name, rok;



SELECT * FROM t_zmena_potravin tzp ;


SELECT t1.rok, t2.product_name, t1.min_difference_percent
FROM (
	SELECT rok, min(percent_change) AS min_difference_percent
	FROM t_zmena_potravin
	WHERE percent_change IS NOT NULL
	GROUP BY rok
	ORDER BY rok) t1
JOIN (
	SELECT *
	FROM t_zmena_potravin) t2
ON t1.min_difference_percent = t2.percent_change
ORDER BY t1.rok;


 
 SELECT t1.rok, t1.product_name, t1.average_price, t2.average_price, round(((t2.average_price / t1.average_price) * 100 ) - 100, 2) AS percent_change
FROM (
	SELECT rok, product_name, average_price 
	FROM t_zmena_potravin
	WHERE rok = 2006) t1
JOIN (
	SELECT rok, product_name, average_price
	FROM t_zmena_potravin
	WHERE rok = 2018) t2
ON t1.product_name = t2.product_name;


SELECT t1.industry_name, t1.rok, t1.average_value, t2.rok, t2.average_value ,
	t2.average_value - t1.average_value AS value_increase,
	round(((t2.average_value-t1.average_value) * 100)/ t1.average_value,2) AS percent_increase
FROM (
	SELECT rok, industry_name, average_value
	FROM t_mzdy_rozdily
	WHERE rok = (
	SELECT min(rok) 
	FROM t_mzdy_rozdily)) t1
JOIN (
	SELECT rok, industry_name, average_value
	FROM t_mzdy_rozdily
	WHERE rok = (
	SELECT max(rok)
	FROM t_mzdy_rozdily)) t2
ON t1.industry_name = t2.industry_name;
