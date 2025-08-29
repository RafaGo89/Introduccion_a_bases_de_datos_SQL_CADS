/*
Introducción a las bases de datos SQL
Modulo 3: Esquema
*/

CREATE DATABASE tienda_2;

USE tienda_2;

-- Creamos una tabla para almacenar información acerca de los departamentos
-- de una empresa
CREATE TABLE departamento(
	id CHAR(4) PRIMARY KEY,
	nombre VARCHAR(30) UNIQUE NOT NULL,
	zona ENUM('Zona A','Zona B','Zona C'),
	sueldo_minimo INT DEFAULT 10500
);

-- Creamos una tabla para almacenar los datos de los empleados
CREATE TABLE empleado(
	id INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	email VARCHAR(50) UNIQUE,
	sueldo_mensual INT NOT NULL DEFAULT 10000,
	id_departamento CHAR(4),
	
	FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);