USE EconomiaDB;
-- Resetear autoincremento de las tablas
ALTER TABLE Pais AUTO_INCREMENT = 1;
ALTER TABLE Banco AUTO_INCREMENT = 1;
ALTER TABLE Banco_Pais AUTO_INCREMENT = 1;
ALTER TABLE Cliente AUTO_INCREMENT = 1;
ALTER TABLE Prestamo AUTO_INCREMENT = 1;
ALTER TABLE Cliente_Prestamo_Banco AUTO_INCREMENT = 1;
-- ALTER TABLE Cliente_Banco AUTO_INCREMENT = 1;
ALTER TABLE Cuenta AUTO_INCREMENT = 1;
ALTER TABLE Cliente_Cuenta AUTO_INCREMENT = 1;
ALTER TABLE Transaccion AUTO_INCREMENT = 1;
ALTER TABLE Divisa AUTO_INCREMENT = 1;
ALTER TABLE Empleado AUTO_INCREMENT = 1;
ALTER TABLE Supervisor AUTO_INCREMENT = 1;
ALTER TABLE Miembro_equipo AUTO_INCREMENT = 1;

-- Insertar datos en las tablas

INSERT INTO Divisa (Codigo, Tasa_cambio) 
VALUES ("EUR", 1), ("GBP", 1.15),
("CHF", 1.04), ("PLN", 0.22), ("CZK", 0.041),
("NOK", 0.088), ("SEK", 0.086);


INSERT INTO Pais (Nombre, Poblacion, ID_Divisa) 
VALUES ("España", 47, 1), ("Reino Unido", 67, 2), ("Alemania", 83.2, 1), 
("Polonia", 37.75, 4), ("República Checa", 10.51, 5), ("Francia", 67.75, 1), 
("Paises Bajos", 17.53, 1), ("Suiza", 8.703, 3), ("Noruega", 5.4, 6), 
("Suecia", 10.42, 7), ("Italia", 59.11, 1), ("Grecia", 10.64, 1);


INSERT INTO Banco (Nombre, Sede) 
VALUES ("Banco Santander", "Santander"), ("Barclays", "Londres"), 
("BNP Paribas", "Paris"), ("Crédit Agricole", "Paris"), 
("UBS", "Zürich"), ("Deutsche Bank", "Frankfurt"), 
("Lloyds Banking Group", "Londres"), ("Intensa Sanpaolo", "Turin"), 
("Banco Bilbao", "Bilbao"), ("Rabobank", "Utrecht"), 
("DZ Bank", "Frankfurt"), ("Banco Nacional Checo", "Praga");


INSERT INTO Cliente (Nombre, Apellido, Fecha_nacimiento) 
VALUES ("Juan", "Pérez", "1985-01-15"), ("Ana", "García", "1990-06-22"),
("Antonio", "García", "1970-01-01"), ("Maximiliam", "Müller", "1990-01-01"), 
("Alexander", "Zelensky", "1986-01-01"), ("Marilyn", "Monroe", "1926-01-01"), 
("Donald", "Trump", "1946-01-01"), ("Jorge Mario", "Bergoglio", "1936-01-01"), 
("Dalia", "Lama", "1938-01-01"), ("Vladimir", "Putin", "1952-01-01"), 
("Alex", "elcapo", "1987-10-06"), ("Joanne", "Rowling", "1965-07-31");


-- PLN polonia, CHF suiza, GBP reino unido, CZK república checa, NOK noruega, SEK suecia

INSERT INTO Cuenta (Tipo, Balance, ID_Banco, ID_Divisa) 
VALUES ("Ahorros", 1500.00, 1, 1), ("Corriente", 500.00, 2, 2), ("Ahorros", 2000.00, 3, 1),
("Ahorros", 50000, 5, 1), ("Corriente", 200, 9,1), ("Ahorros", 300, 6,1), ("Corriente", 40000, 4, 1), 
("Ahorros", 500, 5, 3), ("Corriente", -100, 6, 1), ("Ahorros", 700, 7, 2), ("Corriente", 800, 8, 1), 
("Ahorros", 900, 10, 1), ("Corriente", -30000, 12, 5);


INSERT INTO Transaccion (Fecha, Monto, Descripcion, ID_Cuenta, ID_Divisa) 
VALUES ("2023-03-01", 100.00, "Pago de factura", 1, 1),
       ("2023-03-05", 250.00, "Compra en supermercado", 2, 2),
       ("2023-03-10", 300.00, "Transferencia a otro banco", 3, 1),
       ("2020-09-13", 100, "Patatas con carne", 1, 1), 
       ("2022-10-2", 200, "Mudanza casa", 2, 2), 
       ("2015-03-27", 300, "No sé lo que poner", 3, 1), 
       ("2020-01-01", 400, "Descripcion D", 4, 1), 
       ("2020-01-01", 500, "Descripcion E", 5, 1), 
       ("2020-01-01", 600, "Descripcion F", 6, 1), 
       ("2020-01-01", 700, "Descripcion G", 7, 1), 
       ("2020-01-01", 800, "Descripcion H", 8, 3), 
       ("2020-01-01", 900, "Descripcion I", 9, 1), 
       ("2020-01-01", 1000, "Descripcion J", 10, 2);


