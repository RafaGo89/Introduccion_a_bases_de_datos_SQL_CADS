/*
Introducción a las bases de datos SQL
Modulo 3: DDL
*/

-- Crear una base de datos
CREATE DATABASE tienda;

-- Otra forma de crear una base de datos
CREATE SCHEMA tienda;

-- Eliminar una base de datos
DROP DATABASE tienda;

-- Seleccionamos la base de datos a usar
USE tienda;

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
CREATE TABLE empleado(
	id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    sueldo_mensual DECIMAL(7, 2),
    email VARCHAR(50) UNIQUE DEFAULT 'ejemplo@gmail.com'
);

-- Eliminamos una tabla
DROP TABLE empleado;

-- Muestra un resumen de la estructura de la tabla
DESCRIBE empleado;

-- Eliminamos una columna de la tabla
ALTER TABLE empleado DROP COLUMN sueldo_mensual;

DESCRIBE empleado;

-- Añadimos una nueva columna
ALTER TABLE empleado ADD sueldo_mensual FLOAT;

DESCRIBE empleado;

-- Modificar una columna existente
ALTER TABLE empleado 
MODIFY COLUMN sueldo_mensual INT NOT NULL DEFAULT 10000;

ALTER TABLE empleado 
MODIFY COLUMN email VARCHAR(50) UNIQUE;

DESCRIBE empleado;

-- Pequeño ejercicio: Creación de una segunda tabla
CREATE TABLE departamento(
	id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    zona ENUM('Zona A', 'Zona B', 'Zona C'),
    sueldo_minimo INT NOT NULL
);

DESCRIBE departamento;

-- Añadiremos una llave foranea a la tabla empleado
ALTER TABLE empleado 
ADD id_departamento CHAR(4);

-- Convertimos la nueva columna a llave foranea
ALTER TABLE empleado
ADD FOREIGN KEY (id_departamento) REFERENCES departamento(id);

-- Verificamos que se haya añadido la llave foranea
DESCRIBE empleado;

-- Otra manera de añadir la llavera foranea y la llave primaria
CREATE TABLE empleado(
	id INT,
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    sueldo_mensual INT,
    email VARCHAR(50) UNIQUE,
    id_departamento CHAR(4),
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
