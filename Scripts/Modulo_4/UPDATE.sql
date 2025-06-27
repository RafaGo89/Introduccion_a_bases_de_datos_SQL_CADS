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


-- Como SI hacer un UPDATE

SELECT * FROM empleado;

-- Cambiamos el sueldo del empleado con la ID 1 a $16,000
UPDATE empleado
SET sueldo_mensual = 16000
WHERE id = 1;

-- Visualizamos el cambio en el registro
SELECT * FROM empleado;

-- Nos fijamos en el sueldo del empleado con ID 12
SELECT * FROM empleado;

SELECT * FROM departamento;

-- Actualizamos el sueldo del empleado con ID 12 a $13,500
UPDATE empleado
SET sueldo_mensual = 13500
WHERE ID = 12;

-- Vemos que el sueldo se ha actualizado
SELECT * FROM empleado;

-- No fijamos en la fecha de nacimiento de Juan
SELECT * FROM empleado;

-- Podemos usar otro campo que no sea la llave primaria
-- en la clausula WHERE, pero debemos quitar el modo seguro de MySQL
SET SQL_SAFE_UPDATES = 0;

-- Actualizamos la fecha de nacimiento del empleado llamado 'Juan'
UPDATE empleado
SET fecha_nacimiento = '1999-01-13'
WHERE nombre = 'Juan';

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Podemos actualizar varios campos a la vez
-- Cambiamos el sueldo a $25,000  y el email del empleado con ID 2
UPDATE empleado
SET sueldo_mensual = 25000, email = 'mariaB2@gmail.com'
WHERE id = 2;

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Podemos realizar actualizaciones relizando operaciones matematicas

-- Agregamos $5,000 al sueldo del empleado con ID 3
UPDATE empleado
SET sueldo_mensual = sueldo_mensual + 5000
WHERE id = 3;

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Restamos $3,000 al sueldo del empleado con ID 3
UPDATE empleado
SET sueldo_mensual = sueldo_mensual - 3000
WHERE id = 3;

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Podemos usar operadores lógicos para actualizaciones más complejas

-- Agregamos $10,000 al sueldo de los empleados del departamento D02
-- Y que hayan nacido después del año 2000
UPDATE empleado
SET sueldo_mensual = sueldo_mensual + 10000
WHERE id_departamento = 'D02' AND fecha_nacimiento >= '2000-01-01';

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Ahora usamos OR

-- Agregamos $1,000 al sueldo de los empleados del departamento D01
-- O que se llamen Diana
UPDATE empleado
SET sueldo_mensual = sueldo_mensual + 1000
WHERE nombre = 'Diana' OR id_departamento = 'D01';

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Pequeños ejercicios

-- Aumentar el sueldo de los empleados nacidos antes del año 2000 en $2500

SELECT * FROM empleado;

UPDATE empleado
SET sueldo_mensual = sueldo_mensual + 2500
WHERE fecha_nacimiento < '2000-01-01';

-- Visualizamos el cambio
SELECT * FROM empleado;

SELECT * FROM empleado;

-- Disminuir el sueldo en $1,200 de los empleados con nombre Beatriz o Diana
-- Y que hayan nacido en 1970
UPDATE empleado
SET sueldo_mensual = sueldo_mensual - 1200
WHERE (nombre = 'Beatriz' OR nombre = 'Diana') AND 
(fecha_nacimiento >= '1970-01-01' AND fecha_nacimiento <= '1970-12-31');

-- Visualizamos el cambio
SELECT * FROM empleado;

-- Otra manera de hacerlo
UPDATE empleado
SET sueldo_mensual = sueldo_mensual + 1200
WHERE (nombre = 'Beatriz' OR nombre = 'Diana') AND 
YEAR(fecha_nacimiento) = '1970';

-- Reestablecemos el modo seguro
SET SQL_SAFE_UPDATES = 1;