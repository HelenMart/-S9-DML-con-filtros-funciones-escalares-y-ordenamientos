# Proyecto SQL - Base de Datos Chinook

## Objetivo
Este proyecto tiene como objetivo practicar consultas SQL sobre la base de datos **Chinook**. Se incluyen 10 consultas que permiten extraer información de clientes, canciones, álbumes, facturas y empleados, cumpliendo los requisitos de la práctica.

---

## Verificación de la base de datos

1. Verificar los contenedores Docker:

```bash
docker ps -a
```

2. verificar si esta activo el contenedor, iniciarlo:
```bash
docker start postgres-chinook
```

3. Acceder al contenedor y abrir PostgreSQL:
```bash
\dt
```
4. acceder desde datagrip al contenedor y refrescar las tablas generadas con la restauracion.
5. seguido de esto ya podemos empezar a realizar consultas, teniendo en cuenta los pasos anteriores

## Consultas realizadas

### 1. Clientes que viven en Brasil
```bash
SELECT first_name, last_name, email
FROM customer
WHERE country = 'Brazil'
ORDER BY last_name;
```
Muestra el nombre, apellido y correo de los clientes que viven en Brasil, ordenados alfabéticamente por apellido.

### 2. Álbumes del grupo 'AC/DC'
```bash
SELECT a.title
FROM album a
JOIN artist ar ON a.artist_id = ar.artist_id
WHERE ar.name = 'AC/DC';
```
Se obtiene la lista de álbumes del artista AC/DC usando JOIN entre las tablas album y artist.

### 3. Canciones con "love" en el nombre
```bash
SELECT track_id, name, album_id
FROM track
WHERE name ILIKE '%love%';
```

Busca canciones cuyo nombre contenga la palabra "love" sin importar mayúsculas o minúsculas.
### 4. Facturas con total mayor a 10 dólares
```bash
SELECT invoice_id, invoice_date, billing_country, total
FROM invoice
WHERE total > 10
ORDER BY total DESC;
```
Muestra las facturas con total mayor a 10 dólares, ordenadas de mayor a menor.

### 5. Los 5 clientes más recientes
```bash
SELECT customer_id, first_name, last_name, country
FROM customer
ORDER BY customer_id DESC
LIMIT 5;
```
Obtiene los últimos 5 clientes registrados.

### 6. Canciones que duran más de 5 minutos
```bash
SELECT track_id, name, ROUND(milliseconds / 60000.0, 2) AS duration_min
FROM track
WHERE milliseconds > 300000
ORDER BY duration_min DESC;
```
Convierte la duración de milisegundos a minutos y muestra solo las canciones mayores a 5 minutos.

### 7. Cantidad de clientes por país
```bash
SELECT country, COUNT(customer_id) AS total_clients
FROM customer
GROUP BY country
ORDER BY total_clients DESC;
```
Cuenta clientes por país y muestra primero los países con más clientes.

### 8. Empleados con título 'Sales Support Agent'
```bash
SELECT employee_id, first_name, last_name, title, hire_date
FROM employee
WHERE title = 'Sales Support Agent'
ORDER BY hire_date;
```
Filtra empleados con ese título y los ordena por fecha de contratación.

### 9. Top 10 canciones más largas
```bash
SELECT track_id, name, ROUND(milliseconds / 60000.0, 2) AS duration_min
FROM track
ORDER BY duration_min DESC
LIMIT 10;
```
Lista las 10 canciones más largas ordenadas por duración.

### 10. Clientes cuyo apellido empieza con "S"
```bash
SELECT customer_id, first_name, last_name, country
FROM customer
WHERE UPPER(last_name) LIKE 'S%'
ORDER BY last_name;
```
Filtra clientes cuyo apellido inicia con "S", ignorando mayúsculas/minúsculas, y ordena alfabéticamente.
