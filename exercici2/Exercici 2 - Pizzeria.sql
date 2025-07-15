DROP TABLE IF EXISTS zone;

use pizzeria;
create table zone (
id int primary key auto_increment ,
name varchar(100)
);

create table city (
id int primary key auto_increment ,
name varchar (100) not null ,
id_zone int,
foreign key(id_zone) references zone (id) 
);

create table client (
id int primary key auto_increment,
name varchar (100) not null ,
surname varchar (100) not null ,
direction varchar (255) not null ,
postal_code varchar (10),
id_city int,
id_zone int,
phone varchar(20),
foreign key (id_city) references city(id),
foreign key (id_zone) references zone(id)
);
create table shop (
id int primary key auto_increment ,
direction varchar (255) ,
postal_code varchar (15) ,
id_city int ,
id_zone int ,
foreign key (id_city) references city(id),
foreign key (id_zone) references zone(id)
);

create table worker (
id int primary key auto_increment,
name varchar(120)not null,
surname varchar ( 150) not null,
nif varchar( 100) not null,
phone varchar (20) not null,
rol enum ('cuiner' , 'repartidor') not null,
id_shop int,
foreign key (id_shop) references shop(id)
);

create table classes (
id int primary key auto_increment,
name varchar(120)not null
);

create table product (
id int primary key auto_increment,
name varchar(120)not null,
description text,
picture varchar (255),
price decimal(6,2)not null,
id_classes int not null,
foreign key (id_classes) references classes(id)
);

create table sales ( 
id int primary key auto_increment,
id_client int,
id_shop int,
date_time datetime,
to_take_away enum ('Domicili','Recollir')not null,
price_total decimal(8,2),
id_worker int,
deliver datetime,
FOREIGN KEY (id_client) REFERENCES client(id),
FOREIGN KEY (id_shop) REFERENCES shop(id),
FOREIGN KEY (id_worker) REFERENCES worker(id)
);
insert into classes (name ) values
('pizza'),('burger'),('drink');
insert into product ( name, description, picture, price, id_classes)
values
('Pizza Barbacoa', 'Pizza amb salsa barbacoa, mozzarella i pollastre', 'pizza_bbq.jpg', 12.90, 1),
('Pizza Vegetal', 'Pizza amb verdures de temporada', 'pizza_vegetal.jpg', 10.50, 1),
('Hamburguesa Clàssica', 'Hamburguesa amb enciam, tomàquet i formatge', 'burguer_classic.jpg', 9.80, 2),
('Hamburguesa Vegana', 'Hamburguesa vegetal amb salsa casolana', 'burguer_vegan.jpg', 10.40, 2),
('Aigua mineral', 'Ampolla d’aigua 500ml', 'aigua.jpg', 1.50, 3),
('Coca-Cola', 'Llauna de refresc de cola 330ml', 'coca_cola.jpg', 2.00, 3);
















