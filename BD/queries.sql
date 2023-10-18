-- 1 Mostrar los clientes que hayan nacido después de 1960

SELECT * FROM Cliente WHERE Fecha_Nacimiento > '1960-12-31';

-- 2 Mostrar los clientes cuyos nombres empiecen por D

SELECT * FROM Cliente WHERE Nombre LIKE 'D%';

-- 3 Mostrar los nombres de los clientes que tengan más de 2 cuentas

-- Primero obtenemos los ids de los clientes que tienen más de 1 cuenta

SELECT ID_Cliente FROM Cliente_Cuenta GROUP BY ID_Cliente HAVING COUNT(ID_Cuenta) > 1;
--GROUP BY ID_Cliente HAVING COUNT(ID_Cuenta) > 2 te asocia a cada cliente sus cuentas y te cuenta cuantas tiene, si tiene más de 1 te lo muestra



SELECT Nombre FROM Cliente WHERE ID_Cliente IN (SELECT ID_Cliente FROM Cliente_Cuenta GROUP BY ID_Cliente HAVING COUNT(ID_Cuenta) > 1);






-- 4 Mostras los ids de los clientes que tengan cuenta en el Banco Bilbao y Deutsche Bank

SELECT ID_Cliente FROM Cliente_Banco WHERE ID_Banco IN (SELECT ID_Banco FROM Banco WHERE Nombre IN ('Banco Bilbao', 'Deutsche Bank'));

-- Primero seleccionamos los ids de los bancos que nos interesan
SELECT ID_Banco FROM Banco WHERE Nombre IN ('Banco Bilbao', 'Deutsche Bank');

-- Después seleccionamos los ids de los clientes que tengan cuenta en esos bancos
-- SELECT ID_Cliente FROM Cliente_Banco WHERE ID_Banco IN ids anteriores;



-- 5 Mostrar id de los clientes cuya posicion neta (suma de balances de sus cuentas) sea negativa

-- Primero calculemos la posición neta 
SELECT * FROM Cuenta INNER JOIN Cliente_Cuenta ON Cuenta.ID_Cuenta = Cliente_Cuenta.ID_Cuenta;

SELECT ID_Cliente FROM Cuenta INNER JOIN Cliente_Cuenta ON Cuenta.ID_Cuenta = Cliente_Cuenta.ID_Cuenta GROUP BY ID_Cliente HAVING SUM(Balance) < 0;

-- Ahora mostrar nombre e id de los clientes cuya posición neta sea negativa

SELECT ID_Cliente, Nombre 
FROM Cliente
WHERE ID_Cliente IN (SELECT ID_Cliente FROM Cuenta INNER JOIN Cliente_Cuenta ON Cuenta.ID_Cuenta = Cliente_Cuenta.ID_Cuenta GROUP BY ID_Cliente HAVING SUM(Balance) < 0);


-- 6 Mostrar los ids de las transacciones que se hagan a una cuenta con divisa distinta a la propia de la transacción

SELECT ID_Transaccion FROM Transaccion INNER JOIN Cuenta ON Transaccion.ID_Cuenta = Cuenta.ID_Cuenta WHERE Transaccion.ID_Divisa != Cuenta.ID_Divisa;

-- 7 Mostrar la cantidad a ingresar en la divisa de la cuenta de las transacciones que tienen una divisa distinta a la de la cuenta

-- para hacer el cambio de divisa es: 
-- [monto transaccion]*[cambio moneda transaccion a euros]* [cambio de euros a moneda de cuentas]
-- cambio moneda de cuenta a euros = 1/cambio de euros a moneda de cuentas

SELECT Transaccion.Monto * D1.Tasa_cambio*1/D2.Tasa_cambio FROM Transaccion 
-- Join de la tabla de transacciones con la tabla de cuentas
INNER JOIN Cuenta ON Transaccion.ID_Cuenta = Cuenta.ID_Cuenta 
-- Hago el JOIN para obtener Tasa de cambio de la moneda de la transacción
INNER JOIN Divisa as D1 ON Transaccion.ID_Divisa = D1.ID_Divisa
-- Hago el JOIN para obtener Tasa de cambio de la moneda de la cuenta
INNER JOIN Divisa as D2 ON Cuenta.ID_Divisa = D2.ID_Divisa
WHERE Transaccion.ID_Divisa != Cuenta.ID_Divisa;

-- 8 Mostar el nombre de los clientes que tenga alguna cuenta con divisa distinta a euros

SELECT Nombre FROM Cliente WHERE ID_Cliente IN 
(SELECT ID_Cliente FROM Cliente_Cuenta WHERE ID_Cuenta IN
(SELECT ID_Cuenta FROM Cuenta WHERE ID_Divisa != 1));

-- 9 Mostrar los paises que no tengan mas de 2 bancos

SELECT ID_Pais FROM Banco_Pais GROUP BY ID_Pais HAVING COUNT(ID_Banco) <= 2;

-- 10 Mostrar las divisas que no tengan ninguna cuenta asociada

SELECT * FROM Divisa WHERE ID_Divisa NOT IN (SELECT ID_Divisa FROM Cuenta);

-- 11 Mostrar las divisas que se usen en menos de dos paises

SELECT ID_Divisa FROM Pais GROUP BY ID_Divisa HAVING COUNT(ID_Pais) < 2;

-- 12 Mostrar los prestamos que tengan una durancion mayor a 10 años

SELECT * FROM Prestamo WHERE DATEDIFF(Fecha_fin, Fecha_inicio) > 365*10;

-- 13 Mostrar los clientes que tengan un prestamo con una duracion mayor a 10 años

SELECT ID_Cliente FROM Prestamo WHERE DATEDIFF(Fecha_fin, Fecha_inicio) > 365*10;

-- 14 Mostrar los clientes que tengan un prestamo en un banco en el que no tienen ninguna cuenta

SELECT Cliente_Prestamo_Banco.ID_Cliente FROM Cliente_Prestamo_Banco  INNER JOIN Cliente_Banco ON Cliente_Prestamo_Banco.ID_Cliente = Cliente_Banco.ID_Cliente
WHERE Cliente_Prestamo_Banco.ID_Banco != Cliente_Banco.ID_Banco; 

-- 15 Mostrar las divisas con las que hay una cantidad transferida total equivalente a más de 500 euros

-- Primero, consigo una tabla con todas las transacciones en euros

SELECT Transaccion.Monto*Divisa.Tasa_cambio, Transaccion.* FROM Transaccion INNER JOIN Divisa ON Transaccion.ID_Divisa = Divisa.ID_Divisa;

-- Ahora agrupo por divisa y sumo los montos

SELECT SUM(Transaccion.Monto*Divisa.Tasa_cambio), Transaccion.ID_Divisa FROM Transaccion INNER JOIN Divisa ON Transaccion.ID_Divisa = Divisa.ID_Divisa GROUP BY Transaccion.ID_Divisa HAVING SUM(Transaccion.Monto*Divisa.Tasa_cambio) > 500;