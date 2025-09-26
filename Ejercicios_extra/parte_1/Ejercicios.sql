/*
Parte 1 
Ejercicios de práctica 1
Bd: sistema_fútbol

	RESOLVER LOS SIGUIENTES EJERCICIOS.
    RECUERDA QUE EN LA MAYORÍA HAY MÁS DE UNA FORMA DE CONTESTARLOS
*/

-- Seleccionar la base de datos
USE sistema_futbol;

-- 1) Obtener todos los datos de la tabla equipo
-- Ordenandolos por el valor de cada equipo,
-- de mayor a menor valor

-- 2) Obtener el nombre y fecha de fundación de los equipos
-- fundados antes de 1900

-- 3) Obtener el nombre y fecha de fundación 
-- de los 3 equipos más antiguos

-- 4) Obtener todos los datos de los estadios
-- españoles e italianos. Ordenalos por su capacidad,
-- del de menor capacidad al de mayor capacidad

-- 5) Obtener nombre, pais y salario anual
-- de aquellos jugadores brasileños que ganen
-- €20,000,000 o más
  
-- 6) Obtener el valor promedio del sueldo anual de todos
-- los jugadores que tenemos almacenados en nuestra base de datos

-- 7) Obtener todos los datos del jugador con el sueldo
-- anual más pequeño
					

-- 8) Obtener la capacidad máxima de los estadios 
-- por país. Es decir, de cada país, ¿cuál es la CAPACIDAD
-- del estadio con mayor capacidad/aforo?


-- 9) Obtener los salarios promedio por país de los jugadores
-- Es decir, por país, ¿cuál es el salario promedio de
-- los jugadores?
-- Ordenar por descendentemente por el salario promedio
-- y solo mostrar aquellos países con un salario promedio
-- de entre €20,000,000 y €30,000,000

-- Otra manera

-- 10) Obtener nombre y apellido de aquellos jugadores que son agentes libres
-- NOTA: un jugador que es agente libre es aquel que no tiene equipo, en este caso
-- debemos de fijarnos en el codigo_equipo del jugador

-- 11) El FC Barcelona está pasando por una crisis financiera severa,
-- por lo cual han decidido reducir a la mitad el salario anual de
-- sus jugadores7. Raestra que código de equipo tiene la FC Barcelona
-- para poder aplicar la actualización

-- 12) El jugador con código Youssef Youssef se retirará del futbol profesional,
-- por ende ya no es necesario tenerlo en nuestra base de datos.
-- Elimina el registro de ese jugadores, de preferencia por su id de jugador

-- 13) EL jugador Alisson Becker se ha quedado sin equipo, ahora es
-- agente libre. Actualiza su registro para que quede guardado que ahora
-- es agente libre.
-- Recuerda que un agente libre es quien no tiene equipo, no tiene NADA
-- en su código_equipo
