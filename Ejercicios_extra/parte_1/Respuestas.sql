/*
Parte 1 
Ejercicios de práctica 1
Bd: sistema_fútbol
*/

-- Seleccionar la base de datos
USE sistema_futbol;

-- 1) Obtener todos los datos de la tabla equipo
-- Ordenandolos por el valor de cada equipo,
-- de mayor a menor valor
SELECT *
FROM equipos
ORDER BY valor DESC;

-- 2) Obtener el nombre y fecha de fundación de los equipos
-- fundados antes de 1900
SELECT nombre,
       fecha_fundacion
FROM equipos
WHERE YEAR(fecha_fundacion) < 1900;

-- 3) Obtener el nombre y fecha de fundación 
-- de los 3 equipos más antiguos
SELECT nombre,
       fecha_fundacion
FROM equipos
ORDER BY fecha_fundacion ASC
LIMIT 3;

-- 4) Obtener todos los datos de los estadios
-- españoles e italianos. Ordenalos por su capacidad,
-- del de menor capacidad al de mayor capacidad
SELECT * 
FROM estadios
WHERE codigo_pais = 'ESP'
   OR codigo_pais = 'ITA'
ORDER BY capacidad ASC;

-- 5) Obtener nombre, pais y salario anual
-- de aquellos jugadores brasileños que ganen
-- €20,000,000 o más
SELECT nombre,
       codigo_pais,
       salario_anual
FROM jugadores
WHERE codigo_pais = 'BRA'
  AND salario_anual >= 20000000;
  
-- 6) Obtener el valor promedio del sueldo anual de todos
-- los jugadores que tenemos almacenados en nuestra base de datos
SELECT AVG(salario_anual) AS promedio_salarios
FROM jugadores;

-- 7) Obtener todos los datos del jugador con el sueldo
-- anual más pequeño
SELECT *
FROM jugadores
WHERE salario_anual = (SELECT MIN(salario_anual)
                     FROM jugadores);
                     
-- Otra manera
SELECT *
FROM jugadores
ORDER BY salario_anual ASC
LIMIT 1;

-- 8) Obtener la capacidad máxima de los estadios 
-- por país. Es decir, de cada país, ¿cuál es la CAPACIDAD
-- del estadio con mayor capacidad/aforo?
SELECT codigo_pais,
       MAX(capacidad) AS capacidad_maxima
FROM estadios
GROUP BY codigo_pais;

-- 9) Obtener los salarios promedio por país de los jugadores
-- Es decir, por país, ¿cuál es el salario promedio de
-- los jugadores?
-- Ordenar por descendentemente por el salario promedio
-- y solo mostrar aquellos países con un salario promedio
-- de entre €20,000,000 y €30,000,000
SELECT codigo_pais,
       AVG(salario_anual) AS salario_promedio
FROM jugadores

GROUP BY codigo_pais
HAVING salario_promedio 
	   BETWEEN 20000000 AND 30000000
       
ORDER BY salario_promedio DESC;

-- Otra manera
SELECT codigo_pais,
       AVG(salario_anual) AS salario_promedio
FROM jugadores

GROUP BY codigo_pais
HAVING salario_promedio >= 20000000 
   AND salario_promedio <= 30000000
       
ORDER BY salario_promedio DESC;