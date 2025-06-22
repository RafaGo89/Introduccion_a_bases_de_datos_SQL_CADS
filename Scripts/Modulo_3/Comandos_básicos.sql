/*
Introducción a las bases de datos SQL
Modulo 3: Comandos básicos
*/

-- Muestra el usuario con el que nos conectamos a la base de datos
SELECT USER();

-- Muestra la version de nuestro MySQL
SELECT VERSION();

-- Enlista las bases de datos que tenemos almacenadas
SHOW DATABASES;

-- Seleccionar una base de datos
USE information_schema;

-- Mostramos las tablas que tiene la base de datos seleccionada
SHOW TABLES;

-- Mostramos la base de datos en uso
SELECT DATABASE();