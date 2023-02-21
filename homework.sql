-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Answer: 2 actors

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer: 4794 payments were made

--- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, COUNT(*)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(*) DESC;

-- Answer: I got a lot of flim counts of 8s. I don't know how to do it, stayed up all night trynna solve it

-- 4. How many customers have the last name ‘William’?
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- Answer: None

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, SUM(rental_id)
FROM rental
GROUP BY staff_id;

-- Answer: Staff ID 1 with 64772289 rentals sold.

-- 6. How many different distinct names are there?
SELECT COUNT(DISTINCT first_name)
FROM customer;

SELECT COUNT(DISTINCT last_name)
FROM customer;

-- Answer: There are 591 distinct first names. (599 distinct last names. Most Likely wrong
-- but adding it anyway)

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- Answer: film_id 508 had 15 actors in its film

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT *
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- Answer: 13 customers

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- SELECT amount, customer_id, COUNT(rental_id)
-- FROM payment
-- WHERE customer_id BETWEEN 380 AND 430            ----MY OLD ANSWER
-- GROUP BY amount, customer_id;
-- HAVING COUNT(rental_id) > 250;

SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 and 430       -- Watched you do it with SJ it made sense
GROUP BY amount
HAVING COUNT(amount) > 250;

-- Answer: There are 3 payment amounts (None?----OLD ANSWER)

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- Answer: There are 5 rating categories and PG-13 had the most movie counts with 223 in total