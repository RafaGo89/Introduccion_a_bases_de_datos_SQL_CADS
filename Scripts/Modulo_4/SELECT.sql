/*
Introducción a las bases de datos SQL
Modulo 4: DQL - SELECT
*/

/*
Estructura básica de una consulta

	SELECT column1, column2, ...
	FROM table_name;
    
*/

-- CONSULTAS BÁSCIAS

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

-- OPERADORES ARITMETICOS

-- Podemos usar operadores aritmeticos en nuestras consultas
SELECT 2 + 2;

SELECT 10 / 5;

SELECT (8 * 2) / 4;

-- Obtener el sueldo semanal de los empleados
SELECT sueldo_mensual
FROM empleado;

-- Sueldo semanal y agregamos un alias
SELECT sueldo_mensual / 4 AS sueldo_semanal
FROM empleado;

-- Otra forma de poner un alias
SELECT sueldo_mensual / 4 sueldo_semanal
FROM empleado;

DESCRIBE empleado;

-- PEQUEÑO EJERCICIO

-- Seleccionar el nombre, apellido materno, apellido paterno y sueldo anual
-- de todos los empleados (agregar alias al sueldo anual)
SELECT nombre, apellido_materno, apellido_paterno, sueldo_mensual * 12 AS sueldo_anual
FROM empleado;

-- ClÁUSULA WHERE & OPERADORES DE COMPARACIÓN
SELECT * FROM empleado;

-- Seleccionar a todos los empleados que tengan un sueldo (mensual) MAYOR a $15,000
SELECT * 
FROM empleado
WHERE sueldo_mensual > 15000;

-- Seleccionar a todos los empleados que tengan un sueldo (mensual) MAYOR O IGUAL a $15,000
SELECT * 
FROM empleado
WHERE sueldo_mensual >= 15000;

-- Seleccionar el nombre y sueldo mensual de los empleados que ganen EXACTAMENTE $16,000
SELECT nombre, sueldo_mensual
FROM empleado
WHERE sueldo_mensual = 16000;

-- Seleccionar el nombre y sueldo mensual de los empleados que NO ganen EXACTAMENTE $16,000
SELECT nombre, sueldo_mensual
FROM empleado
WHERE sueldo_mensual <> 16000;

-- Otra manera de hacerlo
SELECT nombre, sueldo_mensual
FROM empleado
WHERE sueldo_mensual != 16000;

-- Seleccionar el nombre, apellido materno y departamento de los empleados que se llamen 'Federico'
SELECT nombre, apellido_materno, id_departamento
FROM empleado
WHERE nombre = 'Federico';

