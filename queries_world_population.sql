SELECT COUNT(*) FROM countries
WHERE continent='Africa';
/*What was the total population of the continent of Oceania in 2005?*/

WITH oceania AS (
SELECT id FROM countries WHERE continent='Oceania')
SELECT sum(population) as 'Oceania population in 2005' FROM population_years JOIN oceania on population_years.country_id=oceania.id WHERE year=2005;
 
/*What is the average population of countries in South America in 2003?*/
WITH america AS (
SELECT id FROM countries WHERE continent='South America')
SELECT avg(population) as 'Average population in South America in 2003' FROM population_years JOIN america on population_years.country_id=america.id WHERE year=2003;
/*What country had the smallest population in 2007?*/
WITH smallest AS (
SELECT id, name FROM countries)
SELECT name, population_years.population as 'population in 2007' FROM smallest JOIN population_years on population_years.country_id=smallest.id WHERE population_years.year=2007 AND population_years.population is NOT NULL ORDER BY population_years.population ASC LIMIT 1;
/*What is the average population of Poland during the time period covered by this dataset?*/
SELECT avg(population) FROM population_years WHERE country_id=76;
/* How many countries have the word “The” in their name?*/
SELECT count(*) FROM countries WHERE name like '%The%';
/*What was the total population of each continent in 2010?*/
SELECT continent, sum(population_years.population) FROM countries JOIN population_years 
on countries.id=population_years.country_id WHERE population_years.year= 2010 GROUP BY 1 ORDER BY 2 DESC; 