/*
	Introducción a las bases de datos SQL
	Modulo 6: GROUP BY
*/

USE registro_climatico;


/* Sintaxis básica para usar GROUP BY

	SELECT column_name
	FROM table_name
	WHERE condition
	GROUP BY column_name;
    
*/

-- Agrupar los países que se encuentran en la tabla ciudad
SELECT id_pais
FROM ciudad
GROUP BY id_pais;

-- Obtener la población total por país de las ciudades que tenemos
-- registradas
SELECT id_pais, SUM(poblacion) as suma_poblacion
FROM ciudad
GROUP BY id_pais;

-- Podemos usar ORDER BY después del group by
SELECT id_pais, SUM(poblacion) as suma_poblacion
FROM ciudad
GROUP BY id_pais
ORDER BY id_pais ASC;

-- Podemos usar el campo con el que usamos la función de agregación
-- para ordenar
SELECT id_pais, SUM(poblacion) as suma_poblacion
FROM ciudad
GROUP BY id_pais
ORDER BY SUM(poblacion) DESC;

-- Lo siguiente NO funcionará
SELECT id_pais, SUM(poblacion) as suma_poblacion
FROM ciudad
GROUP BY id_pais
ORDER BY poblacion DESC;

-- Podemos agregar más funciones de agregación en un mismo GROUP BY
SELECT id_pais, 
       SUM(poblacion) AS suma_poblacion, 
       AVG(poblacion) AS promedio_poblacion, 
       SUM(superficie) AS suma_superficie
FROM ciudad
GROUP BY id_pais;

-- Podemos usar más de un campo para crear agrupaciones

-- Obtenemos las estaciones que recibieron mantenimiento, agrupadas por estación,
-- y luego por fecha, es decir mantenimientos por estación y fecha
SELECT id_estacion, fecha, COUNT(id_estacion) AS conteo_de_mantenimiento
FROM mantenimiento
GROUP BY id_estacion, fecha
ORDER BY id_estacion DESC, COUNT(id_estacion) DESC;

-- Si agregamos 'WIHT ROLLUP' al final de nuestro 'GROUP BY'
-- Podremos crear un total general
SELECT id_pais, 
       SUM(poblacion) AS suma_poblacion
FROM ciudad
GROUP BY id_pais WITH ROLLUP;

-- Para presentar un resultado más presentable, podemos usar la función
-- IFNULL para ponerlo un nombre al campo que hace el gran total
SELECT COALESCE(id_pais, 'TOTAL') AS 'id pais', 
       SUM(poblacion) AS suma_poblacion
FROM ciudad
GROUP BY id_pais WITH ROLLUP;


-- Pequeños ejercicios

-- Obtener la superficie promedio por país (Usar alias).
SELECT id_pais, AVG(superficie) AS superficie_promedio
FROM ciudad
GROUP BY id_pais;

-- Del ejercicio anterior, muestra los 3 países con mayor superficie promedio
SELECT id_pais, AVG(superficie) AS superficie_promedio
FROM ciudad
GROUP BY id_pais
ORDER BY AVG(superficie) DESC
LIMIT 3;

-- Obtener el conteo de mantenimientos recibidos por estación, ordenados de menor a mayor
-- por el número de mantenimientos recibidos. Incluir el total de mantenimientos hechos
SELECT COALESCE(id_estacion, 'Total mantenimientos') AS estacion, 
       COUNT(id_estacion)
FROM mantenimiento
GROUP BY id_estacion WITH ROLLUP
ORDER BY COUNT(id_estacion) ASC;