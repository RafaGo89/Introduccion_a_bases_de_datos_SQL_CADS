/*
	Introducción a las bases de datos SQL
	Modulo 9: Vistas
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

/* Sintaxis básica para crear un usuario

	CREATE USER 'nombre_usuario'@'tipo_conexion' IDENTIFIED BY 'contraseña';
    
*/

-- Creación basica de un USUARIO LOCAL
CREATE USER 'Rafa'@'localhost' IDENTIFIED BY '1234';

-- Creación basica de un USUARIO REMOTO, que se conectará desde otra computadora
CREATE USER 'RafaRemoto'@'%' IDENTIFIED BY 'remoto';

-- Mostrar los usuarios creados
SELECT user, host FROM mysql.user;

-- Mostramos los privilegios del usuario recién creado, el cual solo
-- puede acceder a las bases de datos del sistema
SHOW GRANTS FOR 'Rafa'@'localhost';


-- PRIVILEGIOS GLOBALES

-- Dar todos los privilegios sobre todas las bases de datos del sistema al usuario
-- PRIVILEGIOS GLOBALES
GRANT ALL PRIVILEGES ON *.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Remover privilegios globales al usuario
REVOKE ALL PRIVILEGES ON *.* FROM 'Rafa'@'localhost';

-- Mostramos los privilegios que le quedan al usuario
SHOW GRANTS FOR 'Rafa'@'localhost';


-- PRIVILEGIOS A NIVEL BASE DE DATOS

-- Asignamos todos los privilegios a NIVEL BASE DE DATOS
GRANT ALL PRIVILEGES ON registro_climatico.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Remover privilegios a nivel base de datos
REVOKE ALL PRIVILEGES ON registro_climatico.* FROM 'Rafa'@'localhost';

-- Conceder permisos de solo lectura a nivel base de datos
GRANT SELECT ON registro_climatico.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Conceder permisos de actualización a nivel base de datos
GRANT UPDATE ON registro_climatico.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Conceder permisos de actualización a nivel base de datos
GRANT DELETE, INSERT ON registro_climatico.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Remover todos privilegios a nivel base de datos
REVOKE ALL PRIVILEGES ON registro_climatico.* FROM 'Rafa'@'localhost';


-- PRIVILEGIOS A  NIVEL TABLA

-- Conceder permisos de solo lectura a nivel de tabla
GRANT SELECT ON registro_climatico.ciudad TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Conceder permisos de solo lectura y actualizacion a nivel de tabla
GRANT SELECT ON registro_climatico.estacion TO 'Rafa'@'localhost';
GRANT UPDATE ON registro_climatico.estacion TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';

-- Remover privilegios al usuario de uno por uno
REVOKE SELECT ON registro_climatico.ciudad FROM 'Rafa'@'localhost';
REVOKE SELECT ON registro_climatico.estacion FROM 'Rafa'@'localhost';
REVOKE UPDATE ON registro_climatico.estacion FROM 'Rafa'@'localhost';

-- O quitarle todos los privilegios de golpe
REVOKE ALL PRIVILEGES ON registro_climatico.* FROM 'Rafa'@'localhost';


-- PRIVILEGIOS A NIVEL DE TABLA

-- Dar privielgios sobre solo una columna de una tabla
GRANT SELECT (nombre) ON registro_climatico.ciudad TO 'Rafa'@'localhost';
GRANT SELECT (id, poblacion) ON registro_climatico.ciudad TO 'Rafa'@'localhost';

-- Dar privilegios de actualización por columna
GRANT UPDATE (poblacion) ON registro_climatico.ciudad TO 'Rafa'@'localhost';

-- Mostramos los privilegios recién asignados
SHOW GRANTS FOR 'Rafa'@'localhost';


-- CONCEDER PRIVILEGIOS DESDE OTRO USUARIO que no sea el root

-- Removemos los privilegios que tiene nuestro usuario
REVOKE ALL PRIVILEGES ON *.* FROM 'Rafa'@'localhost';

-- Le damos privilegios sobre toda una base de datos y que pueda otorgar esos mismos
-- privilegios a otros usuarios
GRANT ALL ON registro_climatico.* TO 'Rafa'@'localhost'
WITH GRANT OPTION;

-- Damos privilegio de creación de usuarios
GRANT CREATE USER ON *.* TO 'Rafa'@'localhost';

-- Mostramos los privilegios del usuario
SHOW GRANTS FOR 'Rafa'@'localhost';


-- NOTA: iniciando sesión con el usuario recién creado

-- Creamos un nuevo usuario
CREATE USER 'Jorge'@'localhost' IDENTIFIED BY 'VivanLosChilaquiles';

-- Le damos privilegios, y veremos que falla al darle privilegios fuera
-- de nuestro alcance
GRANT ALL ON *.* TO 'Jorge'@'localhost';
GRANT SELECT, UPDATE ON tienda.* TO 'Jorge'@'localhost';
-- Dar privilegio para crear bases de datos
GRANT CREATE ON *.* TO 'Jorge'@'localhost';

-- Pero si le doy privilegios con los que cuento, si puedo hacerlo
GRANT SELECT ON registro_climatico.* TO 'Jorge'@'localhost';
GRANT UPDATE ON registro_climatico.ciudad TO 'Jorge'@'localhost';
-- Privilegio para crear objetos en la base de datos
GRANT CREATE ON registro_climatico.* TO 'Jorge'@'localhost';

-- Eliminación de un usuario
DROP USER 'Jorge'@'localhost';


-- Pequeños ejercicios

-- Crear un usuario REMOTO, con nombre y contraseña cualquiera.
-- Darle permisos solamente de lectura y creación de objetos
-- en la base de datos tienda
CREATE USER 'Lalo'@'%' IDENTIFIED BY 'hola1234';

GRANT SELECT ON tienda.* TO 'Lalo'@'%';

GRANT CREATE ON tienda.* TO 'Lalo'@'%';

-- Crear un usuario LOCAL, con nombre  y contraseña cualquiera
-- Darle permisos de lectura, actualización, eliminación (no se pueden especificar columnas) 
-- e inserción
-- en la base de datos registros_climatico, pero solo para:
-- TABLA: estacion COLUMNAS: id, nombre, id_ciudad
-- TABLA: ciudad COLUMNAS: id, nombre, población
-- Además de la capacidad de crear otros usuarios y darles derechos,
-- pero solo los derechos de la tabla estacion
CREATE USER 'Natalia'@'localhost' IDENTIFIED BY 'holadiablo';

GRANT SELECT (id, nombre, id_ciudad) 
ON registro_climatico.estacion TO 'Natalia'@'localhost' WITH GRANT OPTION;
GRANT UPDATE (id, nombre, id_ciudad) 
ON registro_climatico.estacion TO 'Natalia'@'localhost' WITH GRANT OPTION;
GRANT DELETE 
ON registro_climatico.estacion TO 'Natalia'@'localhost' WITH GRANT OPTION;
GRANT UPDATE (id, nombre, id_ciudad)
ON registro_climatico.estacion TO 'Natalia'@'localhost' WITH GRANT OPTION;

GRANT SELECT (id, nombre, poblacion) 
ON registro_climatico.ciudad TO 'Natalia'@'localhost';
GRANT UPDATE (id, nombre, poblacion) 
ON registro_climatico.ciudad TO 'Natalia'@'localhost';
GRANT DELETE 
ON registro_climatico.estacion TO 'Natalia'@'localhost';
GRANT UPDATE (id, nombre, poblacion)
ON registro_climatico.ciudad TO 'Natalia'@'localhost';

GRANT CREATE USER ON *.* TO 'Natalia'@'localhost';