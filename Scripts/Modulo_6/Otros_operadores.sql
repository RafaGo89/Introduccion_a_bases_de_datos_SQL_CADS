/*
	Introducción a las bases de datos SQL
	Modulo 6: Otros operadores
*/

USE registro_climatico;

/* Sintaxis básica para usar el operador BETWEEN

	SELECT column_name(s)
	FROM table_name
	WHERE column_name BETWEEN value1 AND value2;
    
*/

-- Seleccionar las estaciones con una altitud de entre 100 a 500 metros
SELECT *
FROM estacion
WHERE altitud BETWEEN 100 AND 500;

-- Seleccionar las estaciones que se instalaron entre 2010 y 2015
SELECT *
FROM estacion
WHERE fecha_instalacion BETWEEN '2010-01-01' AND '2015-12-31';

/* Sintaxis básica para usar el operador IN

	SELECT column_name(s)
	FROM table_name
	WHERE column_name IN (value1, value2, ...);
    
*/

-- Obtener nombre y descripción de las siguientes condiciones climaticas:
-- Despejado, nevando, granizo y calor extremo
SELECT nombre, descripcion
FROM condicion_climatica
WHERE nombre IN ('Despejado', 'nevando', 'granizo', 'Calor extremo');

-- Obtener las ciudades que son de México y Estados Unidos
SELECT *
FROM ciudad
WHERE id_pais IN ('MEX', 'USA');

/* Sintaxis básica para usar el operador BETWEEN

	SELECT column1, column2, ...
	FROM table_name
	WHERE columnN LIKE pattern;
    
*/

-- Seleccionar a las ciudades que comienzan con la letra 'C'
SELECT *
FROM ciudad
WHERE nombre LIKE 'C%';

-- Seleccionar todas las estaciones que sean del 'Norte'
SELECT * 
FROM estacion
WHERE nombre LIKE '%Norte%';

-- Seleccionar todas las estaciones que terminen con la letra 'ed'
SELECT * 
FROM estacion
WHERE nombre LIKE '%e';

-- Seleccionar todas las ciudades que comiencen con la letra 'L' seguida de 3 caracteres
SELECT *
FROM ciudad
WHERE nombre LIKE 'L___';

-- Seleccionar todas las ciudades que que tengan 3 caracteres cualquiera al inicio,
-- seguidos de la letra 't' y 'e' y después 4 caracteres cualquiera
SELECT *
FROM ciudad
WHERE nombre LIKE '___te_ _ _ _';

-- Seleccionar las ciudades con una poblacion desde 9,000,000 a 9,999,999
SELECT *
FROM ciudad
WHERE poblacion LIKE '9______';