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


    | Produkt         | Rozdíl       | 
      | ------------- | -------------
      | Mléko  |         204,73 l             |                 
      | Chléb  |   57,32 kg
  | Produkt  | Rozdíl |
| ------------- | ------------- |
| Mléko  | 204,73 l  |
| Chléb  | 57,32 kg  |

