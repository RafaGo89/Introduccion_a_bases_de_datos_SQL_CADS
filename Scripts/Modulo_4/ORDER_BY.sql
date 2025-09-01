/*
Introducción a las bases de datos SQL
Modulo 4: DQL - Clásula ORDER BY
*/

/*
Estructura básica de una consulta con ORDER BY

	SELECT column1, column2, ...
	FROM table_name
   ORDER BY column1, column2, ... ASC|DESC;
    
*/

USE tienda;

-- Seleccionamos a todos los empleados ordenados por el sueldo_mensual
-- El ordenamiento es ASCENDENTE por default
SELECT nombre, sueldo_mensual 
FROM empleado
ORDER BY sueldo_mensual;

-- Podemos añadir 'ASC' y obtenemos el mismo resultado
SELECT nombre, sueldo_mensual
FROM empleado
ORDER BY sueldo_mensual ASC;

-- Si usamos 'DESC', el ordenamiento será DESCENDENTE
SELECT nombre, sueldo_mensual
FROM empleado
ORDER BY sueldo_mensual DESC;

-- Podemos ordenar por fechas, usamos 'DESC', ordenará de la fecha más reciente
-- a la más antigua
SELECT nombre, fecha_nacimiento 
FROM empleado
ORDER BY fecha_nacimiento DESC;

-- Caso contrario si usamos 'ASC'
SELECT nombre, fecha_nacimiento 
FROM empleado
ORDER BY fecha_nacimiento ASC;

-- Podemos ordenar por una columna de texto, en orden alfabetico de A-Z
SELECT nombre
FROM empleado
ORDER BY nombre ASC;

-- Podemos usar más de 2 ordenamientos
SELECT nombre, sueldo_mensual, fecha_nacimiento 
FROM empleado
ORDER BY sueldo_mensual, fecha_nacimiento;

-- Igualmente, podemos definir diferentes tipos de ordenamiento para nuestros criterios
SELECT nombre, sueldo_mensual, fecha_nacimiento 
FROM empleado
ORDER BY sueldo_mensual DESC, fecha_nacimiento ASC;

-- Si combinamos ORDER BY y LIMIT, podemos crear 'TOPS'

-- Obtener nombre, apellido paterno y sueldo de los 5 empleados con mayor sueldo en la empresa
SELECT nombre, apellido_paterno, sueldo_mensual
FROM empleado
ORDER BY sueldo_mensual DESC
LIMIT 5;

-- Obtener nombre, apellido paterno y fecha de nacimiento 
-- de los 3 empleados con menor edad en la empresa
SELECT nombre, apellido_paterno, fecha_nacimiento
FROM empleado
ORDER BY fecha_nacimiento DESC
LIMIT 3;


-- Manejo de valores NULL

-- Seleccionar a los empleados que no cuenten con un email registrado
SELECT *
FROM empleado
WHERE email IS NULL;

-- Seleccionar a los empleados que cuenten con un email registrado
SELECT *
FROM empleado
WHERE email IS NOT NULL;

-- Seleccionar nombre y apellido materno de los empleados que no cuenten con
-- un apellido materno registrado
SELECT nombre, apellido_materno
FROM empleado
WHERE apellido_materno IS NULL;


-- PEQUEÑO EJERCICIO

-- Obtener nombre y sueldo minimo de los departamentos, ordenados descendentemente
-- por el sueldo_minimo


-- Seleccionar la id, el nombre, apellido materno e email de aquellos empleados
-- que no tengan email y si cuenten con apellido materno registrado
