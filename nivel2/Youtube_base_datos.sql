--  Create and select the database
CREATE DATABASE YouTubeDB;
USE YouTubeDB;

--  USERS
CREATE TABLE Users (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(100),
    name_user VARCHAR(100),
    birth_date DATE,
    gender ENUM('male', 'female', 'other'),
    country VARCHAR(100),
    postal_code VARCHAR(10)
);

INSERT INTO Users VALUES
('laura@example.com', 'pass123', 'Laura', '1990-03-15', 'female', 'Spain', '08001'),
('carlos@example.com', 'secure456', 'Carlos', '1988-07-22', 'male', 'Spain', '08002'),
('ana@example.com', 'test789', 'Ana', '1995-11-05', 'female', 'Spain', '28001');

--  VIDEOS
CREATE TABLE Videos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    description TEXT,
    size_mb DECIMAL(6,2),
    filename VARCHAR(255),
    duration_seconds INT,
    thumbnail VARCHAR(255),
    reproductions INT,
    likes INT,
    dislikes INT,
    state ENUM('public', 'hidden', 'private'),
    email_user VARCHAR(100),
    publish_datetime DATETIME,
    FOREIGN KEY (email_user) REFERENCES Users(email)
);

INSERT INTO Videos (title, description, size_mb, filename, duration_seconds, thumbnail, reproductions, likes, dislikes, state, email_user, publish_datetime) VALUES
('Intro to SQL', 'Learn SQL basics.', 50.25, 'sql_intro.mp4', 600, 'sql_thumb.jpg', 1200, 100, 4, 'public', 'laura@example.com', '2025-07-01 12:00:00'),
('Funny Cats', 'Compilation of funny cats.', 40.00, 'cats.mp4', 300, 'cats_thumb.jpg', 5000, 250, 10, 'public', 'carlos@example.com', '2025-07-02 15:30:00'),
('Deep Dive in Python', 'Advanced Python tutorial.', 120.75, 'python_deep.mp4', 1800, 'python_thumb.jpg', 300, 50, 2, 'private', 'ana@example.com', '2025-07-03 18:45:00');

-- ️ TAGS + VIDEO_TAGS
CREATE TABLE Tags (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Tags VALUES
(1, 'tutorial'),
(2, 'funny'),
(3, 'programming');

CREATE TABLE VideoTags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    video_id INT,
    tag_id INT,
    FOREIGN KEY (video_id) REFERENCES Videos(id),
    FOREIGN KEY (tag_id) REFERENCES Tags(id)
);

INSERT INTO VideoTags (video_id, tag_id) VALUES
(1, 1), (1, 3),
(2, 2),
(3, 3);

--  CHANNELS
CREATE TABLE Channels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    creation_date DATE,
    email_user VARCHAR(100),
    FOREIGN KEY (email_user) REFERENCES Users(email)
);

INSERT INTO Channels (name, description, creation_date, email_user) VALUES
('CodeWithLaura', 'Programming tutorials', '2025-01-01', 'laura@example.com'),
('CarlosTV', 'Entertainment and humor', '2025-02-01', 'carlos@example.com');

--  SUBSCRIPTIONS
CREATE TABLE Subscriptions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subscriber_email VARCHAR(100),
    channel_id INT,
    FOREIGN KEY (subscriber_email) REFERENCES Users(email),
    FOREIGN KEY (channel_id) REFERENCES Channels(id)
);

INSERT INTO Subscriptions (subscriber_email, channel_id) VALUES
('ana@example.com', 1),
('laura@example.com', 2);

--  VIDEO_LIKES
CREATE TABLE VideoLikes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email_user VARCHAR(100),
    id_video INT,
    class ENUM('like', 'dislike'),
    date DATETIME,
    FOREIGN KEY (email_user) REFERENCES Users(email),
    FOREIGN KEY (id_video) REFERENCES Videos(id)
);

INSERT INTO VideoLikes (email_user, id_video, class, date) VALUES
('ana@example.com', 1, 'like', '2025-07-01 13:00:00'),
('laura@example.com', 2, 'like', '2025-07-02 16:00:00'),
('carlos@example.com', 1, 'dislike', '2025-07-03 12:00:00');

--  PLAYLISTS + PLAYLIST_VIDEOS
CREATE TABLE Playlists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    date_creation DATE,
    state ENUM('public', 'private'),
    email_user VARCHAR(100),
    FOREIGN KEY (email_user) REFERENCES Users(email)
);

INSERT INTO Playlists (name, date_creation, state, email_user) VALUES
('SQL Learning', '2025-07-01', 'public', 'laura@example.com'),
('Funny Stuff', '2025-07-02', 'private', 'carlos@example.com'),
('Python Pro', '2025-07-03', 'public', 'ana@example.com');

CREATE TABLE PlaylistVideos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_playlist INT,
    id_video INT,
    FOREIGN KEY (id_playlist) REFERENCES Playlists(id),
    FOREIGN KEY (id_video) REFERENCES Videos(id)
);

INSERT INTO PlaylistVideos (id_playlist, id_video) VALUES
(1, 1), (2, 2), (3, 3), (1, 3); -- shared video between Laura & Ana

--  COMMENTS + COMMENT_REACTIONS
CREATE TABLE Comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    text TEXT,
    date DATETIME,
    email_user VARCHAR(100),
    id_video INT,
    FOREIGN KEY (email_user) REFERENCES Users(email),
    FOREIGN KEY (id_video) REFERENCES Videos(id)
);

INSERT INTO Comments (text, date, email_user, id_video) VALUES
('Great tutorial!', '2025-07-01 14:00:00', 'ana@example.com', 1),
('Loved it!', '2025-07-01 14:05:00', 'carlos@example.com', 1);

CREATE TABLE CommentReactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email_user VARCHAR(100),
    id_comment INT,
    reaction ENUM('like', 'dislike'),
    date DATETIME,
    FOREIGN KEY (email_user) REFERENCES Users(email),
    FOREIGN KEY (id_comment) REFERENCES Comments(id)
);

INSERT INTO CommentReactions (email_user, id_comment, reaction, date) VALUES
('laura@example.com', 1, 'like', '2025-07-01 15:00:00');