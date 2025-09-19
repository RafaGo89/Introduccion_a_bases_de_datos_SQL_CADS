/*
	Introducción a las bases de datos SQL
	Modulo 6: Ejercicios de práctica Parte 1
*/

-- Seleccionamos la base de datos a usar
USE classicmodels;

-- 1. Obtener el nombre, telefono, primera dirección y país
-- de todos nuestros clientes

-- 2. Obtener la lista de países que de donde son nuestros clientes,
-- sin repeticiones

-- 3. Obtener a los clientes que sean de Australia o las Filipinas y que
-- tengan un límite de crédito mayor o igual a $8,000.
-- Traer el nombre del cliente, el nombre de contacto del cliente, país y límite de crédito.

-- 4. Obtener a todos los clientes que SÍ cuenten con un representante de ventas.
-- Traer el código y nombre del cliente y su límite de credito
-- Ordenar el resultado por límite de crédito de manera descendente

-- 5. De la tabla order details, obtener el monto total por orden de venta.

-- 6. Modificar el precio de compra a $30.00 del producto con código S50_1341
SET sql_safe_updates = 0; -- Quitar modo seguro

-- Antes del cambio

-- 7. Eliminar el registro del cliente con el códgio 169
-- Antes de eliminarlo

-- Después de eliminarlo

-- 8. Añade al cliente 303 a la tabla payments, con un check number igual a BP973720,
-- fecha de pago igual a 1ro de Enero de 2005 y por una cantidad de 31700.00
DESCRIBE payments;

-- Verificamos la inserción del valor