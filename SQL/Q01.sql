CREATE OR REPLACE TABLE t_wages_differences
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
FROM t_wages_differences
 WHERE difference_comment = 'pokles'
GROUP BY rok;


sELECT cpib.name
FROM czechia_payroll_industry_branch cpib
left JOIN (
	SELECT industry_name 
	FROM t_wages_differences
	WHERE difference_comment  IN ('pokles')
	GROUP BY industry_name) t1
ON cpib.name = t1.industry_name
WHERE t1.industry_name IS NULL;


# chybí další otázky!!!!

SELECT wd1.industry_name, wd1.rok, wd1.average_value, wd2.rok, wd2.average_value ,
	wd2.average_value - wd1.average_value AS value_increase,
	round(((wd2.average_value-wd1.average_value) * 100)/ wd1.average_value,2) AS percent_increase
FROM (
	SELECT rok, industry_name, average_value
	FROM t_wages_differences
	WHERE rok = (
	SELECT min(rok) 
	FROM t_wages_differences)) wd1
JOIN (
	SELECT rok, industry_name, average_value
	FROM t_wages_differences
	WHERE rok = (
	SELECT max(rok)
	FROM t_wages_differences)) wd2
ON wd1.industry_name = wd2.industry_name;



SELECT * FROM t_wages_differences;
