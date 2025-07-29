/*
	Introducción a las bases de datos SQL
	Modulo 7: JOINS - LEFT JOIN & RIGHT JOIN
*/

-- Seleccionamos la base de datos
USE registro_climatico;

/* Sintaxis básica para usar LEFT JOIN

	SELECT column_name(s)
	FROM table1
	LEFT JOIN table2
	ON table1.column_name = table2.column_name;
    
*/

-- Por medio de un LEFT JOIN unir las tablas país y ciudad,
-- traer nombre del país y nombre de la ciudad
SELECT pais.nombre,
       ciudad.nombre
FROM pais -- Tabla de la IZQUIERDA
LEFT JOIN ciudad -- Tabla de la DERECHA
ON pais.codigo_iso = ciudad.id_pais;

-- Obtener el nombre de las estaciones que NO han hecho registros del clima
-- Con los siguiente es suficiente
SELECT *
FROM estacion
LEFT JOIN registros_clima
ON estacion.id = registros_clima.id_estacion;

-- Para traer solo las estaciones que no hayan registrado valores,
-- hacemos lo siguiente
SELECT estacion.nombre, registros_clima.*
FROM estacion
LEFT JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
WHERE registros_clima.id IS NULL;

/* Sintaxis básica para usar RIGHT JOIN

	SELECT column_name(s)
	FROM table1
	RIGHT JOIN table2
	ON table1.column_name = table2.column_name;
    
*/

-- Por medio de un RIGHT JOIN unir las tablas país y ciudad,
-- traer nombre del país y nombre de la ciudad
-- Hacemos lo del principio, pero ahora con un RIGHT JOIN
SELECT pais.nombre,
       ciudad.nombre
FROM pais -- Tabla de la IZQUIERDA
RIGHT JOIN ciudad -- Tabla de la DERECHA
ON pais.codigo_iso = ciudad.id_pais;

-- Obtenemos las estaciones que SÍ han hecho un registro de clima
-- Primero haremos esto
SELECT *
FROM estacion
RIGHT JOIN registros_clima
ON estacion.id = registros_clima.id_estacion;

-- Para ser más especificos hacemos lo siguiente
SELECT estacion.nombre, registros_clima.*
FROM estacion
RIGHT JOIN registros_clima
ON estacion.id = registros_clima.id_estacion;


-- Pequeños ejercicios

-- Mostrar el nombre de todas las condiciones climáticas  
-- que nunca han sido registradas en la tabla registros_clima. Usa LEFT JOIN
SELECT condicion_climatica.nombre
FROM condicion_climatica
LEFT JOIN registros_clima
ON condicion_climatica.id = registros_clima.id_condicion_climatica
WHERE registros_clima.id_condicion_climatica IS NULL;

-- Mostrar el nombre de las estaciones que no han recibido algún mantenimiento.
-- Usar RIGHT JOIN
SELECT estacion.nombre AS Estaciones
FROM mantenimiento
RIGHT JOIN estacion
ON mantenimiento.id_estacion = estacion.id
WHERE mantenimiento.id_estacion IS NULL;

-- Lista todas las ciudades (nombres) con sus estaciones meteorológicas (nombre),
-- incluso si no tienen ninguna estación. Usar RIGHT ó LEFT JOIN
-- Ordena el resultado por nombre de ciudad (A-Z)
SELECT ciudad.nombre AS Ciudad,
       estacion.nombre AS Estacion
FROM ciudad
LEFT JOIN estacion
ON ciudad.id = estacion.id_ciudad
ORDER BY ciudad.nombre ASC;