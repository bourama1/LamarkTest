# Datový analytik úloha
## Technologie
- použita databáze PostgreSQL
- k vizualizaci použit Power BI
- výstupy skriptů uloženy do Excelu, formát xlsx
## Postup spuštění
1. CreateTables.sql
2. InsertData.sql
3. libovolné pořadí spouštění skiptů s analýzou
## Popis skriptů
1. CreateTables
  - pokud již existují tabulky které má vytvořit tak je smaže
  - vytvoří tabulky dle zadaného schématu
  - v rámci jednotlivých tabulek zkontroluje a zajistí konzistenci v uložených datech
    - vstupní ani výstupní cena nemohou být menší než nula
    - unikátnost názvu produktu a uživatelského jména
    - objednávaná kvantita produktů nemůže být menší nebo rovná nule
    - datum objednávky nemůže být v budoucnu
2. InsertData
  - smaže již existující data a restartuje sekvenční identifikátory
  - naplní tabulky náhodnými, ale smysluplnými daty
    - výstupní cena ve většině případu vyšší než vstupní, ale může se stát že je třeba prodat pod cenou
    - náhodný výběr produktu i uživatele k objednávce
    - datum k objednávce náhodné z posledního roku od aktuálního data
  - výpíše informace o tom že se podařilo vytvořit dané data
3. AvgProfit
  - spojí informace z objednávek a produktů, aby získal profit z jednoho produktu, který následně vynásobí kvantitou dané objednávky a nakonec použitím AVG vrátí průměr z těchto výpočtů
4. OrderMonths
  - 1. verze - vezme rok a měsíc ze všech objednávek, pomocí kterých poté agreguje, a k nim přiřadí pomocí funkce COUNT počet všech objednávek za dané období
  - 2. verze - převede datum pouze na měsíc a pomocí něho agreguje, dojde tedy ke spojení měsíců z různých let, což může být vhodné k prozkoumání sezonních vlivů na počet objednávek
5. OrderNum & ProductNum
  - spočte pomocí COUNT počet všech objednávek/produktů
6. ProductAvgPrice
  - spočte pomocí AVG průměrnou prodejní cenu produktů
7. ProductTop10
  - 1. verze - pomocí funkce SUM sečte kvantity daného produktu v rámci objednávek, následně je agreguje dle produktu a seřadí sestupně od největšího, omezeno na 10 největších
  - 2. verze - pomocí funkce COUNT spočte počet různých objednávek daného produktu, následně agreguje podle produktu a sestupně seřadí podle počtu jeho objednávek, omezeno na 10 největších, rozdíl je tedy že nebere v potaz kolik se daného produktu objednává ale pouze v kolika objednávkách je
8. TotalProfit
  - shodné s průměrným ziskem, pouze použije funkci SUM pro součet profitů místo AVG pro průměr
9. UserTop10
 - spočte pomocí COUNT počet všech různých objednávek pro daného uživatele, agreguje dle toho uživatele a výstup omezí na 10 uživatelů s nejvíce objednávkami sestupně
## Výstupy z Power BI
### Analýza produktů
![image](https://github.com/bourama1/LamarkTest/assets/73535167/3da1ffe0-67cd-47c4-88e9-f411af4eb3fa)
### Analýza objednávek + absolutní a průměrný profit z objednávek
![image](https://github.com/bourama1/LamarkTest/assets/73535167/ed982a31-e265-433b-a1b1-9ec1b245c903)
### Analýza uživatelů
![image](https://github.com/bourama1/LamarkTest/assets/73535167/06eae2b9-9e4d-417f-815b-60119f15252d)
