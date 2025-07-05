/*
	Introducción a las bases de datos SQL
	Modulo 5: DML - Más datos
*/

-- Insertamos más departamentos
INSERT INTO departamento (id, nombre, zona, sueldo_minimo)
VALUES
  ('D05', 'Marketing', 'Zona B', 12000),
  ('D06', 'Logística', 'Zona C', 9000),
  ('D07', 'Investigación y Desarrollo', 'Zona A', 16000),
  ('D08', 'Finanzas', 'Zona B', 14000);

-- Insertamos más empleados
INSERT INTO empleado (
  id, nombre, apellido_paterno, apellido_materno, 
  fecha_nacimiento, email, sueldo_mensual, id_departamento
) VALUES
(14, 'Diana', 'Ramírez', 'Lopez', '1995-02-10', 'diana.ramirez@gmail.com', 16000, 'D05'),
(15, 'Carlos', 'Jiménez', 'Ortiz', '1988-07-18', 'carlos.jimenez@gmail.com', 18000, 'D06'),
(16, 'Paula', 'Gómez', 'Ruiz', '1992-03-30', 'paula.gomez@gmail.com', 12000, 'D03'),
(17, 'Sofía', 'Luna', 'Fernández', '1997-11-22', 'sofia.luna@gmail.com', 14000, 'D07'),
(18, 'Eduardo', 'Pérez', 'Martínez', '1983-01-09', 'eduardo.perez@gmail.com', 25000, 'D01'),
(19, 'Natalia', 'Torres', 'Sánchez', '2001-06-15', 'natalia.torres@gmail.com', 9000, 'D08'),
(20, 'Jorge', 'Ramos', 'Delgado', '1990-12-01', 'jorge.ramos@gmail.com', 10000, 'D02'),
(21, 'Daniela', 'Castillo', 'Fernández', '1996-05-05', 'daniela.castillo@gmail.com', 15000, 'D07'),
(22, 'Mario', 'Reyes', 'Morales', '1986-10-10', 'mario.reyes@gmail.com', 22000, 'D06'),
(23, 'Lucía', 'Hernández', 'Nieto', '1993-09-25', 'lucia.hernandez@gmail.com', 11000, 'D08'),
(24, 'Raúl', 'García', 'Ramírez', '1989-04-04', 'raul.garcia@gmail.com', 13500, 'D05'),
(25, 'Andrea', 'Martínez', 'Vega', '1998-08-12', 'andrea.martinez@gmail.com', 12500, 'D02'),
(26, 'Francisco', 'Navarro', 'Mendoza', '1984-12-19', 'francisco.navarro@gmail.com', 30000, 'D06'),
(27, 'Elena', 'Silva', 'Carrillo', '1991-03-07', 'elena.silva@gmail.com', 9500, 'D05'),
(28, 'Hugo', 'Cruz', 'Domínguez', '1999-07-21', 'hugo.cruz@gmail.com', DEFAULT, 'D01');