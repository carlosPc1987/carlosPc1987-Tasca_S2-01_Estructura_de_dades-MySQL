-- Create database and use it
CREATE DATABASE OpticsDB;
USE OpticsDB;

-- SUPPLIER
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Supplier (supplier_id, name) VALUES
(1, 'VisionLab'),
(2, 'Optical Iberia'),
(3, 'LensCraft');

-- GLASSES
CREATE TABLE Glasses (
    id INT PRIMARY KEY,
    brand VARCHAR(50),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

INSERT INTO Glasses (id, brand, supplier_id) VALUES
(101, 'Ray-Ban', 1),
(102, 'Oakley', 2),
(103, 'Tom Ford', 2),
(104, 'Persol', 3),
(105, 'Gucci', 1);

-- EMPLOYEE
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Employee (id, name) VALUES
(1, 'Laura Martinez'),
(2, 'Carlos Gomez'),
(3, 'Ana Morales');

-- CUSTOMER
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Customer (id, name) VALUES
(1, 'Maria Perez'),
(2, 'Joan Torres'),
(3, 'Lucía Ramos'),
(4, 'Pablo Rivera');

-- SALES
CREATE TABLE Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_client INT,
    id_glasses INT,
    id_worker INT,
    sales_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_client) REFERENCES Customer(id),
    FOREIGN KEY (id_glasses) REFERENCES Glasses(id),
    FOREIGN KEY (id_worker) REFERENCES Employee(id)
);

INSERT INTO Sales (id_client, id_glasses, id_worker, sales_date) VALUES
(1, 101, 1, '2025-07-01'),
(2, 103, 2, '2025-07-05'),
(3, 102, 1, '2025-07-10'),
(1, 104, 3, '2025-07-15'),
(2, 105, 2, '2025-07-20'),
(4, 101, 1, '2025-07-25'),
(3, 103, 3, '2025-07-28');