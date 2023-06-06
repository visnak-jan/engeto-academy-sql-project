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
      
      
      
      
### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
