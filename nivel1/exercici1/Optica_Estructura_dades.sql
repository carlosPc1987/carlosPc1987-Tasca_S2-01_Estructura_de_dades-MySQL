
CREATE DATABASE Optica_Carlos;

USE Optica_Carlos;

CREATE TABLE Proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    calle VARCHAR(100),
    numero VARCHAR(10),
    piso VARCHAR(10),
    puerta VARCHAR(10),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    pais VARCHAR(50),
    telefono VARCHAR(20),
    fax VARCHAR(20),
    nif VARCHAR(20)
);

CREATE TABLE Gafa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    graduacion_izq DECIMAL(4,2),
    graduacion_der DECIMAL(4,2),
    tipo_montura ENUM('flotante', 'pasta', 'metálica'),
    color_montura VARCHAR(30),
    color_vidrio_izq VARCHAR(30),
    color_vidrio_der VARCHAR(30),
    precio DECIMAL(8,2),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(id)
);

CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    email VARCHAR(100),
    fecha_registro DATE,
    recomendado_por INT,
    FOREIGN KEY (recomendado_por) REFERENCES Cliente(id)
);

CREATE TABLE Venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    empleado_id INT,
    gafa_id INT,
    fecha_venta DATE,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(id),
    FOREIGN KEY (gafa_id) REFERENCES Gafa(id)
);

INSERT INTO Proveedor (nombre, calle, numero, piso, puerta, ciudad, codigo_postal, pais, telefono, fax, nif)
VALUES 
('Ópticas S.A.', 'Gran Via', '123', '2', 'A', 'Barcelona', '08010', 'España', '934567890', '934567891', 'B12345678'),
('Visión Global', 'Avenida Diagonal', '456', '3', 'B', 'Barcelona', '08018', 'España', '932112233', '932112234', 'B87654321');

INSERT INTO Gafa (marca, graduacion_izq, graduacion_der, tipo_montura, color_montura, color_vidrio_izq, color_vidrio_der, precio, proveedor_id)
VALUES
('RayBan', 1.25, 1.50, 'metálica', 'negro', 'gris', 'gris', 129.99, 1),
('Oakley', 0.75, 0.75, 'pasta', 'azul', 'transparente', 'transparente', 149.50, 2);

INSERT INTO Empleado (nombre)
VALUES 
('Laura Martínez'),
('David López');

INSERT INTO Cliente (nombre, direccion, telefono, email, fecha_registro, recomendado_por)
VALUES 
('Carlos Pérez', 'Passeig Marítim 25, Castelldefels', '678901234', 'carlos@example.com', '2025-07-28', NULL),
('Lucía Gómez', 'Carrer del Sol 8, Gavà', '612345678', 'lucia@example.com', '2025-07-15', 1),
('Elena Martín', 'Av. de la Platja 12, Sitges', '610111222', 'elena@example.com', '2025-07-20', 2);

INSERT INTO Venta (cliente_id, empleado_id, gafa_id, fecha_venta)
VALUES 
(1, 1, 1, '2025-07-28'),
(2, 2, 2, '2025-07-27');