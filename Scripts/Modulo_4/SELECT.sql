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


-- OPERADORES ARITMÉTICOS

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


-- PEQUEÑO EJERCICIO

-- Seleccionar el id, nombre y sueldo semanal, de los empleados que ganen
-- $5,000 o menos a la semana
SELECT id, nombre, (sueldo_mensual / 4) AS sueldo_semanal
FROM empleado
WHERE (sueldo_mensual / 4) < 5000;

-- Seleccionar el id, nombre, sueldo semanal, sueldo por 3 semanas
-- de los empleados que ganen más de $10,000 en 3 semanas de trabajo
SELECT id, 
	   nombre, 
       (sueldo_mensual / 4) AS sueldo_semanal, 
	   (sueldo_mensual / 4) * 3 AS sueldo_por_3_semanas
FROM empleado
WHERE (sueldo_mensual / 4) * 3 > 10000;


-- OPERADORES LÓGICOS

-- Los operadores lógicos permiten crear filtros más específicos y complejos

-- Seleccionar a todos los empleados con sueldo mayor a $20,000 Y que pertezcan al
-- departamento 'D02'
SELECT * 
FROM empleado
WHERE sueldo_mensual > 20000 AND id_departamento = 'D02';

-- Seleccionar a todos los empleados con sueldo mayor a $20,000 O que pertezcan al
-- departamento 'D02'
SELECT * 
FROM empleado
WHERE sueldo_mensual > 20000 OR id_departamento = 'D02';

-- Seleccionar a los empleados que no pertenezcan al departamento 'D01'
SELECT *
FROM empleado
WHERE NOT id_departamento = 'D01';

-- Obtener nombre y fecha de nacimiento de aquellos empleados que hayan nacido
-- en el año 1999
SELECT * 
FROM empleado
WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '1999-12-31';

-- Otra manera de hacer lo anterior
SELECT * 
FROM empleado
WHERE fecha_nacimiento > '1998-12-31' AND fecha_nacimiento < '2000-01-01';

-- Obtener nombre y fecha de nacimiento de aquellos empleados que hayan nacido
-- en del año 1999 al 2003
SELECT * 
FROM empleado
WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '2003-12-31';

-- Seleccionar el apellido materno, el sueldo mensual y el departamento de los empleados que hayan nacido entre
-- 1980 y 1985 O que ganen $10,000 o menos
SELECT apellido_materno, sueldo_mensual, id_departamento 
FROM empleado
WHERE (fecha_nacimiento >= '1980-01-01' AND fecha_nacimiento <= '1985-12-31')
      OR sueldo_mensual <= 10000;
      
      
-- PEQUEÑO EJERCICIO

-- Seleccionar todos los datos de los departamentos que NO pertenecen a la Zona A
SELECT * FROM departamento
WHERE NOT zona = 'Zona a';

-- Seleccionar a todos los empleados que tengan como apellido paterno 'Baltazar'
-- O que su apellido materno sea 'Peréz'
SELECT * 
FROM empleado
WHERE apellido_paterno = 'Baltazar' OR apellido_materno = 'Peréz';

-- Obtener el nombre y sueldo semanal de aquellos empleados que hayan nacido después del
-- año 2000 y pertenezcan al departamento D01, O que su sueldo semanal sea mayor o igual a $10,000
SELECT nombre, sueldo_mensual / 4 AS sueldo_semanal
FROM empleado
WHERE (fecha_nacimiento > '2000-12-31' AND id_departamento = 'D01') 
	  OR sueldo_mensual / 4 >= 10000;