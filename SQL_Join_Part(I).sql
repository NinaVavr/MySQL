use sakila;

SELECT  c.name, count(*)
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name;

SELECT s.staff_id, s.first_name, s.last_name, sum(p.amount) AS "Total amount collected"
FROM staff AS s
INNER JOIN payment AS p
ON s.staff_id = p.staff_id
AND payment_date LIKE "2005-08%"
GROUP BY 1, 2;

SELECT a.first_name, a.last_name, count(*) as films
FROM sakila.actor as a
LEFT JOIN sakila.film_actor as f 
ON a.actor_id = f.actor_id 
GROUP BY first_name, last_name
ORDER BY films DESC;

SELECT c.first_name, c.last_name, count(rental_id) as rentals
FROM sakila.customer AS c
LEFT JOIN sakila.rental AS r 
ON c.customer_id = r.customer_id 
GROUP BY first_name, last_name
ORDER BY rentals DESC;

SELECT  s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;

SELECT f.title AS 'film', count(fa.actor_id) AS 'total_actors'
FROM film AS f
LEFT JOIN film_actor AS fa
ON f.film_id = fa.film_id
GROUP BY f.title;

SELECT c.first_name, c.last_name, sum(p.amount) AS 'total payment'
FROM payment AS p
LEFT JOIN customer AS c
ON c.customer_id = p.customer_id
GROUP BY p.customer_id;

SELECT c.name, count(fc.film_id) AS  "Total films"
FROM film_category AS fc
INNER JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY 1;

-- For question 8, please see answer 1 :) 












