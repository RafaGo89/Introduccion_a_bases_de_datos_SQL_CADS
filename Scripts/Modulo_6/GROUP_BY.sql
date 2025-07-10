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