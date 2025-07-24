/*
	Introducción a las bases de datos SQL
	Modulo 8: Funciones integradas - Funciones numéricas
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

-- ABS()
-- Regresa el valor absoluto de un número
SELECT ABS(-89);

-- CEIL() ó CEILING()
-- Redondea siempre hacia arriba un número
SELECT CEIL(20.5);

SELECT CEILING(10.001);

-- FLOOR()
-- Redondea siempre hacia abajo un número
SELECT FLOOR(20.5);

SELECT FLOOR(10.999999);


-- ROUND()
-- Redondea un número
SELECT ROUND(20.5, 0);

SELECT ROUND(20.4, 0);

SELECT ROUND(20.4897, 2);

SELECT ROUND(2053, 3);

SELECT id_estacion,
       humedad,
       CEIL(humedad),
       FLOOR(humedad),
       ROUND(humedad, 1)
 from registros_clima;

-- DIV
-- Realiza una división entera
SELECT 12 DIV 9;

-- SQRT()
-- Obtiene la raíz cuadrada de un número
SELECT SQRT(81);

-- TRUNCATE()
-- Corta los decimales de un número, NO redondea
SELECT TRUNCATE(20.5987, 2);

SELECT ROUND(20.5987, 2);

-- RAND()
-- Regresa números aleatorios

-- Regresa un número aleatorio entre 0 y 1
SELECT RAND();

-- Regresa un número aleatorio del 0 al 1, usando el 7 como 'semilla'
SELECT RAND(7);

-- Generar un número entero del 5 al 10
SELECT FLOOR(5 + RAND()*(10-5));

-- Generar un número entero del 1 al 100
SELECT FLOOR(1 + RAND()*(100-1));

-- Podemos usar RAND() en nuestras consultas para traer valores aleatorios
SELECT id,
       nombre,
       poblacion
FROM ciudad
ORDER BY RAND();

-- Tal vez útil para crear una muestra semi-aleatoria
SELECT id,
       nombre,
       poblacion
FROM ciudad
ORDER BY RAND()
LIMIT 4;


-- Pequeños ejercicios

-- Obtener el nombre de la estación, fecha del registro,
-- temperatura, donde se haya registrado una temperatura mayor a 35°C
-- Redondear la temperatura hacia arriba.
SELECT estacion.nombre,
       registros_clima.fecha_hora,
       CEILING(temperatura) AS temperatura
FROM estacion
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion
HAVING temperatura > 35;

-- Obtener los velocidad del viento promedio por país, para aquellos
-- países que tengan alguna estación instalada a más de 1000 metros de altura.
-- Redondear la velocidad del viento promedio a 3 decimales
SELECT pais.nombre AS pais,
       ROUND(AVG(velocidad_viento), 3) AS velocidad_viento_promedio
       
FROM pais
INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON ciudad.id = estacion.id_ciudad
INNER JOIN registros_clima
ON estacion.id = registros_clima.id_estacion

WHERE estacion.altitud > 1000

GROUP BY pais;


-- Obtener 5 países junto con una ciudad aleatorias
SELECT pais.nombre,
       ciudad.nombre
FROM pais
INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
ORDER BY RAND()
LIMIT 5;