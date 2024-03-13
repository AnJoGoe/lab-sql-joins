-- ==========================================================
-- Challenge - Joining on multiple tables
-- ==========================================================

USE sakila;



-- Display all available tables 
SHOW TABLES;


-- ==========================================================
-- ==========================================================

-- Write SQL queries to perform the following tasks using the Sakila database:


-- 1. List the number of films per category.
SELECT 
    cat.name,
	COUNT(DISTINCT fil.film_id) AS "no_of_films"
FROM sakila.film AS fil
LEFT JOIN sakila.film_category AS fca ON fil.film_id = fca.film_id
JOIN sakila.category AS cat ON cat.category_id = fca.category_id
GROUP BY cat.name
ORDER BY "no_of_films" DESC;


-- ==========================================================
-- ==========================================================

-- 2. Retrieve the store ID, city, and country for each store.
SELECT *
FROM sakila.store AS sto;

SELECT *
FROM sakila.city AS cit;

SELECT *
FROM sakila.country AS cou;

SELECT *
FROM sakila.address AS adr;

SELECT 
	sto.store_id, 
    cit.city,
    cou.country
FROM sakila.store AS sto
INNER JOIN sakila.address AS adr ON sto.address_id = adr.address_id
INNER JOIN sakila.city AS cit ON adr.city_id = cit.city_id
INNER JOIN sakila.country AS cou ON cit.country_id = cou.country_id;


-- ==========================================================
-- ==========================================================


-- 3. Calculate the total revenue generated by each store in dollars.

SELECT sto.store_id,
	SUM(pay.amount) AS total_revenue
FROM sakila.store AS sto
INNER JOIN staff AS sta ON sto.manager_staff_id = sta.staff_id
INNER JOIN payment AS pay ON sta.staff_id = pay.staff_id
GROUP BY sto.store_id;


-- ==========================================================
-- ==========================================================


-- 4. Determine the average running time of films for each category
SELECT
	cat.name AS category,
    ROUND(AVG(fil.length),2) AS average_running_time
FROM sakila.film AS fil
INNER JOIN sakila.film_category as fca ON fil.film_id = fca.film_id
INNER JOIN sakila.category as cat ON fca.category_id = cat.category_id
GROUP BY cat.name;