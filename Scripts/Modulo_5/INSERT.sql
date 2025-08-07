/*
	Introducción a las bases de datos SQL
	Modulo 5: DML - INSERT
*/

-- Seleccionamos la base de datos
USE tienda;

-- Mostramos las tablas que tiene esa base de datos
SHOW TABLES;

-- Estructura básica para ingresar datos en una tabla
/*

	INSERT INTO table_name (column1, column2, column3, ...)
	VALUES (value1, value2, value3, ...);

*/

-- Vemos los metadatos de la tabla departamento para estar seguros de que datos ingresaremos
DESCRIBE departamento;

-- Insertamos un nuevo departamento en nuestra tabla
INSERT INTO departamento (id, nombre, zona, sueldo_minimo)
VALUES ('D01', 'Ventas', 'Zona A', '10000');

-- Comando básico para obtener datos de una tabla
SELECT * FROM departamento;

-- Otra forma de ingresar datos a una tabla sin especificar todos los campos
INSERT INTO departamento 
VALUES ('D02', 'Administración', 'Zona A', '15000');

SELECT * FROM departamento;

INSERT INTO departamento 
VALUES ('D03', 'Recursos Humanos', 'Zona B','13500');

SELECT * FROM departamento;

-- Esto genera un error porque no existe la 'Zona D' debido al tipo de dato enum
INSERT INTO departamento 
VALUES ('D04', 'Informática', 'Zona D','14500');

-- Ingresamos registros a nuestra segunda tabla
INSERT INTO empleado (id, nombre, apellido_paterno, apellido_materno,
					       fecha_nacimiento, email, sueldo_mensual, id_departamento)
VALUES (1, 'Juan', 'Romero', 'Ruvalcaba', '1999-01-12', 'ruvalcaba12@gmail.com',
	    15000, 'D02');
        
SELECT * FROM empleado;

INSERT INTO empleado (id, nombre, apellido_paterno,
					       fecha_nacimiento, sueldo_mensual, id_departamento)
VALUES (2, 'María', 'Blanco', '1980-03-22', 22000, 'D02');

SELECT * FROM empleado;

-- Ingresar varios registros con un mismo comando INSERT
INSERT INTO empleado (id, nombre, apellido_paterno, apellido_materno,
					       fecha_nacimiento, sueldo_mensual, id_departamento)
VALUES
(3, 'Luis Julian', 'Hernández', 'Gómez', '1990-09-01',20000, 'D01'),
(4, 'Ángel', 'Sepulveda', 'Romo', '2000-05-06', 9000, 'D01'),
(5, 'Federico', 'Pereira', 'De la fuente', '1985-10-01', 35000, 'D01'),
(6, 'Thiare', 'Gómez', 'Cortéz', '2002-01-04', 25500, 'D02'),
(7, 'Mónica Juliana', 'Baltazar', 'Paredes', '1996-02-14', 17000, 'D03'),
(8, 'Beatriz', 'Ortega', 'Ortega', '1970-12-15', 13500, 'D03'),
(9, 'Diana', 'Hernández', 'Peréz', '2003-08-08', 14000, 'D03'),
(10, 'Pedro Luis', 'Murillo', 'Águila', '2000-03-25', 20000, 'D02');

-- Revisamos los registros ingresados
SELECT * FROM empleado;

-- Podemos ingresar valores Nulos manualmente ingresando la palabra NULL
-- Además de aplicar el valor por default en el sueldo con la palabra 'DEFAULT'
INSERT INTO empleado (email, id, nombre, apellido_paterno, apellido_materno,
					       fecha_nacimiento, sueldo_mensual, id_departamento)
VALUES ('ferrerRR12@gmail.com', '13', 'Roberto', NULL, 'Ferrer', '1990-08-18', DEFAULT, 'D03');

-- Revisamos los registros ingresados
SELECT * FROM empleado;


-- Pequeño ejercicio

-- Ingresar en la tabla estatus:
-- El estatus Alta con código 100,
-- El estatus Baja con código 101
INSERT INTO estatus
VALUES (100, 'Alta'),
       (101, 'Baja');

-- Ingresar en la tabla empleado:
-- El empleado con nombre Jorge Navarro (sin apellido materno), con correo navarroAlas3@gmail.com
-- nacido el 15 de Marzo de 1995 y que pertenece al departamento D02
-- Y La empleado Enriqueta De la Cruz Montenegro, no tiene email, nació el 10 de Mayo de 1979
-- Pertenece al departamento D03 y ganá el sueldo por default
INSERT INTO empleado (id, nombre, apellido_paterno, email,
					       fecha_nacimiento, id_departamento)
VALUES
(11, 'Jorge', 'Navarro', 'navarroAlas3@gmail.com', '1995-03-15', 'D02');

INSERT INTO empleado (id, nombre, apellido_paterno, apellido_materno, email,
					       fecha_nacimiento, id_departamento, sueldo_mensual)
VALUES
(12, 'Enriqueta', 'De la cruz', 'Montenegro', NULL, '1979-05-10', 'D03', DEFAULT);

-- Verificamos que los datos hayan sido ingresados correctamente
SELECT * FROM empleado;

-- Añadir un nuevo departamento:
-- Servicio al cliente con código D04 que pertenece a la Zona C y tiene sueldo mínimo de 7000
INSERT INTO departamento VALUES ('D04', 'Servicio al cliente', 'Zona C', 7000);

SELECT * FROM departamento;