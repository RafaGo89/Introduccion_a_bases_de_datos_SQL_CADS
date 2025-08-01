/*
	Introducción a las bases de datos SQL
	Modulo 6: Nuevo Modelo de datos
*/

-- Creamos la nueva base de datos
CREATE DATABASE registro_climatico;

-- Seleccionamos la base de datos
USE registro_climatico;

-- Tabla de un listado de países, relacionadas a las ciudades
CREATE TABLE pais(
	codigo_iso CHAR(4) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Creamos la tabla de ciudades en las que se monitorea el clima
CREATE TABLE ciudad(
	id SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    id_pais CHAR(4) NOT NULL,
    poblacion INT UNSIGNED,
    superficie INT UNSIGNED COMMENT 'Superficie en Km2',
    
    FOREIGN KEY (id_pais) REFERENCES pais(codigo_iso)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Creamos la tabla sobre las estaciones meteorológicas que recolectan datos
CREATE TABLE estacion(
	id CHAR(6) PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    id_ciudad SMALLINT UNSIGNED,
    altitud DECIMAL(6,2) COMMENT 'Altitud en metros',
    fecha_instalacion DATE,
    
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Creamos una tabla para guardar los tipos de condiciones climaticas
CREATE TABLE condicion_climatica(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (50),
    descripcion VARCHAR(100)
);

-- Creamos una tabla los datos de temperatura, humedad, viento, etc.,
-- por estación y ciudad.
CREATE TABLE registros_clima(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_estacion CHAR(6) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    temperatura DECIMAL(5,2) COMMENT 'Temperatura en grados celsius',
    humedad DECIMAL(5,2) COMMENT 'Humedad en porcentaje',
    velocidad_viento DECIMAL(6,2) COMMENT 'Velocidad del viento en Km/h',
    id_condicion_climatica INT UNSIGNED NOT NULL,
    
    FOREIGN KEY(id_estacion) REFERENCES estacion(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY(id_condicion_climatica) REFERENCES condicion_climatica(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Creamos una tabla para los mantenimientos realizados a las estaciones
CREATE TABLE mantenimiento(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_estacion CHAR(6) NOT NULL,
    fecha DATE NOT NULL,
    descripcion VARCHAR(150),
    
    FOREIGN KEY(id_estacion) REFERENCES estacion(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- Carga de datos
INSERT INTO pais (codigo_iso, nombre) VALUES
('MEX', 'México'),
('USA', 'Estados Unidos'),
('ARG', 'Argentina'),
('BRA', 'Brasil'),
('ESP', 'España'),
('CAN', 'Canadá'),
('FRA', 'Francia'),
('COL', 'Colombia'),
('CHL', 'Chile'),
('PER', 'Perú'),
('THA', 'Tailandia'),
('TLS', 'Timor Oriental');

INSERT INTO ciudad (nombre, id_pais, poblacion, superficie) VALUES
('Ciudad de México', 'MEX', 9209944, 1495),        
('Guadalajara', 'MEX', 1495182, 151),            
('Monterrey', 'MEX', 1135512, 324),          
('Tonala', 'MEX', 500000, 119),                   
('Los Angeles', 'USA', 3898747, 1302),             
('Miami', 'USA', 442241, 143),                    
('Buenos Aires', 'ARG', 3075646, 203),           
('Córdoba', 'ARG', 1391000, 576),             
('São Paulo', 'BRA', 12330000, 1521),          
('Bogotá', 'COL', 7743955, 1587),              
('Madrid', 'ESP', 3265000, 605),                  
('Barcelona', 'ESP', 1636762, 101),              
('Montreal', 'CAN', 1780000, 431),                 
('París', 'FRA', 2161000, 105),                   
('Santiago', 'CHL', 5743719, 641),                
('Lima', 'PER', 9674755, 2672),
('Seattle', 'USA', 755078, 217),
('San Miguel de Tucumán', 'ARG', 830000, 91),
('San Luis Potosí', 'MEX', 845941 , 1443),
('Cusco', 'PER', 1205500, 385);                    


INSERT INTO estacion (id, nombre, id_ciudad, altitud, fecha_instalacion) VALUES
('MEX001', 'Estación CDMX Centro', 1, 2000.00, '2005-06-15'),
('MEX002', 'estación Guadalajara Norte', 2, 1523.50, '2010-03-22'),
('MEX003', 'estación Monterrey Sur', 3, 500.00, '2012-10-01'),
('MEX004', 'Estación Tonalá Oriente', 4, 1300.00, '2018-08-10'),
('USA001', 'L.A. Downtown Weather', 5, 89.30, '2000-11-10'),
('USA002', 'Miami Beach Station', 6, 0, '2013-05-25'),
('ARG001', 'Buenos Aires Sur', 7, 22.00, '2012-07-04'),
('ARG002', 'Córdoba Norte', 8, 378.00, '2016-04-12'),
('BRA001', 'São Paulo Este', 9, 701.00, '2015-09-13'),
('BRA002', 'São Paulo Estación Central', 9.00, 701.00, '2025-01-25'),
('COL001', 'Bogotá Centro', 10, 2200.00, '2017-06-18'),
('ESP001', 'Madrid Clima Central', 11, 598.00, '2008-03-15'),
('ESP002', 'Barcelona Puerto', 12, 10.00, '2011-11-01'),
('ESP003', 'Barcelona Estación del Clima', 12.00, 40.00, '2020-08-20'),
('CAN001', 'Montreal Norte', 13, 225.00, '2009-09-20'),
('FRA001', 'Paris Estación Central', 14, 31.00, '2014-02-17'),
('CHL001', 'Santiago Sur', 15, 520.00, '2019-01-20'),
('MEX005', 'Estación CDMX-E.D Sur', 1, 2101.00, '2021-03-12'),
('ARG003', 'Buenos Aires Norte', 7, 15.00, '2022-09-25'),
('COL002', 'Bogotá Estación del Sur', 10, 2407.00, '2023-02-01'),
('PER001', 'Lima Climática', 16, 130.00, '2020-05-12');


INSERT INTO condicion_climatica (nombre, descripcion) VALUES
('Despejado', 'Cielo sin nubes'),
('Nublado', 'Cielo mayormente cubierto'),
('Lluvia', 'Precipitación moderada o intensa'),
('Tormenta', 'Lluvia fuerte'),
('Niebla', 'Visibilidad reducida por vapor de agua'),
('Nevada', 'Caída de nieve'),
('Granizo', 'Precipitación de bolas de hielo'),
('Calor extremo', 'Temperatura muy elevada'),
('Tormenta eléctrica', 'Lluvia fuerte con truenos'),
('Tormenta de arena', 'Fuertes vientos que levantan polvo');

INSERT INTO registros_clima (id_estacion, fecha_hora, temperatura, humedad, velocidad_viento, id_condicion_climatica) VALUES
('MEX001', '2024-05-10 06:00:00', 13.8, 93.5, 14.1, 4),
('ESP001', '2024-05-12 07:00:00', 36.9, 72.8, 7.6, 8),
('PER001', '2023-06-14 08:00:00', 8.0, 63.7, 2.3, 7),
('ARG001', '2024-01-06 09:00:00', 4.6, 51.6, 17.9, 7),
('FRA001', '2025-07-06 10:00:00', 0.0, 70.6, 5.5, 2),
('ARG002', '2025-07-06 11:00:00', 0.0, 79.8, 5.4, 6),
('MEX004', '2025-07-06 12:00:00', 21.7, 81.6, 2.5, 8),
('FRA001', '2025-07-07 13:00:00', 4.7, 60.1, 18.6, 1),
('MEX004', '2025-07-08 14:00:00', 21.0, 88.8, 11.8, 3),
('ESP001', '2025-07-08 15:00:00', 5.6, 66.0, 16.5, 3),
('MEX002', '2025-07-06 16:00:00', 7.7, 73.6, 10.6, 4),
('CAN001', '2023-02-08 17:00:00', 26.5, 65.5, 8.7, 5),
('PER001', '2025-01-08 18:00:00', 11.8, 35.2, 14.6, 1),
('ARG002', '2023-07-06 19:00:00', 10.8, 48.1, 20.0, 7),
('CHL001', '2025-07-06 20:00:00', 19.9, 48.5, 9.8, 6),
('BRA001', '2025-07-06 21:00:00', 15.0, 50.1, 16.7, 7),
('USA001', '2023-07-09 22:00:00', 1.3, 84.2, 12.4, 4),
('PER001', '2025-07-06 23:00:00', 30.0, 36.9, 13.3, 7),
('ESP001', '2025-07-07 00:00:00', 11.1, 44.8, 16.0, 1),
('ESP002', '2025-07-07 01:00:00', 15.0, 90.1, 10.4, 3),
('USA001', '2025-07-07 02:00:00', 16.4, 91.7, 4.8, 4),
('FRA001', '2025-07-07 03:00:00', 15.0, 54.6, 11.0, 7),
('CAN001', '2025-07-07 04:00:00', 28.0, 31.3, 16.4, 8),
('MEX002', '2025-07-07 05:00:00', 27.6, 93.7, 10.2, 8),
('MEX004', '2025-07-07 06:00:00', 27.1, 77.9, 15.1, 4),
('MEX004', '2025-07-07 07:00:00', 2.5, 58.1, 7.3, 5),
('MEX004', '2025-07-07 08:00:00', 7.6, 47.3, 8.5, 7),
('USA002', '2025-07-07 09:00:00', 30.4, 67.5, 18.2, 2),
('ESP002', '2023-07-07 10:00:00', 7.8, 38.1, 8.0, 8),
('PER001', '2023-07-07 11:00:00', 28.3, 74.3, 5.0, 4),
('PER001', '2025-07-07 12:00:00', -7.0, 71.6, 16.8, 6),
('USA002', '2025-07-07 13:00:00', 11.2, 49.0, 13.2, 3),
('MEX002', '2024-07-07 14:00:00', -2.0, 47.5, 4.1, 2),
('ARG002', '2025-07-07 15:00:00', 21.4, 67.5, 7.1, 2),
('USA001', '2023-07-07 16:00:00', 30.9, 69.1, 6.8, 5),
('MEX001', '2025-07-07 17:00:00', 7.3, 37.7, 2.8, 2),
('COL001', '2025-07-07 18:00:00', 14.9, 47.0, 12.8, 2),
('MEX003', '2025-07-07 19:00:00', 29.1, 39.0, 11.1, 8),
('COL001', '2025-07-07 20:00:00', 26.2, 80.0, 9.4, 5),
('BRA001', '2025-07-07 21:00:00', 36.6, 54.9, 9.3, 4),
('COL001', '2025-07-07 22:00:00', 20.0, 72.2, 11.0, 7),
('CAN001', '2025-07-07 23:00:00', 19.0, 43.7, 2.4, 3),
('USA002', '2025-07-08 00:00:00', 18.7, 65.8, 3.4, 8),
('COL001', '2025-07-08 01:00:00', 0.1, 42.5, 13.3, 7),
('MEX001', '2025-07-08 02:00:00', 7.8, 42.1, 9.4, 4),
('ESP002', '2025-07-08 03:00:00', 25.8, 77.9, 10.4, 4),
('PER001', '2025-07-08 04:00:00', 4.4, 76.3, 19.5, 8),
('CHL001', '2025-07-08 05:00:00', 15.0, 89.1, 11.9, 7),
('USA002', '2025-07-08 06:00:00', 10.9, 74.6, 17.4, 7),
('MEX005', '2025-07-08 08:00:00', 20.1, 68.5, 10.2, 2),
('MEX005', '2025-07-08 12:00:00', 27.4, 45.1, 12.6, 8),
('MEX005', '2025-07-08 16:00:00', 25.9, 50.3, 14.0, 1),
('ARG003', '2025-07-08 09:00:00', 13.8, 70.2, 9.4, 2),
('ARG003', '2025-07-08 13:00:00', 17.5, 55.6, 10.1, 1),
('ARG003', '2025-07-08 19:00:00', 14.2, 65.3, 8.3, 3),
('COL002', '2025-07-08 07:00:00', 14.0, 85.2, 7.6, 2),
('COL002', '2025-07-08 11:00:00', 18.3, 60.5, 6.2, 1),
('COL002', '2025-07-08 17:00:00', 15.7, 72.0, 9.1, 3),
('CAN001', '2025-07-09 07:00:00', 7.5, 78.9, 17.4, 7);

INSERT INTO mantenimiento (id_estacion, fecha, descripcion) VALUES
('MEX001', '2024-12-20', 'Calibración anual de sensores de humedad'),
('MEX001', '2024-12-25', 'Cambio de fibra óptica'),
('MEX001', '2023-06-07', 'Reeparación de conexión a internet'),
('MEX001', '2025-09-12', 'Instalación de nuevos paneles solares'),
('MEX002', '2025-01-10', 'Reemplazo de batería y limpieza de panel solar'),
('USA001', '2025-03-05', 'Verificación de conexión satelital'),
('ARG001', '2025-05-15', 'Actualización de software del módulo de viento'),
('BRA001', '2025-06-01', 'Inspección preventiva por alta humedad'),
('CAN001', '2025-01-14', 'Cambio de sensor de temperatura por daño por congelación'),
('ESP001', '2025-03-10', 'Revisión del anemómetro'),
('MEX003', '2025-06-20', 'Reubicación de la estación por construcciones'),
('COL001', '2025-04-05', 'Reinicio del sistema por error de lectura'),
('MEX004', '2025-02-18', 'Instalación de nueva celda solar'),
('MEX004', '2025-02-18', 'Reparación de lavamanos'),
('ARG001', '2023-01-30', 'Reemplazo de batería y limpieza de panel solar'),
('MEX004', '2025-02-18', 'Limpieza por obstrucción del canal de lluvia'),
('USA001', '2024-12-01', 'Reemplazo de cableado dañado por roedores'),
('USA001', '2024-12-10', 'Instalación de nuevo cableado'),
('FRA001', '2022-03-25', 'Revisión de cerraduras y acceso restringido'),
('MEX003', '2024-11-03', 'Limpieza de celda solar y domo del sensor UV'),
('CAN001', '2025-01-14', 'Actualización del firmware del sistema de adquisición');