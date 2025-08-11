/*
	Introducción a las bases de datos SQL
	Modulo 8: Ejercicios de práctica Parte 2
*/

-- Seleccionamos la base de datos a usar
USE classicmodels;

-- 1. De la tabla order details, obtener las 5 ventas por orden
-- con mayor monto total
SELECT orderNumber,
       SUM(quantityOrdered * priceEach) AS monto_total
FROM orderdetails
GROUP BY orderNumber
ORDER BY monto_total DESC
LIMIT 5;

-- 2. Obtener el nombre de producto y cuantas veces se vendió
SELECT products.productName,
       SUM(orderdetails.quantityOrdered) AS cantidad_vendida
FROM orderdetails
INNER JOIN products
ON orderdetails.productCode = products.productCode
GROUP BY products.productname;

-- 3. Obtener todos los datos de los clientes que no han realizado
-- ninguna compra
SELECT customers.*
FROM customers
LEFT JOIN orders
ON customers.customerNumber = orders.customerNumber
WHERE orders.customerNumber IS NULL;

-- 4. Obtener el código y ciudad de las oficinas* y su cantidad de empleados.
-- Ordenar de menor a mayor cantidad de empleados
SELECT CONCAT(O.officeCode, '-', O.city) AS oficina_ciudad,
       COUNT(E.employeeNumber) AS conteo_de_empleados
FROM offices AS O
INNER JOIN employees AS E
ON O.officeCode = E.officeCode
GROUP BY oficina_ciudad
ORDER BY conteo_de_empleados ASC;

-- 5. Obtener nombre del cliente, checknumber, cantidad y fecha de pago
-- de aquellos clientes que tengan pagos por hacer, que su checknumber inicie
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

-- 6. Obtener id, primer nombre y puesto del empleado, 
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

-- 7.Lista los números de orden en los que se 
-- hayan incluido productos de más de una línea (productLine).
SELECT OD.orderNumber,
       COUNT(DISTINCT PL.productLine) AS conteo_de_lineas
       
FROM orderdetails AS OD
INNER JOIN products AS P
ON OD.productCode = P.productCode
INNER JOIN productlines AS PL
ON P.productLine = PL.productLine

GROUP BY OD.orderNumber
HAVING conteo_de_lineas > 1;

-- 8. Lista los empleados y la cantidad de clientes que tienen asignados, 
-- junto con el nombre de su oficina. Ordenar por cantidad de clientes mayor a menor
SELECT OFI.officeCode,
       CONCAT(E.firstName," ", E.lastname) employee,
       COUNT(*) AS cantidad_de_clientes
       
FROM offices AS OFI
INNER JOIN employees AS E
ON OFI.officeCode = E.officeCode
INNER JOIN customers AS C
ON E.employeeNumber = C.salesRepEmployeeNumber

GROUP BY OFI.officeCode, employee
ORDER BY cantidad_de_clientes DESC;