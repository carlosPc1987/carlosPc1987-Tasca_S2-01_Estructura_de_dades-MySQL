--  Crear base de datos
CREATE DATABASE PizzeriaDB;
USE PizzeriaDB;

-- Provinces
CREATE TABLE Province (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Province VALUES
(1, 'Barcelona'),
(2, 'Madrid');

--  Towns
CREATE TABLE Town (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES Province(id)
);

INSERT INTO Town VALUES
(1, 'Barcelona', 1),
(2, 'Badalona', 1),
(3, 'Madrid', 2);

-- 👤 Clients
CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(200),
    postal_code VARCHAR(10),
    town_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (town_id) REFERENCES Town(id)
);

INSERT INTO Client VALUES
(1, 'Laura', 'Martínez', 'Calle Mallorca 12', '08029', 1, '612345678'),
(2, 'Carlos', 'Gómez', 'Gran Via 45', '08001', 2, '622334455'),
(3, 'Ana', 'Rivas', 'Puerta del Sol 1', '28001', 3, '699887766');

--  Stores
CREATE TABLE Store (
    id INT PRIMARY KEY,
    address VARCHAR(200),
    postal_code VARCHAR(10),
    town_id INT,
    FOREIGN KEY (town_id) REFERENCES Town(id)
);

INSERT INTO Store VALUES
(1, 'Av. Diagonal 123', '08020', 1),
(2, 'Calle Mayor 5', '28001', 3);

--  Employees
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    nif VARCHAR(20),
    phone VARCHAR(20),
    role ENUM('cook', 'delivery'),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Store(id)
);

INSERT INTO Employee VALUES
(1, 'Pedro', 'Sánchez', '12345678A', '600111222', 'cook', 1),
(2, 'Lucía', 'Romero', '87654321B', '600333444', 'delivery', 1),
(3, 'Miguel', 'Lopez', '11223344C', '600555666', 'delivery', 2);

--  Categories
CREATE TABLE Category (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO Category VALUES
(1, 'Clasicas'),
(2, 'Especiales'),
(3, 'Veganas');

--  Products
CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(6,2),
    type ENUM('pizza', 'burger', 'drink'),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

INSERT INTO Product VALUES
(1, 'Margarita', 'Tomato and mozzarella', 'margarita.jpg', 8.50, 'pizza', 1),
(2, 'BBQ Burger', 'Beef burger with BBQ sauce', 'bbqburger.jpg', 9.90, 'burger', NULL),
(3, 'Coca-Cola', '330ml can', 'cocacola.jpg', 2.50, 'drink', NULL),
(4, 'Veggie Pizza', 'Vegetables and vegan cheese', 'veganpizza.jpg', 9.00, 'pizza', 3),
(5, 'Fanta', 'Orange soda 330ml', 'fanta.jpg', 2.20, 'drink', NULL);

--  Orders
CREATE TABLE FoodOrder (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_datetime DATETIME,
    delivery_method ENUM('delivery', 'pickup'),
    total_price DECIMAL(8,2),
    client_id INT,
    store_id INT,
    employee_id INT, -- delivery person if applicable
    delivery_datetime DATETIME,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (store_id) REFERENCES Store(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

INSERT INTO FoodOrder (order_datetime, delivery_method, total_price, client_id, store_id, employee_id, delivery_datetime) VALUES
('2025-07-01 13:15:00', 'delivery', 20.10, 1, 1, 2, '2025-07-01 13:45:00'),
('2025-07-02 19:00:00', 'pickup', 10.90, 2, 1, NULL, NULL),
('2025-07-03 21:10:00', 'delivery', 12.20, 3, 2, 3, '2025-07-03 21:35:00');

--  Order Details
CREATE TABLE OrderDetail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES FoodOrder(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

INSERT INTO OrderDetail (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Margarita
(1, 3, 2), -- Coca-Cola
(2, 2, 1), -- BBQ Burger
(2, 5, 1), -- Fanta
(3, 4, 1), -- Veggie Pizza
(3, 3, 1); -- Coca-Cola