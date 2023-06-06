CREATE OR REPLACE TABLE t_Jan_Visnak_project_SQL_primary_final As
SELECT t1.rok, t1.industry_code,t1.industry_name,t1.average_value,t2.product_code, t2.product_name,t2.average_price
FROM(
	SELECT cpib.code AS industry_code , cpib.name AS industry_name, avg(cp.value) AS average_value, cp.payroll_year AS rok
	FROM czechia_payroll cp
	LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code
		WHERE cp.value_type_code=5958 # Průměrná hrubá mzda na zaměstnance
		AND cp.unit_code = 200 # Kód jednotky 
		AND cp.industry_branch_code IS NOT  NULL # Vynechání sloupců, kde není odvětví
		AND cp.calculation_code = 100
	GROUP BY cpib.code, cpib.name, cp.payroll_year
	ORDER BY cp.payroll_year ASC)t1
INNER JOIN(
	SELECT  code AS product_code, cpc.name AS product_name, round(avg(value),2) AS average_price,year(date_from) AS "rok"
	FROM czechia_price cpr
		LEFT JOIN czechia_price_category cpc
		ON cpr.category_code = cpc.code
	GROUP BY name, YEAR(date_from))t2
ON  t1.rok = t2.rok
ORDER BY t1.rok DESC, t1.industry_code ASC;


CREATE OR REPLACE TABLE t_Jan_Visnak_project_SQL_secondary_final AS
SELECT e.country, c.continent, e.population, e.YEAR AS "rok", e.gdp, e.gini
FROM( SELECT country, population, YEAR ,gdp, gini  FROM economies
	WHERE YEAR  IN  (SELECT DISTINCT  rok  FROM t_Jan_Visnak_project_SQL_primary_final)
) e
INNER JOIN (
	SELECT country,continent FROM countries WHERE continent = "Europe" ) c
ON e.country =c.country 
WHERE e.country IS NOT NULL;


