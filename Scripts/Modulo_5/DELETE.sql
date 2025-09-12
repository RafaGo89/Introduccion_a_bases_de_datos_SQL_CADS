/*
	Introducción a las bases de datos SQL
	Modulo 5: DML - DELETE
*/

USE tienda_2;

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

-- También podemos borrar registros usando operadores lógicos
-- Eliminamos a los empleados que pertenezcan a esos departamentos (D04, D06)
SELECT * FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';

-- Borramos a esos empleados
DELETE FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';

-- Vemos que se han eliminado, ahora sí podemos borrar los departamentos como tal
SELECT * FROM empleado
WHERE id_departamento = 'D04' OR id_departamento = 'D06';

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

-- Aplicamos el comando DELETE

-- Verificamos que los empleados se borraron


-- ELiminar a los empleados que hayan nacido del año 1990 a 2001 o que no cuenten con un departamento
-- asignado

-- Aplicamos el comando DELETE

-- Verificamos que se eliminaron los registros
