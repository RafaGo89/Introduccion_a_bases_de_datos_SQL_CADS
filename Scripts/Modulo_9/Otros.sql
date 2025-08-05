/*
	Introducción a las bases de datos SQL
	Modulo 9: Tablas Temporales - Crear tablas usando una sentencia SELECT
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

/* Sintaxis básica para crear una tabla con una sentencia SELECT

	CREATE TABLE table_name AS
		SELECT column1, column2, ...
		FROM table_name;
    
*/

-- Creamos una tabla en base usando la siguiente sentencia SELECT
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

-- Creamos la tabla
CREATE TABLE estaciones_registros AS
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
    
-- Regresamos los datos de la tabla
SELECT *
FROM estaciones_registros;

-- Verificamos que la tabla existe
SHOW TABLES;

DESCRIBE estaciones_registros;

-- Podemos usar filtros en la tabla
SELECT *
FROM estaciones_registros
WHERE condicion_climatica = 'Despejado';

-- Podemos eliminar la tabla
DROP TABLE estaciones_registros;

/* Sintaxis básica para crear una tabla temporal

	CREATE TEMPORARY TABLE table_name AS
		SELECT column1, column2, ...
		FROM table_name;
    
*/

-- Creamos una tabla temporal
CREATE TEMPORARY TABLE TMP_num_mantenimientos AS
	SELECT E.nombre,
		   COUNT(*) AS conteo_mantenimientos
    FROM estacion AS E
    INNER JOIN mantenimiento AS M
    ON E.id = M.id_estacion
    GROUP BY E.nombre
    ORDER BY conteo_mantenimientos DESC;    
    
-- Obtenemos los datos de la tabla temporal
SELECT *
FROM TMP_num_mantenimientos;

-- Podemos emplear filtros en la tabla
SELECT nombre
FROM TMP_num_mantenimientos
WHERE conteo_mantenimientos >= 3;

-- También podemos eliminar la tabla temporal
DROP TABLE TMP_num_mantenimientos;