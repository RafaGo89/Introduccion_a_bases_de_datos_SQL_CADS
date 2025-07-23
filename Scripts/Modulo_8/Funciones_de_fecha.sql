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

-- Primero ponemos la fecha más reciente, y después la otra
SELECT DATEDIFF('2025-07-22', '2025-07-15');

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