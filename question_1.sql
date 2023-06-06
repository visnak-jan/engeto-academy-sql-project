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


SELECT rok, industry_code ,industry_name, percent_change 
FROM t_mzdy_rozdily
 WHERE difference_comment = 'pokles'
GROUP BY rok
ORDER BY percent_change asc ;


# chybí další otázky!!!!
