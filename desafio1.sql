DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

INSERT INTO artists(artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE plan(
id INT PRIMARY KEY AUTO_INCREMENT,
plan_name VARCHAR(50) NOT NULL,
price DOUBLE(4, 2) NOT NULL
) engine = InnoDB;

INSERT INTO plan(plan_name, price)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age TINYINT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan(id)
) engine = InnoDB;

INSERT INTO users(user_name, age, plan_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

CREATE TABLE album(
id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(50) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

INSERT INTO album(album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE songs(
id 	INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;

INSERT INTO songs(song_name, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let''s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let''s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

CREATE TABLE historic(
user_id INT NOT NULL,
song_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (user_id, song_id),
FOREIGN KEY (song_id) REFERENCES songs(id),
FOREIGN KEY (user_id) REFERENCES users(id)
) engine = InnoDB;

INSERT INTO historic(user_id, song_id)
VALUES
(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2),
(2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);

CREATE TABLE followers(
user_id INT NOT NULL,
artist_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

INSERT INTO followers(user_id, artist_id)
VALUES
(1, 1), (1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4);
