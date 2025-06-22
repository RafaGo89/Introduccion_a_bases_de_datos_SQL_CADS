/*
Introducción a las bases de datos SQL
Modulo 3: DDL
*/

-- Crear una base de datos
CREATE DATABASE tienda;

-- Otra forma de crear una base de datos
CREATE SCHEMA empleados;

-- Eliminar una base de datos
DROP DATABASE empleados;

-- Seleccionamos la base de datos a usar
USE empleados;

-- Mostramos las tablas de la base de datos
SHOW TABLES;


/*Estructura básica para crear una tabla

CREATE TABLE nombre_tabla (
    columna1 tipo_de_dato [restriccion],
    columna2 tipo_de_dato [restriccion],
    columna3 tipo_de_dato [restriccion],
   ....
);
*/

-- Creamos una tabla
CREATE TABLE empleados(
	id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    sueldo_mensual DECIMAL(7, 2),
    email VARCHAR(50) UNIQUE DEFAULT 'ejemplo@gmail.com'
);

-- Eliminamos una tabla
DROP TABLE empleados;

-- Muestra un resumen de la estructura de la tabla
DESCRIBE empleados;

-- Eliminamos una columna de la tabla
ALTER TABLE empleados DROP COLUMN sueldo_mensual;

DESCRIBE empleados;

-- Añadimos una nueva columna
ALTER TABLE empleados ADD sueldo_semanal INT;

DESCRIBE empleados;

-- Modificar una columna existente
ALTER TABLE empleados 
MODIFY COLUMN sueldo_mensual INT NOT NULL DEFAULT 10000;

DESCRIBE empleados;