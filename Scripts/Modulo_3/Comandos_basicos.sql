/*
Introducción a las bases de datos SQL
Modulo 3: Comandos básicos
*/

-- Mostramos la versión instalada de MySQL
SELECT VERSION();

-- Mostramos el usario con el que iniciamos sesión
SELECT USER();

-- Mostrar las bases de datos almacenadas en el servidor
SHOW DATABASES;

-- Seleccionamos la base de datos a usar
USE mysql;

-- Mostramos las tablas que contiene la base de datos usada
SHOW TABLES;

-- Mostramos la base de datos que estamos usando
SELECT DATABASE();