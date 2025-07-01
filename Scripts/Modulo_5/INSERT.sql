/*
Introducción a las bases de datos SQL
Modulo 5: DML - INSERT
*/

USE tienda;

SHOW TABLES;

DESCRIBE departamento;

-- Estructura básica para ingresar datos en una tabla
/*

	INSERT INTO table_name (column1, column2, column3, ...)
	VALUES (value1, value2, value3, ...);

*/

-- Insertamos un nuevo departamento en nuestra tabla
INSERT INTO departamento (id, nombre, zona, sueldo_minimo)
VALUES ('D01', 'Ventas', 'Zona A', '10000');

-- Comando básico para obtener datos de una tabla
SELECT * FROM departamento;

-- Otra forma de ingresar datos a una tabla
INSERT INTO departamento 
VALUES ('D02', 'Administración', 'Zona A', '15000');

SELECT * FROM departamento;

INSERT INTO departamento 
VALUES ('D03', 'Recursos Humanos', 'Zona B','13500');

SELECT * FROM departamento;

-- Esto genera un error porque no existe la 'Zona D'
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

-- Pequeño ejercicio
INSERT INTO empleado (id, nombre, apellido_paterno, email,
					 fecha_nacimiento, id_departamento)
VALUES
(11, 'Jorge', 'Navarro', 'navarroAtlas3@gmail.com', '1995-03-15', 'D02'),
(12, 'Enriqueta', 'De la cruz', 'enricruz12@gmail.com', '1979-05-10', 'D03');

SELECT * FROM empleado;

INSERT INTO departamento VALUES ('D04', 'Servicio al cliente', 'Zona C', 7000);

SELECT * FROM departamento;
