## SQL Projekt
Poznámky k SQL dotazům:

1. hlavní tabulka - tabulka dostuspnosti potravin na základě průměrných příjmů.
- zee zdrojových dat czechia_price byla vypočítána průměrná cena potravin za celý rok. Cela byla v rámci všech regionů ČR způrměrována.
- Pro každé odvětví byla ze zdrojové tabulky czechia_payroll vypočítán průměr roční mzdy pro každé odvětví. 
- data baly srovnávána mezi roky 2006 a 2018

2. sekundární tabulka - tabulka s HDP, GIni a datech evropských států
- v tabulce jsou data za stejné období jako v primární tabulce

## Otázky:

### 1. Rostou mzdy v průměbu hlet ve všech odvětvích nebo v některých klesají? 
- byla vytvořena tabulka, kde jsou porovnané průměrné mzdy pro každí odvětví a jejich % změna oproti roku předchozímu.
Bylo zjištěno následující:
  - Z této tabulky bylo zjištěno bylo několik odvětví, kde se ukázal pokles roční mzdy. Největší pokles byl v roce 2013. Roční mzdy nerostou pravidelně, v době finanční krize, která vypukla v roce 2009, došlo ke zhoršení ekonomických podmínek.

  - Ve sledovaném obodbí došlo k poklesu u následujícíh odvětví:

      | Odvětví | 
      | ------------- | 
      | Zpracovatelský průmysl  | 
      | Doprava a skladování  |
      |Administrativní a podpůrné činnosti |
      |Zdravotní a sociální péče  |
      | Ostatní činnosti  |
      
  - Lze konstatovat, že mzdy rostly ve všech odvětvých za sledované období 2006 - 2018. Pouze jsou zde období, kde došlo k poklesům jako ve zmiňovaném roce 2013, kde u 6 odvětví došlo oproti roku 2012 k poklesu.
      
      
### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- zpravidla si lze napříč všemi odvětvými dovolit koupit více mléka za průměrnou čistou mzdu  v roce 2018 s porovnáním s prvním obdobím v datech - rokem 2006. Jedinná vyjímka je odvětví Peněžnictví a pojišťovnictví. 
- Obdobné stanovisko platí i u chleba. Nejvíce chleba, konkrétně kg, si můžeme koupit v sektoru  . Na opačné straně je sektor Peněznictví a pojišťovnictví (241 kg méně). další odvětví, kde si lze koupit méně kg chleaba jsou: Ostatní činnosti, Těžba a dobývání,.

  | Produkt  | Rozdíl |
  | ------------- | ------------- |
  | Mléko  | 204,73 l  |
  | Chléb  | 57,32 kg  |
  
  
  ### 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
  
  
  ### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?.)
  
  Takoý rok neexistuje. 
  Nejvyšší rozdíl byl v roce 2013, kde byl rozdíl 6,79 %

  ### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
  Jelikož nemáme data cen potravin a mezd pro jiné země, než ČR, byla zkoumána data za Českou republiku. Z dat nelze zcela určit, že by pokles HDP měl vyliv na ceny nebo mzdy. 
  
| Rok  | HDP   | Průměrná změna cen | Průměrná změna mezd |
|------|-------|--------------------|---------------------|
| 2007 | 5.57  | 9.26               | 6.91                |
| 2008 | 2.69  | 8.92               | 7.42                |
| 2009 | -4.66 | -6.59              | 3.11                |
| 2010 | 2.43  | 1.52               | 2.19                |
| 2011 | 1.76  | 4.84               | 2.15                |
| 2012 | -0.79 | 7.47               | 2.83                |
| 2013 | -0.05 | 6.01               | -0.78               |
| 2014 | 2.26  | -0.62              | 2.49                |
| 2015 | 5.39  | -0.69              | 2.78                |
| 2016 | 2.54  | -1.41              | 3.97                |
| 2017 | 5.17  | 7.06               | 6.73                |
| 2018 | 3.2   | 2.41               | 7.67                |
