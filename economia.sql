-- Crear la base de datos
CREATE DATABASE EconomiaDB;

-- Usar la base de datos creada
USE EconomiaDB;

-- Crear las tablas
CREATE TABLE Pais (
  ID_Pais INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Poblacion BIGINT
);

CREATE TABLE Banco (
  ID_Banco INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(100),
  Sede VARCHAR(100),
  ID_Pais INT,
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);

CREATE TABLE Cliente (
  ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Fecha_nacimiento DATE
);

CREATE TABLE Cuenta (
  ID_Cuenta INT PRIMARY KEY AUTO_INCREMENT,
  Tipo ENUM("Ahorros", "Corriente"),
  Balance DECIMAL(15, 2),
  ID_Cliente INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Transaccion (
  ID_Transaccion INT PRIMARY KEY AUTO_INCREMENT,
  Fecha DATE,
  Monto DECIMAL(15, 2),
  Descripcion VARCHAR(255),
  ID_Cuenta INT,
  FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta)
);

CREATE TABLE Producto (
  ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Precio DECIMAL(10, 2),
  ID_Cliente INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Empresa (
  ID_Empresa INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(100),
  Sector VARCHAR(100),
  ID_Pais INT,
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);

CREATE TABLE Empleado (
  ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Fecha_contratacion DATE,
  ID_Empresa INT,
  FOREIGN KEY (ID_Empresa) REFERENCES Empresa(ID_Empresa)
);

CREATE TABLE Divisa (
  ID_Divisa INT PRIMARY KEY AUTO_INCREMENT,
  Codigo CHAR(3),
  Tasa_cambio DECIMAL(10, 4)
);

CREATE TABLE Impuesto (
  ID_Impuesto INT PRIMARY KEY AUTO_INCREMENT,
  Tipo VARCHAR(100),
  Tasa DECIMAL(5, 2)
);

CREATE TABLE Prestamo (
  ID_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
  Monto DECIMAL(15, 2),
  Fecha_inicio DATE,
  Fecha_vencimiento DATE,
  ID_Cliente INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Insertar datos de ejemplo
INSERT INTO Pais (Nombre, Poblacion, ID_Pais)
VALUES ("España", 47, 1), ("Reino Unido", 67, 2);

INSERT INTO Banco (Nombre, Sede, ID_Pais) -- ID_Pais es la clave foránea creo que no es necesario ponerlo en el insert porque ya se puso en la tabla
VALUES ("Santander", "Boadilla del Monte", 1), ("Barclays", "Londres", 2);

INSERT INTO Cliente (Nombre, Apellido, Fecha_nacimiento, ID_Cliente) -- ID_Cliente es la clave primaria
VALUES ("Juan", "Pérez", "1985-01-15", 1), ("Ana", "García", "1990-06-22", 2);

INSERT INTO Cuenta (Tipo, Balance, ID_Cliente) --
VALUES ("Ahorros", 1500.00, 1), ("Corriente", 500.00, 1), ("Ahorros", 2000.00, 2);

INSERT INTO Transaccion (Fecha, Monto, Descripcion, ID_Cuenta)
VALUES ("2023-03-01", 100.00, "Pago de factura", 1),
       ("2023-03-05", 250.00, "Compra en supermercado", 2),
       ("2023-03-10", 300.00, "Transferencia a otro banco", 3);

INSERT INTO Producto (Nombre, Precio, ID_Cliente)
VALUES ("", 50.00, 1), ("Producto B", 75.00, 2);

INSERT INTO Empresa (Nombre, Sector, ID_Pais)
VALUES ("Telefonica", "Tecnología", 1), ("Empresa B", "Salud", 2);

INSERT INTO Empleado (Nombre, Apellido, Fecha_contratacion, ID_Empresa)
VALUES ("Pedro", "Martínez", "2015-01-01", 1),
       ("Carla", "Fernández", "2018-05-01", 1),
       ("Luis", "González", "2016-09-01", 2);

INSERT INTO Divisa (Codigo, Tasa_cambio)
VALUES ("USD", 1.0000), ("EUR", 1.1000);

INSERT INTO Impuesto (Tipo, Tasa)
VALUES ("IVA", 21.00), ("Impuesto sobre la renta", 15.00);

INSERT INTO Prestamo (Monto, Fecha_inicio, Fecha_vencimiento, ID_Cliente)
VALUES (5000.00, "2023-01-01", "2025-01-01", 1), (10000.00, "2023-02-01", "2027-02-01", 2);

--Genera por cada tabla 10 registros
INSERT INTO Pais (Nombre, Poblacion) 
VALUES ("Pais A", 100), ("Pais B", 200), ("Pais C", 300), ("Pais D", 400), ("Pais E", 500), ("Pais F", 600), ("Pais G", 700), ("Pais H", 800), ("Pais I", 900), ("Pais J", 1000);
INSERT INTO Banco (Nombre, Sede, ID_Pais) 
VALUES ("Banco A", "Sede A", 1), ("Banco B", "Sede B", 2), ("Banco C", "Sede C", 3), ("Banco D", "Sede D", 4), ("Banco E", "Sede E", 5), ("Banco F", "Sede F", 6), ("Banco G", "Sede G", 7), ("Banco H", "Sede H", 8), ("Banco I", "Sede I", 9), ("Banco J", "Sede J", 10);
INSERT INTO Cliente (Nombre, Apellido, Fecha_nacimiento) 
VALUES ("Cliente A", "Apellido A", "2020-01-01"), ("Cliente B", "Apellido B", "2020-01-01"), ("Cliente C", "Apellido C", "2020-01-01"), ("Cliente D", "Apellido D", "2020-01-01"), ("Cliente E", "Apellido E", "2020-01-01"), ("Cliente F", "Apellido F", "2020-01-01"), ("Cliente G", "Apellido G", "2020-01-01"), ("Cliente H", "Apellido H", "2020-01-01"), ("Cliente I", "Apellido I", "2020-01-01"), ("Cliente J", "Apellido J", "2020-01-01");
INSERT INTO Cuenta (Tipo, Balance, ID_Cliente) 
VALUES ("Ahorros", 100, 1), ("Corriente", 200, 2), ("Ahorros", 300, 3), ("Corriente", 400, 4), ("Ahorros", 500, 5), ("Corriente", 600, 6), ("Ahorros", 700, 7), ("Corriente", 800, 8), ("Ahorros", 900, 9), ("Corriente", 1000, 10);
INSERT INTO Transaccion (Fecha, Monto, Descripcion, ID_Cuenta) 
VALUES ("2020-01-01", 100, "Descripcion A", 1), ("2020-01-01", 200, "Descripcion B", 2), ("2020-01-01", 300, "Descripcion C", 3), ("2020-01-01", 400, "Descripcion D", 4), ("2020-01-01", 500, "Descripcion E", 5), ("2020-01-01", 600, "Descripcion F", 6), ("2020-01-01", 700, "Descripcion G", 7), ("2020-01-01", 800, "Descripcion H", 8), ("2020-01-01", 900, "Descripcion I", 9), ("2020-01-01", 1000, "Descripcion J", 10);
INSERT INTO Producto (Nombre, Precio, ID_Cliente) 
VALUES ("Producto A", 100, 1), ("Producto B", 200, 2), ("Producto C", 300, 3), ("Producto D", 400, 4), ("Producto E", 500, 5), ("Producto F", 600, 6), ("Producto G", 700, 7), ("Producto H", 800, 8), ("Producto I", 900, 9), ("Producto J", 1000, 10);
INSERT INTO Empresa (Nombre, Sector, ID_Pais) 
VALUES ("Empresa A", "Sector A", 1), ("Empresa B", "Sector B", 2), ("Empresa C", "Sector C", 3), ("Empresa D", "Sector D", 4), ("Empresa E", "Sector E", 5), ("Empresa F", "Sector F", 6), ("Empresa G", "Sector G", 7), ("Empresa H", "Sector H", 8), ("Empresa I", "Sector I", 9), ("Empresa J", "Sector J", 10);
INSERT INTO Empleado (Nombre, Apellido, Fecha_contratacion, ID_Empresa) 
VALUES ("Empleado A", "Apellido A", "2020-01-01", 1), ("Empleado B", "Apellido B", "2020-01-01", 2), ("Empleado C", "Apellido C", "2020-01-01", 3), ("Empleado D", "Apellido D", "2020-01-01", 4), ("Empleado E", "Apellido E", "2020-01-01", 5), ("Empleado F", "Apellido F", "2020-01-01", 6), ("Empleado G", "Apellido G", "2020-01-01", 7), ("Empleado H", "Apellido H", "2020-01-01", 8), ("Empleado I", "Apellido I", "2020-01-01", 9), ("Empleado J", "Apellido J", "2020-01-01", 10);
INSERT INTO Divisa (Codigo, Tasa_cambio) 
VALUES ("Divisa A", 100), ("Divisa B", 200), ("Divisa C", 300), ("Divisa D", 400), ("Divisa E", 500), ("Divisa F", 600), ("Divisa G", 700), ("Divisa H", 800), ("Divisa I", 900), ("Divisa J", 1000);
INSERT INTO Impuesto (Tipo, Tasa) 
VALUES ("Impuesto A", 100), ("Impuesto B", 200), ("Impuesto C", 300), ("Impuesto D", 400), ("Impuesto E", 500), ("Impuesto F", 600), ("Impuesto G", 700), ("Impuesto H", 800), ("Impuesto I", 900), ("Impuesto J", 1000);
INSERT INTO Prestamo (Monto, Fecha_inicio, Fecha_vencimiento, ID_Cliente)
VALUES (100, "2020-01-01", "2020-01-01", 1), (200, "2020-01-01", "2020-01-01", 2), (300, "2020-01-01", "2020-01-01", 3), (400, "2020-01-01", "2020-01-01", 4), (500, "2020-01-01", "2020-01-01", 5), (600, "2020-01-01", "2020-01-01", 6), (700, "2020-01-01", "2020-01-01", 7), (800, "2020-01-01", "2020-01-01", 8), (900, "2020-01-01", "2020-01-01", 9), (1000, "2020-01-01", "2020-01-01", 10);