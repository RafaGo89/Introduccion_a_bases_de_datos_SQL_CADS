/*
	Introducción a las bases de datos SQL
	Modulo 6: Cláusula HAVING
*/

USE registro_climatico;

/* Sintaxis básica para usar HAVING

	SELECT column_name
	FROM table_name
	GROUP BY column_name
	HAVING condition;
    
*/

-- Podemos emplear la cláusula WHERE al mismo tiempo que GROUP BY, pero...

-- Obtenemos los mantenimientos hechos en el año 2025
SELECT id_estacion, fecha
FROM mantenimiento
WHERE fecha BETWEEN '2025-01-01' AND '2025-12-31';

-- Con base a la tabla que esta sentencia nos devuelve usando WHERE, podemos realizar
-- Una agrupación con un conjunto de filas reducido

-- Obtenemos el conteo de mantenimientos en el año 2025 por estación
SELECT id_estacion, COUNT(id_estacion)
FROM mantenimiento
WHERE fecha BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY id_estacion;

-- Lo anterior es correcto, pero si queremos realizar alguna condición de filtrado
-- para los grupos, WHERE no nos servira

-- Obtenemos el conteo de mantenimientos por estación para aquellas estaciones que hayan
-- recibido más de 2 mantenimientos. Esto nos dará un error:
SELECT id_estacion, COUNT(id_estacion)
FROM mantenimiento
GROUP BY id_estacion
WHERE COUNT(id_estacion) > 2;

-- Pero si reemplazamos WHERE con HAVING, ahora sí funcionará
-- HAVING es como el WHERE pero cuando se aplican filtros a grupos
SELECT id_estacion, COUNT(id_estacion) AS conteo_estaciones
FROM mantenimiento
GROUP BY id_estacion
HAVING COUNT(id_estacion) > 2;

-- Podemos usar el alias de la función de agregación para el filtro
SELECT id_estacion, COUNT(id_estacion) AS conteo_estaciones
FROM mantenimiento
GROUP BY id_estacion
HAVING conteo_estaciones > 2;

-- Obtener a los países con una superficie promedio menor a 700 m2
SELECT id_pais, AVG(superficie) AS superficie_promedio_por_pais
FROM ciudad
GROUP BY id_pais
HAVING superficie_promedio_por_pais < 700;

-- Obtener las ciudades que tienen una población mayor o igual a la del promedio de todas las ciudades, 
-- ordenado de manera descendente por tamaño de poblacion
SELECT nombre, SUM(poblacion) AS suma_poblacion
FROM ciudad
GROUP BY nombre
HAVING suma_poblacion >= (SELECT AVG(poblacion)
                          FROM ciudad)
ORDER BY suma_poblacion DESC;

-- Obtener la temperatura promedio por estación de los registros ubicados en
-- estaciones  Mexicanas
SELECT id_estacion, AVG(temperatura) AS temperatura_promedio
FROM registros_clima
GROUP BY id_estacion
HAVING id_estacion LIKE 'MEX%';

-- Lo anterior se podría hacer con WHERE de esta manera
SELECT id_estacion, AVG(temperatura) AS temperatura_promedio
FROM registros_clima
WHERE id_estacion LIKE 'MEX%'
GROUP BY id_estacion;

-- Obtener los registros de clima por estación, de aquellas estaciones con 5 o más
-- registros almacenados
SELECT id_estacion, COUNT(id_estacion) AS conteo_de_registros
FROM registros_clima
GROUP BY id_estacion
HAVING conteo_de_registros >= 5;


-- Pequeños ejercicios

-- Obtener las estaciones que hayan registrado una humedad máxima mayor al 95%

-- Obtener las estaciones cuyo valor más pequeño de velocidad del viento registrado
-- sea menor o igual 5 km/h. Ordenalo ascendentemente por la velocidad del viento

-- Obtener a los países con una población total de entre 5,000,000 y 10,000,000.
-- Ordenados por población de manera descendente