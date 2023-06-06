CREATE OR REPLACE TABLE t_mzdy_rozdily
SELECT rok, industry_code,  industry_name, average_value,
	average_value - (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok)) AS "změna",
	round(((average_value - (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok))) * 100) / (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok)), 2) AS percent_change,
	CASE 
		WHEN average_value - (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok)) < 0 THEN 'pokles'
		WHEN average_value - (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok)) = 0 THEN "stagnace"
		WHEN average_value - (lag(average_value) OVER (PARTITION BY industry_name ORDER BY rok)) > 0 THEN "růst"
	END AS difference_comment
FROM t_Jan_Visnak_project_SQL_primary_final
GROUP BY rok, industry_name
ORDER BY industry_name;


# počet pokledů
SELECT rok, count(industry_code) AS 'počet'
FROM t_mzdy_rozdily
 WHERE difference_comment = 'pokles'
GROUP BY rok;


sELECT cpib.name
FROM czechia_payroll_industry_branch cpib
left JOIN (
	SELECT industry_name 
	FROM t_mzdy_rozdily
	WHERE difference_comment  IN ('pokles')
	GROUP BY industry_name) t1
ON cpib.name = t1.industry_name
WHERE t1.industry_name IS NULL;


# chybí další otázky!!!!

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



SELECT * FROM t_mzdy_rozdily;
