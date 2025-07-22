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

-- Vemos todos los metadatos de la tabla estación, en especial los comentarios 
SHOW FULL COLUMNS FROM estacion;

SHOW FULL COLUMNS FROM ciudad;

-- Seleccionar las estaciones con una altitud de entre 100 a 500 metros
SELECT *
FROM estacion
WHERE altitud BETWEEN 100 AND 500;

-- Seleccionar las estaciones que se instalaron entre 2010 y 2015
SELECT *
FROM estacion
WHERE fecha_instalacion BETWEEN '2010-01-01' AND '2015-12-31';

-- Podemos emplear NOT para negar el Between

-- Seleccionar las estaciones que NO se instalaron entre 2010 y 2015
SELECT *
FROM estacion
WHERE fecha_instalacion NOT BETWEEN '2010-01-01' AND '2015-12-31';

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

-- Podemos usar NOT para negar lo que hay dentro de IN

-- Obtener las ciudades que NO son de México y Estados Unidos
SELECT *
FROM ciudad
WHERE id_pais NOT IN ('MEX', 'USA');

-- Seleccionar todos los datos de las ciudades con las siguientes ID's: 1, 5, 8 y 10
SELECT *
FROM ciudad
WHERE id IN (1, 5, 8, 10);

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

-- El LIKE por default ignora los acentos
SELECT * 
FROM estacion
WHERE nombre LIKE '%Nórte%';

-- Seleccionar todas las estaciones que terminen con la letra 'e'
SELECT * 
FROM estacion
WHERE nombre LIKE '%e';

-- Seleccionar todas las ciudades que comiencen con la letra 'L' seguida de 3 caracteres cualquiera
SELECT *
FROM ciudad
WHERE nombre LIKE 'L___';

-- Seleccionar todas las ciudades que que tengan 3 caracteres cualquiera al inicio,
-- seguidos de la letra 't' y 'e', y después 4 caracteres cualquiera
SELECT *
FROM ciudad
WHERE nombre LIKE '___te____';

-- Seleccionar las ciudades con una poblacion desde 9,000,000 a 9,999,999
SELECT *
FROM ciudad
WHERE poblacion LIKE '9______';

-- Seleccionar a las ciudades que en su descripcion contengan una palabra que tenga un caracter cualquiera
-- al incio, después una 'i' y luego cualquier cantidad de caracteres
SELECT *
FROM condicion_climatica
WHERE descripcion LIKE '_i%';

-- Podemos usar NOT para negar el patrón de LIKE

-- Seleccionar todas las estaciones que sean del 'Norte'
SELECT * 
FROM estacion
WHERE nombre NOT LIKE '%Norte%';

-- Obtener el nombre de la estaciones que contengan la palabra 'Estación'
-- con E mayúscula al principio
SELECT nombre
FROM estacion
WHERE nombre LIKE '%Estación%'
COLLATE utf8mb4_bin;

-- Obtener el nombre de la estaciones que contengan la palabra 'Estación'
-- con e minúscula al principio
SELECT nombre
FROM estacion
WHERE nombre LIKE '%estación%'
COLLATE utf8mb4_bin;

-- Lo siguiente no regresará nada, pues no hay una estación que tenga
-- la palabra 'EStación'
SELECT nombre
FROM estacion
WHERE nombre LIKE '%EStación%'
COLLATE utf8mb4_bin;

-- Igualmente afecta a los acentos. Lo siguiente no regresará nada
SELECT nombre
FROM estacion
WHERE nombre LIKE '%Cordoba%'
COLLATE utf8mb4_bin;

-- Pero si agregamos el acento obtendremos un resultado
SELECT nombre
FROM estacion
WHERE nombre COLLATE utf8mb4_bin LIKE '%Córdoba%'
COLLATE utf8mb4_bin;

-- Mostrar los CHARACTER SET disponibles
 SHOW CHARACTER SET;
 
 -- Mostrar las COLLATIONS disponibles
 SHOW COLLATION;

-- Pequeños ejercicios

-- Seleccionar la id y descripción de los mantenimientos hechos a las estaciones, de aquellos registros
-- que contengan la palabra 'solar' dentro de su descripción
SELECT id, descripcion
FROM mantenimiento
WHERE descripcion LIKE '%solar%';

-- Obtener el nombre y población de las ciudades que NO tengan una población entre 1,000,000 y 2,200,000
-- Ordenado descendentemente por cantidad de población
SELECT nombre, poblacion
FROM ciudad
WHERE poblacion NOT BETWEEN 1000000 AND 2200000
ORDER BY poblacion DESC;

-- Obtener la población de las siguiente ciudades: Miami, Buenos Aires y Lima, ordenado ascendentemente
SELECT nombre, poblacion
FROM ciudad
WHERE nombre IN ('Miami', 'Buenos Aires', 'Lima')
ORDER BY poblacion ASC;

-- Obtener nombre y fecha de instalación de aquellas estaciones que se hayan instalado
-- desde el 15 febrero de 2018 hasta el 19 febrero de 2019
SELECT nombre, fecha_instalacion
FROM estacion
WHERE fecha_instalacion BETWEEN '2018-02-15' AND '2019-02-19';