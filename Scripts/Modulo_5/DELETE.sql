/*
	Introducción a las bases de datos SQL
	Modulo 5: DML - DELETE
*/

USE tienda;

/* Sintaxis básica para actualizar registros

	DELETE FROM table_name 
    WHERE condition;
    
*/

-- Desactivamos el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 0;

-- Esto es lo que pasa si usamos DELETE sin clásula WHERE

-- Iniciamos una transacción
START TRANSACTION;

-- Usamos DELETE sin un WHERE
DELETE FROM empleado;

-- Vemos que hemos eliminado todos las filas de la tabla
SELECT * FROM empleado;

-- Echamos para atrás los cambios
ROLLBACK;

-- Verificamos que los datos hayan vuelto
SELECT * FROM empleado;

-- Eliminar a el registro del empleado con ID 28
SELECT * FROM empleado
WHERE id = 28;

-- Aplicamos el comando DELETE
DELETE FROM empleado
WHERE id = 28;

-- Verificamos que se eliminó el registro
SELECT * FROM empleado
WHERE id = 28;


-- Eliminar el registro de los empleados que tengan como apellido materno 'Fernández'
SELECT * FROM empleado
WHERE apellido_materno = 'Fernández';

-- Aplicamos el comando DELETE
DELETE FROM empleado
WHERE apellido_materno = 'Fernández';

SELECT * FROM empleado
WHERE apellido_materno = 'Fernández';


-- Podemos usar otros operadores de comparación

-- Eliminar los departamentos que tengan un sueldo minimo menor a $10,000
SELECT * FROM departamento
WHERE sueldo_minimo < 10000;

-- Aplicamos el comando DELETE, pero veremos que todavía no lo podemos aplicar
DELETE FROM departamento
WHERE sueldo_minimo < 10000;

-- Si hacemos borramos los empleados que  pertenecen a esos departamentos, ya podremos borrar
-- esos departamentos
SELECT * FROM departamento
WHERE sueldo_minimo < 10000;


-- Eliminamos a los empleados que pertenezcan a esos departamentos (D04, D06)
SELECT * FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';

-- Borramos a esos empleados
DELETE FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';

-- Vemos que se han eliminado, ahora sí podemos borrar los departamentos como tal
SELECT * FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';


-- También podemos borrar registros usando operadores lógicos

-- Eliminar el registro de los empleados que pertenezcan al departamento DO2 y ganen más
-- de 425,000
SELECT *
FROM empleado
WHERE id_departamento = 'D02' AND sueldo_mensual > 25000;

-- Aplicamos el comando DELETE
DELETE FROM empleado
WHERE id_departamento = 'D02' AND sueldo_mensual > 25000;

-- Vemos que se elimino el registro
SELECT *
FROM empleado
WHERE id_departamento = 'D02' AND sueldo_mensual > 25000;


-- PEQUEÑO EJERCICIO

-- Eliminar a todos los empleados que no tengan un email registrado
SELECT *
FROM empleado
WHERE email IS NULL;

DELETE FROM empleado
WHERE email IS NULL;

-- Verificamos que los empleados se borraron
SELECT *
FROM empleado
WHERE email IS NULL;

-- ELiminar a los empleados que hayan nacido del año 1990 a 2001 o que no cuenten con un departamento
-- asignado
SELECT *
FROM empleado
WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '2001-12-31'
OR id_departamento IS NULL;

-- Aplicamos el comando DELETE
DELETE FROM empleado
WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '2001-12-31'
OR id_departamento IS NULL;

-- Verificamos que se eliminaron los registros
SELECT *
FROM empleado
WHERE fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento <= '2001-12-31'
OR id_departamento IS NULL;