/*
Introducción a las bases de datos SQL
Modulo 3: DDL
*/

/*Estructura básica para crear una base de datos

	CREATE DATABASE nombre_base_de_datos;
	
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
    ...
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
ALTER TABLE empleado ADD COLUMN sueldo_mensual FLOAT;

DESCRIBE empleado;

-- Modificar una columna existente
ALTER TABLE empleado 
MODIFY COLUMN sueldo_mensual INT NOT NULL DEFAULT 10000;

DESCRIBE empleado;

ALTER TABLE empleado 
MODIFY COLUMN email VARCHAR(50);

DESCRIBE empleado;

-- Pequeño ejercicio: Creación de más tabla

-- Crear una tabla llamada 'estatus' con
-- Un campo código_status que sea entero y llave primaria
-- Un campo nombre_status varchar de 20 caracteres y que no acepte valores nulos

CREATE TABLE estatus (
	codigo_status INT PRIMARY KEY,
	nombre_status VARCHAR(20) NOT NULL		
);

DESCRIBE estatus;

-- Crear una tabla llamada 'departamento', con 
-- Un campo id que sea de tipo char a 4 caracteres y llave primaria
-- Un campo nombre varchar a 30 caracteres que no admita nulos y sea unico
-- Un campo zona para guardar ej. Zona A, Zona B, Zona C
-- Un campo de sueldo mínimo que sea entero, que no admita nulos y el valor por default sea $10,500

CREATE TABLE departamento(
	 id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    zona ENUM('Zona A', 'Zona B', 'Zona C'),
    sueldo_minimo INT NOT NULL DEFAULT 10500
);

DESCRIBE departamento;

-- Añadiremos una llave foranea a la tabla empleado, nuestra primera tabla
ALTER TABLE empleado 
ADD id_departamento CHAR(4) NOT NULL;

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

-- Creación de una tabla con llave primaria compuesta

/*Estructura básica para crear una tabla con llave primaria compuesta

	CREATE TABLE nombre_tabla (
    columna1 tipo_de_dato NOT NULL,
    columna2 tipo_de_dato NOT NULL,
    columna3 tipo_de_dato [restriccion],
    ...
	PRIMARY KEY (columna1, columna2, ...)
);

*/

-- Los campos que usaremos para crear una llave primaria deben de tener la restricción NOT NULL
-- y se incluyen al final con la sentencia PRIMARY KEY
CREATE TABLE curso_asignado(
    id_profesor INT NOT NULL,
    id_curso INT NOT NULL,
    hora_inicio TIME,
    hora_fin TIME,
    fecha_inicio DATE,
    
    PRIMARY KEY (id_profesor, id_curso)
);

-- Para crear la llave foranea compuesta, especificamos los campos que son llave foranea, así como a que
-- tablan referencian y cuales columnas son en la tabla referenciada
CREATE TABLE curso_finalizado(
	 id INT PRIMARY KEY,
    id_profesor INT NOT NULL,
    id_curso INT NOT NULL,
    notas TEXT,
    
    FOREIGN KEY (id_profesor, id_curso) REFERENCES curso_asignado (id_profesor, id_curso)
);
