/*
	Introducción a las bases de datos SQL
	Modulo 8: Funciones integradas - Funciones de cadena
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

-- CHAR_LENGTH() ó CHARACTER_LENGTH()
-- Regresa la cantidad de caracteres de una cadena (los espacios en blanco cuentan)
SELECT CHAR_LENGTH('Hola ');

-- NO es lo mismo que lo anterior
SELECT CHAR_LENGTH('Hola ');

-- Obtenemos la cantidad de caracteres de los nombres de las ciudades
SELECT nombre, CHARACTER_LENGTH(nombre) AS longitud_en_caracteres
FROM ciudad;

-- CONCAT()
-- Une cadenas de texto
SELECT CONCAT('Hola', '-', 'Buen día');

-- Unir el nombre de la ciudad con su población
SELECT CONCAT(nombre,' ', poblacion) AS ciudad_poblacion
FROM ciudad;

-- CONCAT_WS()
-- Une cadenas de texto con un mismo separador

SELECT CONCAT_WS('|', nombre, poblacion, superficie) AS ciudad_poblacion_superficie
FROM ciudad;

-- FORMAT()
-- Da formato a un número siguiendo este formato #,###,###, añade comas para separalos
-- Se puede especificar cuantos decimales quieres redondear

-- Si especifico 0 al final, regresa el número sin decimales
SELECT FORMAT(2890786, 0);

-- Cualquier número mayor a 0 añade decimales
SELECT FORMAT(2890786, 2);

-- Si tengo un número decimal, lo redondea
SELECT FORMAT(2890786.325, 2);

-- Obtener el nombre de las ciudades y su población formateada sin decimales
SELECT nombre, FORMAT(poblacion, 0) AS poblacion
FROM ciudad;

-- LOWER() ó LCASE()
-- Convierte una cadena a letras minúsculas
SELECT nombre, LOWER(nombre)
FROM ciudad;

-- UPPER() ó UCASE()
-- Convierte una cadena a letras mayúsculas
SELECT nombre, UCASE(nombre)
FROM ciudad;

-- LEFT()
-- Extrae caracteres de una cadena comenzado por la IZQUIERDA
SELECT LEFT('Hola, buenos días', 5);

-- Extrae los 7 primeros caracteres de la columna nombre en la tabla ciudad,
-- empieza por la izquierda
SELECT LEFT(nombre, 7)
FROM ciudad;

-- RIGHT()
-- Extrae caracteres de una cadena comenzado por la DERECHA
SELECT RIGHT('Hola, buenos días', 5);

-- Extrae los 7 primeros caracteres de la columna nombre en la tabla ciudad,
-- empieza por la derecha
SELECT RIGHT(nombre, 7)
FROM ciudad;

-- MID() ó SUBSTR() ó SUBSTRING()
-- Extrae caracteres de una cadena empezando desde cualquier posición

-- Espeficiamos la cadena, luego desde que letra comenzaremos a extraer (contando desde 1)
-- y finalmente cuantos caracteres queremos traer
SELECT MID('¿Cómo estás?', 7, 5);

-- Con otra función igual funciona
SELECT SUBSTR('¿Cómo estás?', 7, 5);

-- Extraer 8 caracteres desde la posición 5
-- en la columna descripción de la tabla mantenimiento
SELECT descripcion,
       SUBSTRING(descripcion, 5, 8)
FROM mantenimiento;

-- TRIM()
-- Quita espacios en blanco al INCIO Y FINAL de una cadenas
SELECT '    SQL está chido    ';

SELECT TRIM('    SQL está chido    ');

-- REPLACE()
-- Reemplaza una cadena de texto por otra, cada vez que la cadena
-- a reemplazar aparezca (Sensible a mayúscula/minúsculas y acentos)
SELECT REPLACE('Hola, ¿cómo estás?', 'Hola', 'Buen día');

SELECT REPLACE('Hola, ¿cómo estás? ¿Hola?', 'Hola', 'Buen día');

-- Cambiar el nombre 'México' a 'Estados Unidos Mexicanos' en la tabla países
SELECT nombre, REPLACE(nombre, 'México', 'Estados Unidos Mexicanos')
FROM pais;

-- REPEAT()
-- Repite una cadena cuantos veces se especifique
SELECT REPEAT('SQL', 3);


-- Pequeños ejercicios

-- Obtener la id de las estaciones (solo el número de estacion ej. 002)
-- nombre de la estación
-- y la altitud a la que se ubican con formato ###,### a cero decimales.
-- Ordenar por altitud de mayor a menor, y solo mostrar las 5 estaciones a mayor altitud
SELECT RIGHT(id, 3) AS id_estacion,
       nombre,
       FORMAT(altitud, 0) AS 'Altitud '
FROM estacion
ORDER BY altitud DESC
LIMIT 5;


-- Obtener la id de la estación, la altitud de la misma y la condición climatica que
-- registró, para aquellas estaciones instalas a menos de 500 metros de altura
-- y que hayan registrado que hubo nevada.
-- El código de la estación formatearlo así MEX001 - México001
SELECT REPLACE(estacion.id, LEFT(estacion.id, 3), pais.nombre) AS id_estacion,
       estacion.altitud,
       condicion_climatica.nombre AS condicion_climatica
FROM pais

INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON estacion.id_ciudad = ciudad.id
INNER JOIN registros_clima
ON registros_clima.id_estacion = estacion.id
INNER JOIN condicion_climatica
ON condicion_climatica.id = registros_clima.id_condicion_climatica

WHERE estacion.altitud < 500
AND condicion_climatica.nombre = 'Nevada';

-- Obtener la temperatura y humedad promedio por país en base a los registros hechos por las
-- estaciones. Incluir el nombre del país, la temperatura formateada así 30.0 °C 
-- y la humedad con formato 89.0%
SELECT pais.nombre AS pais,
       CONCAT(AVG(temperatura), ' °C') AS temp_promedio,
       CONCAT(AVG(humedad), '%') AS humedad_promedio
FROM pais

INNER JOIN ciudad
ON pais.codigo_iso = ciudad.id_pais
INNER JOIN estacion
ON estacion.id_ciudad = ciudad.id
INNER JOIN registros_clima
ON registros_clima.id_estacion = estacion.id

GROUP BY pais;
