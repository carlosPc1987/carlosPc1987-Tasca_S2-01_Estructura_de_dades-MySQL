CREATE TABLE zone (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE city (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    id_zone INT,
    FOREIGN KEY (id_zone) REFERENCES zone(id)
);

CREATE TABLE provider (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    street VARCHAR(100),
    number VARCHAR(10),
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(100),
    postal_code VARCHAR(6),
    country VARCHAR(100),
    phone_number VARCHAR(15),
    fax VARCHAR(15),
    nif VARCHAR(20)
);

CREATE TABLE glasses (
    id INT PRIMARY KEY,
    id_provider INT,
    brand VARCHAR(100),
    lens_power VARCHAR(10),
    eyeglass_frame ENUM('metal', 'plastic', 'wood', 'other'), -- ajusta valores si tienes otros
    color_frame VARCHAR(50),
    color_glass VARCHAR(50),
    price DECIMAL(10,2),
    FOREIGN KEY (id_provider) REFERENCES provider(id)
);

CREATE TABLE client (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    postal_code VARCHAR(10),
    phone_number VARCHAR(15),
    mail VARCHAR(200),
    register_date TIMESTAMP,
    id_referer INT,
    FOREIGN KEY (id_referer) REFERENCES client(id)
);

CREATE TABLE worker (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE sales (
    id INT PRIMARY KEY,
    id_client INT,
    id_glasses INT,
    id_worker INT,
    sales_date TIMESTAMP,
    FOREIGN KEY (id_client) REFERENCES client(id),
    FOREIGN KEY (id_glasses) REFERENCES glasses(id),
    FOREIGN KEY (id_worker) REFERENCES worker(id)
);