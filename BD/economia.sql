-- Crear la base de datos
CREATE DATABASE EconomiaDB_prueba;

-- Usar la base de datos creada
USE EconomiaDB_prueba;

-- Crear las tablas
CREATE TABLE Pais (
  ID_Pais INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50), -- 50 caracteres
  Poblacion DECIMAL(10, 2) -- 10 dígitos (antes de la coma), 2 decimales (después de la coma)
  ID_Divisa INT,
  FOREIGN KEY (ID_Divisa) REFERENCES Divisa(ID_Divisa)
);


CREATE TABLE Banco (
  ID_Banco INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(100),
  Sede VARCHAR(100)
);

CREATE TABLE Banco_Pais (
  ID_Banco_Pais INT PRIMARY KEY AUTO_INCREMENT,
  ID_Banco INT,
  ID_Pais INT,
  FOREIGN KEY (ID_Banco) REFERENCES Banco(ID_Banco), -- ON DELETE SET NULL? no me queda claro qué hace
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);

CREATE TABLE Divisa (
  ID_Divisa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Codigo VARCHAR(8),
  Tasa_cambio DECIMAL(10, 4)
);

CREATE TABLE Cliente (
  ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  Fecha_nacimiento DATE
);

CREATE TABLE Cuenta (
  ID_Cuenta INT PRIMARY KEY AUTO_INCREMENT,
  Tipo ENUM("Ahorros", "Corriente"), -- Mirar qué es lo de tipo ENUM
  Balance DECIMAL(15, 2),
  ID_Banco INT,
  ID_Divisa INT,
  FOREIGN KEY (ID_Banco) REFERENCES Banco(ID_Banco),
  FOREIGN KEY (ID_Divisa) REFERENCES Divisa(ID_Divisa)

);

CREATE TABLE Transaccion (
  ID_Transaccion INT PRIMARY KEY AUTO_INCREMENT,
  Fecha DATE,
  Monto DECIMAL(15, 2),
  Descripcion VARCHAR(255),
  ID_Cuenta INT,
  ID_Divisa INT,
  FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta),
  FOREIGN KEY (ID_Divisa) REFERENCES Divisa(ID_Divisa)
);

-- Por cada operación hay dos transacciones que están relacionadas. La operación de quien manda dinero (monto negativo)
-- y la operación de quien recibe dinero (monto positivo).


CREATE TABLE Cliente_Cuenta (
  ID_Cliente_Cuenta INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cliente INT,
  ID_Cuenta INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (ID_Cuenta) REFERENCES Cuenta(ID_Cuenta)
);

CREATE TABLE Prestamo (
  ID_Prestamo INT PRIMARY KEY AUTO_INCREMENT,
  Monto DECIMAL(15, 2),
  Fecha_inicio DATE,
  Fecha_vencimiento DATE,
  ID_Cliente INT,
  ID_Divisa INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (ID_Divisa) REFERENCES Divisa(ID_Divisa)
);

CREATE TABLE Cliente_Prestamo_Banco (
  ID_Cliente_Prestamo_Banco INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cliente INT,
  ID_Prestamo INT,
  ID_Banco INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (ID_Prestamo) REFERENCES Prestamo(ID_Prestamo),
  FOREIGN KEY (ID_Banco) REFERENCES Banco(ID_Banco)
);

CREATE TABLE Cliente_Banco (
  ID_Cliente_Banco INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cliente INT,
  ID_Banco INT,
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (ID_Banco) REFERENCES Banco(ID_Banco)
);

CREATE TABLE Empleado (
  ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  ID_Banco INT,
  FOREIGN KEY (ID_Banco) REFERENCES Banco(ID_Banco)
);

-- Relación jerárquica entre supervisor y empleado
CREATE TABLE Supervisor (
  ID_Supervisor INT PRIMARY KEY AUTO_INCREMENT,
  ID_Empleado INT,
  FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Miembro_equipo (
  ID_Miembro_equipo INT PRIMARY KEY AUTO_INCREMENT,
  ID_Empleado INT,
  ID_Supervisor INT,
  FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado),
  FOREIGN KEY (ID_Supervisor) REFERENCES supervisor(ID_Supervisor)
);

-- Pasar de aquí a tablas en mysql workbench (reverse engeneering)