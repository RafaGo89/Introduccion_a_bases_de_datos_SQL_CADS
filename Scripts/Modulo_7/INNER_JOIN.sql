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

-- Podemos usar el GROUP BY sin ningún problema en nuestro JOIN
-- Obtenemos la cantidad de estaciones por país ordenado descendentemente por cantidad de estaciones
SELECT pais.nombre AS Pais,
       COUNT(estacion.id) AS cantidad_de_estaciones
FROM ciudad
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
INNER JOIN pais
On ciudad.id_pais = pais.codigo_iso
GROUP BY pais
ORDER BY cantidad_de_estaciones DESC;


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

-- Obtener el nombre de todas las estaciones que registraron que nevó
SELECT estacion.nombre
FROM estacion
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
INNER JOIN condicion_climatica
ON registros_clima.id_condicion_climatica = condicion_climatica.id
WHERE condicion_climatica.nombre = 'Nevada';

-- Muestra los países (nombre) donde alguna estación ha registrado 
-- una condición climática de “Tormenta” y de aquellas estaciones instaladas
-- a partir del 2010.
-- NOTA: el nombre del país debe de aparecer una sola vez
SELECT DISTINCT pais.nombre
FROM pais

INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
INNER JOIN condicion_climatica
ON registros_clima.id_condicion_climatica = condicion_climatica.id

WHERE condicion_climatica.nombre = 'Tormenta'
      AND estacion.fecha_instalacion >= '2010-01-01';
      
-- Obtener los países que registraron más de 2 veces calor extremo
SELECT DISTINCT pais.nombre, COUNT(*) AS conteo_de_calor_extremo
FROM pais

INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
INNER JOIN condicion_climatica
ON registros_clima.id_condicion_climatica = condicion_climatica.id

WHERE condicion_climatica.nombre = 'Calor Extremo'

GROUP BY pais.nombre
HAVING conteo_de_calor_extremo > 2;

-- Obtener el nombre de la estación y la fecha del último registro de clima ingresado
SELECT estacion.nombre AS Estacion,
       MAX(registros_clima.fecha_hora) AS Ultimo_registro
FROM estacion
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
GROUP BY estacion.nombre;



-- Cosa Extra
-- Obtener el nombre de la estación, la fecha del último registro de clima ingresado
-- y el nombre de la condición climatica registrada
SELECT estacion.nombre AS Estacion,
	   registros_clima.fecha_hora AS Ultimo_registro,
       condicion_climatica.nombre AS Condicion_climatica
       
FROM estacion
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
INNER JOIN condicion_climatica
ON registros_clima.id_condicion_climatica = condicion_climatica.id

WHERE CONCAT(registros_clima.id_estacion, registros_clima.fecha_hora) 
                                     IN (SELECT CONCAT(id_estacion, 
												MAX(fecha_hora)) 
									     FROM registros_clima
                                         GROUP BY id_estacion);