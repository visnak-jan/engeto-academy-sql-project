CREATE OR REPLACE TABLE t_milk_and_bread_compare
SELECT
	milk_compare.l_milk_2006, milk_compare.l_milk_2018,
	l_milk_2018 - l_milk_2006 AS milk_difference,
	bread_compare.kg_bread_2006, bread_compare.kg_bread_2018,
	kg_bread_2018 - kg_bread_2006 AS bread_difference
FROM (
	SELECT t1.product_name,t1.rok, 
		round((t1.average_value / t1.average_price)) AS l_milk_2006,
		round((t2.average_value / t2.average_price)) AS l_milk_2018
	FROM (
	SELECT DISTINCT rok, avg(average_value) AS average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
			AND product_name LIKE 'Mléko%') t1
	JOIN (
		SELECT DISTINCT rok, avg(average_value) AS average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Mléko%') t2
	ON t1.product_name = t2.product_name) milk_compare
JOIN (
	SELECT t1.product_name, t1.rok,
		round((t1.average_value / t1.average_price)) AS kg_bread_2006,
		round((t2.average_value / t2.average_price)) AS kg_bread_2018
	FROM (
		SELECT DISTINCT rok, avg(average_value) AS average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Chléb%') t1
	JOIN (
		SELECT DISTINCT rok, avg(average_value) AS average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final)
		AND product_name LIKE 'Chléb%') t2
	ON t1.product_name = t2.product_name) bread_compare
ON milk_compare.rok = bread_compare.rok;
