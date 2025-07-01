/*
Introducción a las bases de datos SQL
Modulo 4: DQL - SELECT
*/

/*
Estructura básica de una consulta

	SELECT column1, column2, ...
	FROM table_name;
    
*/

-- Seleccionamos la base de datos con la que trabajaremos
USE tienda;

-- Seleccionar todos los datos de la tabla 'Empleado'
SELECT * FROM empleado;

-- Seleccionar todos los datos de la tabla 'departamento'
SELECT * 
FROM departamento;

-- Podemos usar la cláusula LIMIT para truncar la cantidad de filas que queremos obtener
SELECT * FROM empleado LIMIT 5;

-- Si limitamos a una cantidad de filas mayor a la que nuestra tabla tiene, no pasa nada
SELECT * FROM empleado LIMIT 20;

-- Podemos especificar un rango de filas a devolver (LIMIT inicio, cantidad_filas)
-- **Las filas comienzan a contarse desde 0
SELECT * FROM empleado LIMIT 0, 3;

SELECT * FROM empleado LIMIT 4, 5;

-- Podemos seleccionar columnas concretas de una tabla
DESCRIBE empleado;

-- Obtener el nombre, apellido paterno y fecha de nacimiento de todos los empleados
SELECT nombre, apellido_paterno, fecha_nacimiento
FROM empleado;

-- El orden en que seleccionamos las columnas no nos afecta en nada
SELECT fecha_nacimiento, apellido_paterno, nombre
FROM empleado;

-- Podemos trar una columna más de una vez
SELECT nombre, nombre, nombre
FROM empleado;

-- Podemos usar la cláusula DISTINCT para obtener valores únicos
SELECT id_departamento FROM empleados;

SELECT DISTINCT id_departamento FROM empleado;

-- Se recomienda usar en una sola columna, pero se puede emplear en varias a la vez
SELECT DISTINCT id, id_departamento, nombre FROM empleado;

-- PEQUEÑO EJERCICIO

-- Seleccionar el nombre, id y sueldo de los últimos 2 empleados
SELECT nombre, id, sueldo_mensual
FROM empleado
LIMIT 10, 2;