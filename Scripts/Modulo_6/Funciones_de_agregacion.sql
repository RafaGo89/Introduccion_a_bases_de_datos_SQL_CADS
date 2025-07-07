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
-- Contar la cantidad de ciudades
SELECT COUNT(*)
FROM ciudad;

-- Podemos usar también la id como columna a contar
SELECT COUNT(id) AS 'Cantidad de ciudades'
FROM ciudad;

-- Usamos COUNT(DISTINCT) para obtener el conteo de valores ÚNICOS
SELECT nombre, id_pais
FROM ciudad;

SELECT COUNT(DISTINCT id_pais)
FROM ciudad;