INSERT INTO Prestamo (Monto, Fecha_inicio, Fecha_vencimiento, ID_Cliente, ID_Divisa)
VALUES (100, "2020-01-01", "2020-01-01", 1, 1), (200, "2020-01-01", "2020-01-01", 10, 3);

-- BNP Paribas opera en Francia, España, Alemania, Paises Bajos, Suiza e Italia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais) 
VALUES (1,6), (1,1), (1,3), (1, 7), (1, 8), (1, 11);

-- Crédit Agricole opera en Francia, España, Paises Bajos, Suiza, Italia y Grecia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais) 
VALUES (2,6), (2,1), (2, 7), (2, 8), (2, 11), (2,12);

-- UBS opera en Suiza, España, Reino Unido, Alemania, Paises Bajos, República Checa, Polonia y Suecia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (3, 8), (3, 1), (3, 2), (3, 3), (3, 7), (3, 5), (3, 4), (3, 10);

-- Deutsche Bank opera en todos
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12);

-- Lloyds Banking Group opera en Reino Unido, Paises Bajos y Suiza
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (5, 2), (5, 7), (5, 8);

-- Intensa Sanpaolo opera en Italia, España, Alemania, Paises Bajos, Suiza y Grecia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (6, 11), (6, 1), (6, 3), (6, 7), (6, 8), (6, 12);

-- Banco Bilbao opera en España, Alemania, Paises Bajos, Suiza, Italia y Grecia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (7, 1), (7, 3), (7, 7), (7, 8), (7, 11), (7, 12);

-- Rabobank opera en Paises Bajos, Reino Unido, Alemania, República Checa, Suiza, Noruega, Italia y Grecia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (8, 7), (8, 2), (8, 3), (8, 5), (8, 8), (8, 9), (8, 11), (8, 12);

-- DZ Bank opera en Alemania, Paises Bajos, Suiza e Italia
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (9, 3), (9, 7), (9, 8), (9, 11);

-- Banco Nacional Checo opera en República Checa, Alemania, Polonia, Francia y Suiza
INSERT INTO Banco_Pais (ID_Banco, ID_Pais)
VALUES (10, 5), (10, 3), (10, 4), (10, 6), (10, 8);

-- Antonio Garcia tiene cuentas 1 y 2
INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta)
VALUES (1, 1), (1, 2);

-- Maximiliam Müller tiene cuentas 3 y 4
INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta)
VALUES (2, 3), (2, 4);

-- Alexander Zelensky tiene cuentas 5 y 6
INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta)
VALUES (3, 5), (3, 6);

-- Jorge Mario tiene cuenta 10 y 13
INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta)
VALUES (8, 10), (8, 13);

-- Alex elcapo tiene cuenta 7, 8
INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta)
VALUES (9, 7), (9, 8);

-- La cuenta 9 no la tiene nadie y Marilyn Monroe, Donald Trump, Jorge Mario Bergoglio, Dalia Lama y Joanne Rowling no tienen cuentas


-- Cliente_Banco no existe porque no hay relacion N:M entre Cliente y Banco

-- INSERT INTO Cliente_Banco (ID_Cliente, ID_Banco)
-- VALUES (1, 7), 
-- (2, 4), (2,9), 
-- (3, 10), 
-- (4, 1), (4, 8), 
-- (5,3), (5,4), (5,5),
-- (6,2),
-- (7,6),
-- (8,3), (8,1),
-- (9,7),
-- (10,5);

INSERT INTO Cliente_Prestamo_Banco (ID_Cliente, ID_Prestamo, ID_Banco)
VALUES (1,1,1), (10,1,5);


INSERT INTO Empleado (Nombre, Apellido, ID_Banco) 
VALUES ("Pedro", "Martínez", 1),
       ("Carla", "Fernández", 1),
       ("Luis", "González", 2), 
       ("Angelina", "Jolie", 1), ("Ariana", "Grande", 2), 
       ("Bruce", "Willis", 3), ("Cristiano", "Ronaldo", 4), 
       ("Ed", "Sheeran", 5), ("George", "Lucas", 6), 
       ("Johnny", "Depp", 7), ("Kylian", "Mbappé", 8), 
       ("Mohamed", "bin Salmán", 9), ("Michael", "Caine", 10);

INSERT INTO Supervisor (ID_Empleado) 
VALUES (4), (9), (12);


INSERT INTO Miembro_equipo (ID_Empleado, ID_Supervisor) 
VALUES (1,1), (2,1), (3,1), -- ID_Supervisor 1 es ID_Empleado 4
(5,2), (6,2), (7,2), (8,2), -- ID_Supervisor 2 es ID_Empleado 9
(10,3), (11,3), (13,3); -- ID_Supervisor 3 es ID_Empleado 12