DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
use youtube;

create table users (
email varchar(200) primary key,
password varchar(200) not null,
name_user varchar (100),
birthday date,
sex enum ('M','F','Other'),
country varchar (30),
postal_code varchar(20)
);

create table videos (
id int auto_increment primary key,
title varchar (100),
description text,
size decimal(10,2),
folder_name varchar(100),
length time,
thumbnail varchar(255),
reproductions int default 0,
likes int default 0,
dislikes int default 0,
state enum ('public', 'ocult','privat'),
email_user varchar(200),
publication_date  datetime,
foreign key(email_user) references users(email)
);
create table tags(
id int auto_increment primary key,
name varchar(100) unique
);
create table video_tags (
id_video int,
id_tag int,
primary key (id_video ,id_tag),
foreign key (id_video) references videos(id),
FOREIGN KEY (id_tag) references tags(id)
);
create table channels(
id int auto_increment primary key,
name varchar(200),
description text,
date_creation date,
email_user varchar(100),
foreign key (email_user) references users(email)
);
CREATE TABLE subscriptions (
email_subscriptor VARCHAR(200),
id_channel INT,
date_subscription DATETIME,
PRIMARY KEY (email_subscriptor, id_channel),
FOREIGN KEY (email_subscriptor) REFERENCES users(email),
FOREIGN KEY (id_channel) REFERENCES channels(id)
);
create table video_likes(
id_video int,
email_user varchar(100),
class enum('like','dislike'),
date datetime,
PRIMARY KEY (id_video, email_user),
FOREIGN KEY (id_video) REFERENCES videos(id),
FOREIGN KEY (email_user) REFERENCES users(email)
);

create table playlists(
id int auto_increment primary key,
name varchar(200),
date_creation date,
state enum('public','private'),
email_user varchar(100),
foreign key (email_user) references users(email)
);
create table playlist_videos (
id_playlist int,
id_video int,
primary key (id_playlist, id_video),
foreign key(id_playlist)references playlists(id),
foreign key (id_video) references videos(id)
);
create table comments (
id int auto_increment primary key,
id_video int,
email_user varchar(200),
text text,
date datetime,
foreign key (id_video) references videos(id),
foreign key(email_user) references users(email)
);
CREATE TABLE comments_likes (
id_comment INT,
email_user VARCHAR(200),
class ENUM('like', 'dislike'),
date DATETIME,
PRIMARY KEY (id_comment, email_user),
FOREIGN KEY (id_comment) REFERENCES comments(id),
FOREIGN KEY (email_user) REFERENCES users(email)
);
insert into users (email, password, name_user, birthday, sex, country, postal_code)
values
('carlos@example.com', '1234secure', 'Carlos', '1995-07-15', 'M', 'España', '08001'),
('laura@example.com', 'pass456', 'Laura', '1998-04-02', 'F', 'España', '08002'
);
INSERT INTO channels (name, description, date_creation, email_user)
VALUES ('CarlosVlogs', 'Vlogs sobre viajes y curiosidades', '2024-01-10', 'carlos@example.com'
);
INSERT INTO videos (title, description, size, folder_name, length, thumbnail, state, email_user, publication_date)
VALUES (
  'Mi primer vlog',
  'Explorando el centro histórico de Barcelona',
  105.55,
  'vlog01.mp4',
  '00:10:30',
  'thumb01.jpg',
  'public',
  'carlos@example.com',
  NOW()
  );
INSERT INTO tags (name) VALUES ('viajes'), ('Barcelona'), ('vlog');

INSERT INTO video_tags (id_video, id_tag)
VALUES 
(1, 1), 
(1, 2), 
(1, 3); 

INSERT INTO playlists (name, date_creation, state, email_user)
VALUES ('Mis favoritos', '2025-07-01', 'public', 'laura@example.com');

INSERT INTO playlist_videos (id_playlist, id_video)
VALUES (1, 1);

INSERT INTO video_likes (id_video, email_user, class, date)
VALUES (1, 'laura@example.com', 'like', NOW());

INSERT INTO comments (id_video, email_user, text, date)
VALUES (1, 'laura@example.com', '¡Muy buen vídeo, Carlos!', NOW());

INSERT INTO comments_likes (id_comment, email_user, class, date)
VALUES (1, 'carlos@example.com', 'like', NOW());