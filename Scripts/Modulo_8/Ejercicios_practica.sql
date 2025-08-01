/*
	Introducción a las bases de datos SQL
	Modulo 8: Ejercicios de práctica
*/

-- Seleccionamos la base de datos a usar
USE classicmodels;

-- 1. Obtener el nombre, telefono, primera dirección y país
-- de todos nuestros clientes
SELECT customerName,
	   phone,
       addressLine1,
       country
FROM customers;

-- 2. Obtener la lista de países que de donde son nuestros clientes,
-- sin repeticiones
SELECT DISTINCT (country)
FROM customers;

-- 3. Obtener a los clientes que sean de Australia o las Filipinas y que
-- tengan un límite de crédito mayor o igual a $8,000.
-- Traer el nombre del cliente, el nombre de contacto del cliente, país y límite de crédito.
SELECT customerName,
	   contactFirstName,
       contactLastName,
       country,
       creditLimit
FROM customers
WHERE COUNTRY IN ('Australia', 'Philippines')
AND creditLimit >= 8000;

-- 4. Obtener a todos los clientes que SÍ cuenten con un representante de ventas.
-- Traer el código y nombre del cliente y su límite de credito
-- Ordenar el resultado por límite de crédito de manera descendente
SELECT customerNumber,
       customerName,
       creditLimit
FROM customers
WHERE salesRepEmployeeNumber IS NOT NULL
ORDER BY creditLimit DESC;

-- 4. De la tabla order details, obtener el monto total por orden de venta.
SELECT orderNumber,
       SUM(quantityOrdered * priceEach) AS monto_total
FROM orderdetails
GROUP BY orderNumber;

-- 5. De la tabla order details, obtener las 5 ventas por orden
-- con mayor monto total
SELECT orderNumber,
       SUM(quantityOrdered * priceEach) AS monto_total
FROM orderdetails
GROUP BY orderNumber
ORDER BY monto_total DESC
LIMIT 5;

-- 6. Obtener el nombre de producto y cuantas veces se vendió
SELECT products.productName,
       SUM(orderdetails.quantityOrdered) AS cantidad_vendida
FROM orderdetails
INNER JOIN products
ON orderdetails.productCode = products.productCode
GROUP BY products.productname;

-- 7. Obtener todos los datos de los clientes que no han realizado
-- ninguna compra
SELECT customers.*
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.customerNumber IS NULL;

-- 8. Obtener el código y ciudad de las oficinas* y su cantidad de empleados.
-- Ordenar de menor a mayor cantidad de empleados
SELECT CONCAT(O.officeCode, '-', O.city) AS oficina_ciudad,
       COUNT(E.employeeNumber) AS conteo_de_empleados
FROM offices AS O
INNER JOIN employees AS E
ON O.officeCode = E.officeCode
GROUP BY oficina_ciudad
ORDER BY conteo_de_empleados ASC;

-- 9. Obtener nombre del cliente, checknumber, cantidad y fecha de pago
-- de aquellos empleados que tengan pagos por hacer, que su checknumber inicie
-- con la letra A y tengan fecha de pago en Septiembre de 2003
SELECT C.customerNumber,
       P.checkNumber,
       P.amount,
       P.paymentDate
FROM payments AS P
INNER JOIN customers AS C
ON P.customerNumber = C.customerNumber
WHERE P.checkNumber LIKE 'A%'
AND (MONTH(P.paymentDate) = 9 AND YEAR(P.paymentDate) = 2003);

-- 10. Modificar el precio de compra a $30.00 del producto con código S50_1341
SET sql_safe_updates = 0; -- Quitar modo seguro

-- Antes del cambio
SELECT *
FROM products
WHERE productCode = 'S50_1341';

UPDATE products
SET buyPrice = 30.00
WHERE productCode = 'S50_1341';

-- Después del cambio
SELECT *
FROM products
WHERE productCode = 'S50_1341';

-- 11. Eliminar el registro del cliente con el códgio 169
-- Antes de eliminarlo
SELECT *
FROM customers
WHERE customerNumber = 169;

DELETE FROM customers
WHERE customerNumber = 169;

-- Después de eliminarlo
SELECT *
FROM customers
WHERE customerNumber = 169;

-- 12. Añade al cliente 303 a la tabla payments, con un check number igual a BP973720,
-- fecha de pago igual a 1ro de Enero de 2005 y por una cantidad de 31700.00
DESCRIBE payments;

INSERT INTO payments
VALUES (303, 'BP973720', '2005-01-21', 31700.00);

-- Verificamos la inserción del valor
SELECT *
FROM payments
WHERE customerNumber = 303;

-- 13. Obtener id, primer nombre y puesto del empleado, 
-- así como id, primer nombre y puesto de la persona a la que reporta cada empleado.
-- Incluir a los empleados que no tengan jefe
SELECT employees.employeeNumber as employee_number,
       employees.firstName AS employee_name,
       employees.jobTitle AS employee_jobtitle,
       boss.employeeNumber AS boss_number,
       boss.firstName AS boss_name,
       boss.jobTitle AS boss_jobtitle
FROM employees
LEFT JOIN employees AS boss
ON employees.reportsTo = boss.employeeNumber;
						