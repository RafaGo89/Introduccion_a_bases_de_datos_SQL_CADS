/*
	Introducción a las bases de datos SQL
	Modulo 8: Funciones integradas - Funciones de fecha
*/

-- Seleccionamos la base de datos a usar
USE registro_climatico;

-- CURDATE() ó CURRENT_DATE()
-- Regresa la fecha actual
SELECT CURDATE();

SELECT CURRENT_DATE();

-- CURRENT_TIME() CURTIME()
-- Regresa la hora actual
SELECT CURRENT_TIME();

SELECT CURTIME();

-- CURRENT_TIMESTAMP()
-- Regresa la fecha y hora actual
SELECT CURRENT_TIMESTAMP();

-- DAY()
-- Extrae el día de una fecha (como número)
SELECT DAY('2003-09-13');

-- Extraemos el día de la fecha en que se realizaron los mantenimientos
SELECT fecha, DAY(fecha) AS dia
FROM mantenimiento;

-- DAYNAME()
-- Extrae el día de una fecha (como nombre)
SELECT fecha, DAYNAME(fecha) AS dia
FROM mantenimiento;

-- MONTH()
-- Regresa el mes de una fecha

SELECT MONTH('2003-09-13');

-- Extraemos el mes de la fecha en que se realizaron los mantenimientos
SELECT fecha, MONTH(fecha) AS mes
FROM mantenimiento;

-- MONTHNAME()
-- Regresa el mes de una fecha (como nombre)
SELECT fecha, MONTHNAME(fecha) AS mes
FROM mantenimiento;

-- YEAR()
-- Regresa el año de una fecha

SELECT YEAR('2003-09-13');

-- Extraemos el año de la fecha en que se realizaron los mantenimientos
SELECT fecha, YEAR(fecha) AS 'año'
FROM mantenimiento;

-- DATEDIFF()
-- Regresa la diferencia en días entre 2 fechas

-- Primero ponemos la fecha más reciente, y después la otra para obtener un valor postivo
SELECT DATEDIFF('2025-07-22', '2025-07-15');

-- TIMESTAMPDIFF()
-- Regresa la diferencia entre 2 fechas en otra unidad (meses, años)

-- Primero ponemos la unidad, luego la fecha más antigua, y después la otra para obtener un valor postivo
SELECT TIMESTAMPDIFF(MONTH, '2025-07-22', '2025-08-22');

SELECT TIMESTAMPDIFF(WEEK, '2025-07-22', '2025-08-22');

-- DATE_ADD()
-- Añade una cantidad (días, años, etc.) a una fecha
SELECT DATE_ADD('2025-07-10', INTERVAL 5 DAY);

SELECT DATE_ADD('2025-07-10', INTERVAL 1 WEEK);

SELECT DATE_ADD('2025-07-10', INTERVAL 2 YEAR);

SELECT DATE_ADD('2025-07-10', INTERVAL -5 DAY);

-- DATE_FORMAT()
-- Le da formato a una fecha

-- Formato: 10 March 25
SELECT DATE_FORMAT('2022-07-22', '%d-%M-%y');

-- Formato: 10 Sunday Jan 2025
SELECT DATE_FORMAT('2022-07-22', '%d %W %b %Y');

-- Formato: The 2nd of July, 2025
SELECT DATE_FORMAT('2022-07-22', 'The %D of %M, %Y');

-- Todos los formatos: https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format


-- Pequeños ejercicios

-- Obtener el nombre de las estaciones, si fecha de instalación
-- y su 'edad', los años que han pasado desde que se instalaron.
-- Ordena de las más antiguas a las más nueva

-- Obtener nombre de la estacion, fecha de instalación y, por separado,
-- solo el año, el mes (como número o nombre )y el día nombre. 
-- Solo de las estaciones instaladas entre 2015 y el año actual
-- Ordenar por año de más nuevo a más viejo
SELECT nombre,
       fecha_instalacion,
       YEAR(fecha_instalacion) AS 'Año',
       MONTHNAME(fecha_instalacion) Mes,
       DAYNAME(fecha_instalacion) AS Dia
FROM estacion
WHERE YEAR(fecha_instalacion) BETWEEN '2015' AND YEAR(CURDATE())
ORDER BY YEAR(fecha_instalacion) DESC;

SELECT nombre,
	   fecha_instalacion,
       TIMESTAMPDIFF(YEAR, fecha_instalacion, CURRENT_DATE()) AS edad_estacion
FROM estacion
ORDER BY edad_estacion DESC;

-- Otra manera de hacerlo
SELECT nombre,
	   fecha_instalacion,
       FLOOR((DATEDIFF(CURRENT_DATE(), fecha_instalacion)) / 365) AS 'años_activa'
FROM estacion
ORDER BY FLOOR((DATEDIFF(CURRENT_DATE(), fecha_instalacion)) / 365) DESC;

-- Obtener el nombre de la estación, su primer y último mantenimiento recibido,
-- incluso si la estación nunca ha recibido un mantenimiento.
-- Formatear la fecha de esta manera: 22/Jan/25
SELECT estacion.nombre AS estacion,
       DATE_FORMAT(MAX(mantenimiento.fecha), '%d/%b/%y') AS ultimo_mantenimiento,
       DATE_FORMAT(MIN(mantenimiento.fecha), '%d/%b/%y') AS primer_mantenimiento
FROM estacion
LEFT JOIN mantenimiento
ON estacion.id = mantenimiento.id_estacion
GROUP BY estacion;

-- Obtener el nombre de la estación, su primer y último mantenimiento recibido,
-- la diferencia en días entre ambos mantenimientos y la suma del último mantenimiento
-- más la diferencia en días entre los mantenimientos
-- Obtenerlo solo de las estaciones que sí hayan recibido mantenimientos
SELECT estacion.nombre AS estacion,
       DATE_FORMAT(MAX(mantenimiento.fecha), '%d/%b/%y') AS ultimo_mantenimiento,
       DATE_FORMAT(MIN(mantenimiento.fecha), '%d/%b/%y') AS primer_mantenimiento,
       DATEDIFF(MAX(mantenimiento.fecha), MIN(mantenimiento.fecha)) AS diferencias_en_dias,
       DATE_ADD(MAX(mantenimiento.fecha), INTERVAL  
                                          DATEDIFF(MAX(mantenimiento.fecha), MIN(mantenimiento.fecha)) DAY) AS siguiente_fecha
FROM estacion
INNER JOIN mantenimiento
ON estacion.id = mantenimiento.id_estacion
GROUP BY estacion;