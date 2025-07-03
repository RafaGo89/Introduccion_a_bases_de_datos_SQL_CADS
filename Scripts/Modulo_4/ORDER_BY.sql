/*
Introducción a las bases de datos SQL
Modulo 4: DQL - Clásula ORDER BY
*/

/*
Estructura básica de una consulta

	SELECT column1, column2, ...
	FROM table_name
    ORDER BY column1, column2, ... ASC|DESC;
    
*/

USE tienda;

-- Seleccionamos a todos los empleados ordenados por el sueldo_mensual
-- El ordenamiento es ASCENDENTE por default
SELECT * 
FROM empleado
ORDER BY sueldo_mensual;

-- Podemos añadir 'ASC' y obtenemos el mismo resultado
SELECT * 
FROM empleado
ORDER BY sueldo_mensual ASC;

-- Si usamos 'DESC', el ordenamiento será DESCENDENTE
SELECT * 
FROM empleado
ORDER BY sueldo_mensual DESC;

-- Podemos ordenar por fechas, usamos 'DESC', ordenará de la fecha más reciente
-- a la más antigua
SELECT * 
FROM empleado
ORDER BY fecha_nacimiento DESC;

-- Caso contrario si usamos 'ASC'
SELECT * 
FROM empleado
ORDER BY fecha_nacimiento ASC;