-- Clientes que viven en Brasil
-- Mostramos solo la información relevante y ordenamos por apellido
SELECT first_name, last_name, email
FROM customer
WHERE country = 'Brazil'
ORDER BY last_name;

-- Álbumes del grupo 'AC/DC'
-- Usamos JOIN para vincular artistas y sus álbumes
SELECT a.title
FROM album a
JOIN artist ar ON a.artist_id = ar.artist_id
WHERE ar.name = 'AC/DC';

-- Canciones con "love" en el nombre (ignorando mayúsculas)
-- ILIKE permite búsqueda insensible a mayúsculas
SELECT track_id, name, album_id
FROM track
WHERE name ILIKE '%love%';

-- Facturas con total mayor a 10 dólares
-- Ordenamos de mayor a menor para ver las más caras primero
SELECT invoice_id, invoice_date, billing_country, total
FROM invoice
WHERE total > 10
ORDER BY total DESC;

-- Los 5 clientes más recientes
-- Suponemos que customer_id refleja el orden de creación
SELECT customer_id, first_name, last_name, country
FROM customer
ORDER BY customer_id DESC
LIMIT 5;

-- Canciones que duran más de 5 minutos
-- Convertimos de milisegundos a minutos para que sea más legible
SELECT track_id, name, ROUND(milliseconds / 60000.0, 2) AS duration_min
FROM track
WHERE milliseconds > 300000
ORDER BY duration_min DESC;

-- Cantidad de clientes por país
-- Mostramos primero los países con más clientes
SELECT country, COUNT(customer_id) AS total_clients
FROM customer
GROUP BY country
ORDER BY total_clients DESC;

-- Empleados con título 'Sales Support Agent'
-- Mostramos datos básicos y fecha de contratación
SELECT employee_id, first_name, last_name, title, hire_date
FROM employee
WHERE title = 'Sales Support Agent'
ORDER BY hire_date;

-- Top 10 canciones más largas
-- Orden descendente según duración en minutos, limitando el resultado
SELECT track_id, name, ROUND(milliseconds / 60000.0, 2) AS duration_min
FROM track
ORDER BY duration_min DESC
LIMIT 10;

-- Clientes cuyo apellido empieza con "S"
-- Usamos UPPER para asegurar coincidencias, ordenamos alfabéticamente
SELECT customer_id, first_name, last_name, country
FROM customer
WHERE UPPER(last_name) LIKE 'S%'
ORDER BY last_name;
