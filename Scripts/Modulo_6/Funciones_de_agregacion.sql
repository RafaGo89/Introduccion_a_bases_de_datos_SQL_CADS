/*
	Introducción a las bases de datos SQL
	Modulo 6: Funciones de agregación
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

/* Sintaxis básica para usar funciones de agregación

	SELECT funcion_agregacion(columna)
    FROM tabla;
    
*/

-- Función COUNT()
-- Contar la cantidad de filas de la tabla ciudad (Incluye valores NULL)
SELECT COUNT(*)
FROM ciudad;

-- Podemos usar también la id como columna a contar (NO incluye valores NULL)
SELECT COUNT(id) AS 'Cantidad de ciudades'
FROM ciudad;

-- Usamos COUNT(DISTINCT) para obtener el conteo de valores ÚNICOS (NO incluye valores NULL)
SELECT nombre, id_pais
FROM ciudad;

SELECT COUNT(DISTINCT id_pais)
FROM ciudad;

-- Obtenemos el promedio de altitud de las estaciones con AVG()
SELECT AVG(altitud) AS altitud_promedio
FROM estacion;

-- Obtenemos la altitud máxima con MAX()
SELECT MAX(altitud) AS maxima_Altitud
FROM estacion;

-- Obtenemos la altitud mínima con MIN()
SELECT MIN(altitud) AS minima_Altitud
FROM estacion;

-- Obtenemos la suma total de las poblaciones de las ciudades
SELECT SUM(poblacion) AS suma_poblacion
FROM ciudad;

-- Obtenemos la desviación estándar de las altitudes de las estaciones
SELECT STD(altitud) AS desviacion_estandar_altitud
FROM estacion;

-- Obtenemos la varianza de las altitudes de las estaciones
SELECT VARIANCE(altitud) AS desviacion_estandar_altitud
FROM estacion;

-- Podemos poner más 1 función de agregado en una sentencia
-- Obtenemos la suma total de las poblaciones de las ciudades
SELECT SUM(poblacion) AS Suma, AVG(poblacion) AS Promedio
FROM ciudad;

-- No podemos hacer esto: traer una columna y luego una función de agregación
SELECT nombre, AVG(poblacion)
FROM ciudad;

-- Podemos usar WHERE en conjunto con las funciones agregadas

-- Obtener la suma de las poblaciones de las siguientes ciudades: Tonala, Barcelona y París
SELECT SUM(poblacion)
FROM ciudad
WHERE nombre IN ('Tonala', 'Barcelona', 'París');

-- Otra manera de hacerlo
SELECT SUM(poblacion)
FROM ciudad
WHERE nombre = 'Tonala' OR nombre = 'Barcelona' OR nombre = 'París';

-- Podemos usar variables en conjunto con las funciones de agregación

-- Declaramos una variable
SET @max_poblacion = 0;

-- Visualizamos el valor de la variable
SELECT @max_poblacion;

-- También podemos definirla con un valor NULL
SET @max_poblacion = NULL;

-- Visualizamos el valor de la variable
SELECT @max_poblacion;

-- Cambiamos el valor de la variable, y vemos que no hay problema is cambiamos el tipo de datos
SET @max_poblacion = 'Hola';

-- Visualizamos el valor de la variable
SELECT @max_poblacion;

-- Guardamos un valor en esa variable con la sentencia SELECT INTO
-- Guardamos el valor de la población más grande en nuestra variable
SELECT MAX(poblacion) INTO @max_poblacion 
FROM ciudad;

-- Mostramos el valor de la variable
SELECT @max_poblacion;

-- Obtenemos el nombre y poblacion de la ciudad con mayor poblacion
SELECT nombre AS 'Ciudad más poblada', poblacion
FROM ciudad
WHERE poblacion = @max_poblacion;

-- Obtenemos la ciudad 'Más' pequeña en orden alfabético de A-Z
SELECT MIN(nombre)
FROM ciudad;

-- Obtenemos la ciudad 'Más' grande en orden alfabético de Z-A
SELECT MAX(nombre)
FROM ciudad;

-- Pequeños ejercicios

-- Obtener nombre y población de las ciudades con una población
-- menor a la del promedio de todas las ciudades. Ordenarlas descendentemente
SET @promedio_poblacion = 0;

SELECT AVG(poblacion) INTO @promedio_poblacion
FROM ciudad;

-- Visualizamos el promedio de poblacion
SELECT @promedio_poblacion;

SELECT nombre, poblacion
FROM ciudad
WHERE poblacion < @promedio_poblacion
ORDER BY poblacion DESC;

-- Obtener la población de la ciudad más pequeña de Argentina
SELECT MIN(poblacion)
FROM ciudad
WHERE id_pais = 'ARG';

-- Seleccionar el nombre y fecha de instalación más reciente de las estaciones

-- Declaramos la variable para guardar la fecha
SET @fecha_mas_reciente = '';

-- Guardamos la fecha más reciente usando MAX en la variable
SELECT MAX(fecha_instalacion) INTO @fecha_mas_reciente
FROM estacion;

-- Visualiazmos la fecha
SELECT @fecha_mas_reciente;

-- Mostramos el nombre y la fecha de instalacion en base al filtro de la variable
SELECT nombre, fecha_instalacion
FROM estacion
WHERE fecha_instalacion = @fecha_mas_reciente;