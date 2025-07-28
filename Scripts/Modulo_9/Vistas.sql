/*
	Introducción a las bases de datos SQL
	Modulo 9: Vistas
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

/* Sintaxis básica para crear una VISTA

	CREATE VIEW view_name AS
		SELECT column1, column2, ...
		FROM table_name
		WHERE condition;
    
*/

-- Creamos una vista sencilla
CREATE VIEW todas_estaciones AS
	SELECT *
    FROM estacion;
    
-- Invocamos la vista de esta manera
SELECT * FROM todas_estaciones;

-- Una vista se elimina de esta manera
DROP VIEW todas_estaciones;

-- No podemos crear una vista con el mismo nombre de una tabla ya existente
CREATE VIEW estacion AS
	SELECT *
    FROM estacion;
    
-- Para diferenciarlas, podemos usar la siguiente notación
CREATE VIEW VW_estacion AS
	SELECT *
    FROM estacion;

-- Crear una vista que muestre id y nombre de la estación junto con su fecha de instalación,
-- además de la ciudad y país donde pertenece la estación
CREATE VIEW VW_estacion_datos AS
	SELECT E.id,
           E.nombre AS nombre_estacion,
		   E.fecha_instalacion,
		   C.nombre AS ciudad,
           P.nombre as Pais
    FROM estacion AS E
    INNER JOIN ciudad AS C
    ON E.id_ciudad = C.id
    INNER JOIN pais AS P
    ON C.id_pais = P.codigo_iso;
    
-- Invocamos la vista
SELECT * FROM VW_estacion_datos;

-- Podemos aplicar filtros sobre nuestra vista, como si fuera una tabla
SELECT * 
FROM VW_estacion_datos
WHERE pais IN ('Argentina', 'Brasil')
AND YEAR(fecha_instalacion) >= 2020;

-- Para mostrar las vistas que tenemos hacemos lo siguiente
SHOW FULL TABLES;

SHOW FULL TABLES 
WHERE Table_type = 'VIEW';

-- Modificar una vista
-- Primero creamos una vista
CREATE VIEW VW_estaciones_mantenimiento AS
	SELECT estacion.*, 
           mantenimiento.descripcion
    FROM estacion
    INNER JOIN mantenimiento
    ON estacion.id = mantenimiento.id_estacion;
    
SELECT * FROM vw_estaciones_mantenimiento;

-- Para cambiarlas usamos el comando ALTER VIEW
ALTER VIEW VW_estaciones_mantenimiento AS
	SELECT estacion.nombre,
           mantenimiento.fecha,
	       mantenimiento.descripcion AS '¿qué se hizo?'
    FROM estacion
    INNER JOIN mantenimiento
    ON estacion.id = mantenimiento.id_estacion;
    
SELECT * FROM vw_estaciones_mantenimiento;

-- También podemos hacer los siguiente
CREATE OR REPLACE VIEW VW_estaciones_mantenimiento AS
	SELECT estacion.nombre,
           mantenimiento.fecha,
	       mantenimiento.descripcion AS '¿qué se hizo?'
    FROM estacion
    INNER JOIN mantenimiento
    ON estacion.id = mantenimiento.id_estacion
    INNER JOIN ciudad
    ON estacion.id_ciudad = ciudad.id
    
    WHERE ciudad.id_pais = 'MEX';
    
SELECT * FROM vw_estaciones_mantenimiento;

-- Como la mayoría de las bases de datos SQL ha implementado
-- el paradigma orienta a objetos, podemos acceder a otras
-- bases de datos así:
SELECT tienda.empleado.nombre,
       tienda.empleado.apellido_paterno,
       tienda.empleado.fecha_nacimiento,
       tienda.empleado.sueldo_mensual
FROM tienda.empleado;

CREATE VIEW VW_empleados AS
	   SELECT E.id,
              E.nombre,
              E.apellido_materno,
              E.sueldo_mensual,
              D.nombre AS departamento
       FROM tienda.empleado AS E
       INNER JOIN tienda.departamento AS D
       ON E.id_departamento = D.id;
       
SELECT * FROM VW_empleados;


-- Pequeños ejercicios

-- Crear una vista llamada VW_registros
-- que regrese la id del registro de clima, el nombre de la estación que lo hizo,
-- solamente el año y mes (e.g. September-2025) en que se hizo el registro, la temperatura, humedad y
-- el nombre de la condición climatica que hubo
CREATE VIEW VW_registros AS
	SELECT RC.id,
           E.nombre AS estacion,
		   CONCAT(MONTHNAME(RC.fecha_hora),'-',YEAR(RC.fecha_hora)) AS fecha,
           RC.temperatura,
           RC.humedad,
           CC.nombre AS condicion
    FROM registros_clima AS RC
    INNER JOIN estacion AS E
    ON RC.id_estacion = E.id
    INNER JOIN condicion_climatica AS CC
    ON CC.id = RC.id_condicion_climatica;
    
-- Invoca a la vista
SELECT * FROM vw_registros;

-- De la vista anterior, obten las estaciones que hayan registrado una condición
-- de tormenta o calor extremo, además de una temperatura mayor o igual a 25°C 
-- y una humedad mayor al 50%
SELECT * 
FROM vw_registros
WHERE condicion = 'Tormenta' OR condicion = 'Calor Extremo'
AND temperatura >= 25 AND humedad > 50;

-- Crear una vista llamada VW_condicion_mas_repetida, en que se obtenga
-- el nombre de la condición climatica que más veces se registro, junto con el
-- total de veces que aparece
CREATE VIEW VW_condicion_mas_repetida as
	SELECT CC.nombre,
           COUNT(*) AS conteo
    FROM registros_clima AS RC
    INNER JOIN condicion_climatica AS CC
    ON RC.id_condicion_climatica = CC.id
    
    GROUP BY CC.nombre
    ORDER BY Conteo DESC
    LIMIT 1;

-- Mostrar el resultado de la vista
SELECT * FROM VW_condicion_mas_repetida;

-- Modifica la vista para que muestre ahora las 3 condiciones
-- más repetidas
ALTER VIEW VW_condicion_mas_repetida as
	SELECT CC.nombre,
           COUNT(*) AS conteo
    FROM registros_clima AS RC
    INNER JOIN condicion_climatica AS CC
    ON RC.id_condicion_climatica = CC.id
    
    GROUP BY CC.nombre
    ORDER BY Conteo DESC
    LIMIT 3;
    
-- Muestra el resultado de la vista
SELECT * FROM VW_condicion_mas_repetida;

-- Elimina la vista recien creada
DROP VIEW vw_condicion_mas_repetida;