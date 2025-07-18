/*
	Introducción a las bases de datos SQL
	Modulo 7: JOINS - INNER JOIN
*/

-- Seleccionamos la base de datos
USE registro_climatico;

/* Sintaxis básica para usar INNER JOIN (explicito)

	SELECT column_name(s)
	FROM table1
	INNER JOIN table2
	ON table1.column_name = table2.column_name;
    
*/

-- Mostramos los datos de la tabla ciudad y estación que están relacionadas
SELECT * FROM ciudad;

SELECT * FROM estacion;

-- Realizar un INNER JOIN entra la tabla ciudad y estacion
SELECT *
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad;

-- Realizar un INNER JOIN entra la tabla ciudad y estacion. Obtener el nombre de la ciudad y su población,
-- así como el nombre de la estación y fecha de instalación, así como las id que hacen la unión
SELECT ciudad.nombre, ciudad.poblacion, 
       estacion.nombre, estacion.fecha_instalacion, 
       ciudad.id, estacion.id_ciudad
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad;

-- Podemos añadir alias a las tablas para acortar o aclarar los nombres de las tablas
SELECT c.nombre, c.poblacion, 
       e.nombre, e.fecha_instalacion, 
       c.id, e.id_ciudad
FROM ciudad AS c
INNER JOIN estacion AS e
ON c.id = e.id_ciudad;

-- Podemos aplicar filtros a nuestra consulta

-- Obtener las estaciones ubicadas en una ciudad con superficie mayor a 1000 km2.
-- Traer el nombre de la ciudad, superficie y nombre de la estación
SELECT estacion.nombre AS estacion,
       ciudad.superficie,
       ciudad.nombre AS ciudad 
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
WHERE ciudad.superficie > 1000;

-- Obtener las ciudades que tengan alguna estación ubicada a más de 2000 metros de altura.
-- Obntener la ciudad, la estación y su altura
SELECT ciudad.nombre AS ciudad,
	   estacion.altitud AS altitud_de_estacion,
       estacion.nombre AS estacion
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
WHERE estacion.altitud > 2000;

-- Obtener todos los datos de las estaciones Mexicanas instaladas apartir del 2010. Ordenar
-- por altitud de estación descendentemente
SELECT *
FROM ciudad
JOIN estacion -- Escribir JOIN equivale a INNER JOIN
ON ciudad.id = estacion.id_ciudad
WHERE estacion.fecha_instalacion >= '2010-01-01'
      AND ciudad.id_pais = 'MEX'
ORDER BY altitud DESC;

/* Sintaxis básica para usar INNER JOIN (implícito)

	SELECT column_name(s)
	FROM table1, table2
	WHERE table1.column_name = table2.column_name;
    
*/

-- Realizar un INNER JOIN entra la tabla ciudad y estacion
SELECT *
FROM ciudad, estacion
WHERE ciudad.id = estacion.id_ciudad;

-- Obtener todas las estaciones ubicadas en españa, traer solo el nombre de la estación.
SELECT estacion.nombre
FROM estacion, ciudad
WHERE estacion.id_ciudad = ciudad.id
      AND ciudad.id_pais = 'COL';
      
-- También podemos realizar joins con más de 2 tablas

-- Obtener el nombre de la estación, el nombre de la ciudad en donde se ubica
-- y el país (nombre completo)
SELECT pais.nombre AS Pais, 
       ciudad.nombre AS Ciudad,
       estacion.nombre AS Estacion
FROM pais
INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad;

-- Podemos escribir el join en cualquier orden, siempre y cuando se cumplan
-- de manera correcta las condiciones de unión
SELECT pais.nombre AS Pais, 
       ciudad.nombre AS Ciudad,
       estacion.nombre AS Estacion
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
INNER JOIN pais
On ciudad.id_pais = pais.codigo_iso;


-- Pequeños ejercicios

-- Realizar un INNER JOIN entre la tabla estacion y registros_clima,
-- traer el nombre de la estación, los registros de temperatura y la fecha y hora del registro
-- Hacerlo por medio de un join ímplicito y usando alias
SELECT e.nombre AS estacion,
       rc.temperatura,
       rc.fecha_hora
FROM estacion AS e, registros_clima AS rc
WHERE e.id = rc.id_estacion;

-- Obtener los registros de las estaciones con nombre de la estación, temperatura y humedad
-- registrada, fecha y hora del registro y condición climática registrada (nombre completo)
-- Realizar por medio de un join explicito y usando alias
SELECT e.nombre AS estacion,
       rc.temperatura,
       rc.humedad,
       rc.fecha_hora,
       cc.nombre AS condicion_climatica
FROM estacion AS e
INNER JOIN registros_clima AS rc
ON e.id = rc.id_estacion
INNER JOIN condicion_climatica AS cc
ON rc.id_condicion_climatica = cc.id;