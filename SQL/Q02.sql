CREATE OR REPLACE TABLE CREATE OR REPLACE TABLE t_milk_and_bread_compare
SELECT
	table_1.l_milk_2006, table_2.l_milk_2018,
	l_milk_2018 - l_milk_2006 AS milk_difference,
	table_1.kg_bread_2006, table_2.kg_bread_2018,
	kg_bread_2018 - kg_bread_2006 AS bread_difference
FROM (
	SELECT t1.industry_name, t1.rok, 
		round((t1.average_value / t1.average_price)) AS l_milk_2006,
		round((t2.average_value / t2.average_price)) AS kg_bread_2006
	FROM (
	SELECT industry_name, rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
			AND product_name LIKE 'Mléko%') t1
	JOIN (
		SELECT industry_name, rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Chléb%') t2
	ON t1.industry_name = t2.industry_name) table_1
JOIN (
	SELECT t1.industry_name, t1.rok, 
		round((t1.average_value / t1.average_price)) AS l_milk_2018,
		round((t2.average_value / t2.average_price)) AS kg_bread_2018
	FROM (
		SELECT industry_name, rok, average_value , product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Mléko%') t1
	JOIN (
		SELECT industry_name,rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final)
		AND product_name LIKE 'Chléb%') t2
	ON t1.industry_name = t2.industry_name) table_2
ON table_1.industry_name = table_2.industry_name;

SELECT 
	round(avg(l_milk_2006), 2) AS avg_l_milk_2006,
	round(avg(l_milk_2018), 2) AS avg_l_milk_2018,
	round(avg(l_milk_2018), 2) - round(avg(l_milk_2006), 2) AS avg_milk_difference,
	round(avg(kg_bread_2006), 2) AS avg_kg_bread_2006,
	round(avg(kg_bread_2018), 2) AS avg_kg_bread_2018,
	round(avg(kg_bread_2018), 2) - round(avg(kg_bread_2006), 2) AS avg_bread_difference
FROM t_milk_and_bread_compare;




SELECT * FROM t_milk_and_bread_compare;
SELECT
	table_1.l_milk_2006, table_2.l_milk_2018,
	l_milk_2018 - l_milk_2006 AS milk_difference,
	table_1.kg_bread_2006, table_2.kg_bread_2018,
	kg_bread_2018 - kg_bread_2006 AS bread_difference
FROM (
	SELECT t1.industry_name, t1.rok, 
		round((t1.average_value / t1.average_price)) AS l_milk_2006,
		round((t2.average_value / t2.average_price)) AS kg_bread_2006
	FROM (
	SELECT industry_name, rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
			AND product_name LIKE 'Mléko%') t1
	JOIN (
		SELECT industry_name, rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT min(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Chléb%') t2
	ON t1.industry_name = t2.industry_name) table_1
JOIN (
	SELECT t1.industry_name, t1.rok, 
		round((t1.average_value / t1.average_price)) AS l_milk_2018,
		round((t2.average_value / t2.average_price)) AS kg_bread_2018
	FROM (
		SELECT industry_name, rok, average_value , product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final )
		AND product_name LIKE 'Mléko%') t1
	JOIN (
		SELECT industry_name,rok, average_value, product_name, average_price
		FROM t_jan_visnak_project_sql_primary_final 
		WHERE rok = (
			SELECT max(rok) 
			FROM t_jan_visnak_project_sql_primary_final)
		AND product_name LIKE 'Chléb%') t2
	ON t1.industry_name = t2.industry_name) table_2
ON table_1.industry_name = table_2.industry_name;

SELECT 
	round(avg(l_milk_2006), 2) AS avg_l_milk_2006,
	round(avg(l_milk_2018), 2) AS avg_l_milk_2018,
	round(avg(l_milk_2018), 2) - round(avg(l_milk_2006), 2) AS avg_milk_difference,
	round(avg(kg_bread_2006), 2) AS avg_kg_bread_2006,
	round(avg(kg_bread_2018), 2) AS avg_kg_bread_2018,
	round(avg(kg_bread_2018), 2) - round(avg(kg_bread_2006), 2) AS avg_bread_difference
FROM t_milk_and_bread_compare;




SELECT * FROM t_milk_and_bread_compare;
