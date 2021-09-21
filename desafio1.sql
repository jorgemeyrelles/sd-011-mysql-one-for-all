DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscription(
subscription_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
subscription_price DECIMAL(4,2) NOT NULL
) engine = InnoDB;

INSERT INTO subscription(title, subscription_price)
VALUES
("Gratuito", 0.00),
("Universitário", 5.99),
("Familiar", 7.99);

CREATE TABLE user(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
subscription_id INT NOT NULL,
FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id)
) engine = InnoDB;

INSERT INTO user(name, age, subscription_id)
VALUES
("Thati", 23, 1),
("Cintia", 35, 2),
("Bill", 20, 3),
("Roger", 45, 1);
    
CREATE TABLE artist(
artist_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO artist(name)
VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon");
    
CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

INSERT INTO album(title, artist_id)
VALUES
("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);
    
CREATE TABLE song(
song_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(album_id),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

INSERT INTO song (title, album_id, artist_id)
VALUES
("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 2, 1),
("Time Fireworks", 2, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let’s Go Wild",	3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everything", 4, 3),
("Home Forever", 4,	3),
("Diamond Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

CREATE TABLE rep_history(
user_id INT NOT NULL,
song_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(user_id, song_id),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (song_id) REFERENCES song(song_id)
) engine = InnoDB;

INSERT INTO rep_history(user_id, song_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

CREATE TABLE follower(
user_id INT NOT NULL,
artist_id INT NOT NULL,
CONSTRAINT PRIMARY KEY (user_id, artist_id),
FOREIGN KEY(user_id) REFERENCES user(user_id),
FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
) engine = InnoDB;

INSERT INTO follower(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
