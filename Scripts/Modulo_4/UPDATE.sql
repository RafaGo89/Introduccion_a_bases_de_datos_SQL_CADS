/*
Introducción a las bases de datos SQL
Modulo 4: DML - Update
*/

USE tienda;

/* Sintaxis básica para actualizar registros

	UPDATE table_name
	SET column1 = value1, column2 = value2, ...
	WHERE condition;
    
*/

SHOW TABLES;

DESCRIBE empleado;

-- Visualizamos la información en nuestra tabla empleado
SELECT * FROM empleado;

-- Desactivamos el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 0;

-- Iniciamos una transacción para evitar que los cambias se hagan al instante
START TRANSACTION;

-- Establecemos el suelo de 5000 a todos los empleados
-- NO es recomendable usar UPDATE sin la clausula WHERE
UPDATE empleado
SET sueldo_mensual = 5000;

-- Verificamos la modificación de los datos
SELECT * FROM empleado;

-- Echamos para atrás los cambios
ROLLBACK;

-- Nos percatamos que los cambios no se aplicaron
SELECT * FROM empleado;

-- Reestablecemos el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 1;