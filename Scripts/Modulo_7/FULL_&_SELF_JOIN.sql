/*
	Introducción a las bases de datos SQL
	Modulo 7: JOINS - FULL JOIN & SELF JOIN
*/

-- Creamos una base de datos nueva para probar estos 2 JOINS
CREATE DATABASE otros_joins;

-- Seleccionamos la base de datos
USE otros_joins;

-- Crearemos 2 tablas para trabajar estos 2 tipos de JOINS}
CREATE TABLE departamento(
	codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30)
);

-- Establecemos el que el auto incremento inicie en 100
ALTER TABLE departamento AUTO_INCREMENT = 100;

CREATE TABLE maestro( 
	id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30),
    id_departamento SMALLINT,
    jefe SMALLINT,
    
    FOREIGN KEY (id_departamento) REFERENCES departamento(codigo)
);

-- Insertamos datos en la tabla de departamentos
INSERT INTO departamento(nombre) VALUES
('Ciencias Sociales'), 
('Administración'), 
('Tecnologías');

-- Insertamos valores en la tabla maestro
INSERT INTO maestro(nombre, id_departamento, jefe) VALUES
('Pedro', 100, NULL), 
('Jorge', 100, 1), 
('María', 101, 1),
('Enriqueta', 101, 2),
('Josue', NULL, 1);

-- Visualizamos los valores de las tablas
SELECT * FROM departamento;

SELECT * FROM maestro;

-- Realizamos el FULL JOIN
SELECT maestro.nombre AS maestro,
       maestro.id_departamento,
       departamento.nombre AS departamento,
       departamento.codigo
FROM departamento
LEFT JOIN maestro
ON departamento.codigo = maestro.id_departamento

UNION

SELECT maestro.nombre AS maestro,
       maestro.id_departamento,
       departamento.nombre AS departamento,
       departamento.codigo
FROM departamento
RIGHT JOIN maestro
ON maestro.id_departamento = departamento.codigo;

-- Ahora realizamos un SELF JOIN
-- Lo siguiente solo mostrará empleados que tengan un jefe
SELECT maestro.id,
       maestro.nombre AS nombre_maestro,
       jefe.id AS id_jefe,	
       jefe.nombre AS nombre_jefe
FROM maestro
INNER JOIN maestro AS jefe
ON maestro.jefe = jefe.id;

-- Para traer a todos los empleados, sin importar
-- si tiene jefe o no
SELECT maestro.id,
       maestro.nombre AS nombre_maestro,
       jefe.id AS id_jefe,	
       jefe.nombre AS nombre_jefe
FROM maestro
LEFT JOIN maestro AS jefe
ON maestro.jefe = jefe.id;