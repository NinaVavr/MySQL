-- Activity 1
-- 1.Drop column picture from staff.
ALTER TABLE sakila.staff
DROP COLUMN picture;

SELECT  * FROM sakila.staff; 

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO sakila.staff (first_name, last_name, address_id, email, store_id, active, username)
SELECT first_name, last_name, address_id, email, store_id, active, first_name
FROM sakila.customer
WHERE (first_name = 'TAMMY');

-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select * from sakila.customer
WHERE first_name = 'CHARLOTTE';

select * from sakila.inventory; 

select * from sakila.rental;

SELECT * from film
WHERE title = 'Academy Dinosaur';

INSERT INTO sakila.rental (inventory_id, customer_id, staff_id)
VALUES (1, 130, 1);

-- Activity 2
-- Drop table sakila.film_category 
-- Add column film_id at table sakila.category
-- Drop table sakila.film_actor 
-- Add column film_id at table sakila.actor
-- Drop table sakila.language
-- Add column name at table sakila.film

ALTER TABLE sakila.film
ADD COLUMN name float NOT NULL AFTER length;

select * FROM sakila.film;

ALTER TABLE sakila.staff
DROP COLUMN picture;

DROP TABLE IF EXISTS sakila.language;



