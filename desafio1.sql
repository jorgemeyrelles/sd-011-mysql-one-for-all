CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor_plano DOUBLE
);

CREATE TABLE artistas(
artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios(
usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(100) NOT NULL,
idade TINYINT,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE albuns(
album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE cancoes(
cancao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns (album_id),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE historico_reproducoes(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
);

CREATE TABLE seguindo_artistas(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
);

INSERT INTO planos(plano, valor_plano)
VALUES
('gratuito', 0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO artistas(artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO usuarios(usuario, idade, plano_id)
VALUES
('Thati',23,1),
('Cintia',35,3),
('Bill',20,2),
('Roger',45,1);

INSERT INTO albuns(album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(cancao, artista_id, album_id)
VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 1, 2),
('Time Fireworks', 1, 2),
('Magic Circus', 2, 3),
('Honey, So Do I', 2, 3),
("Sweetie, Let's Go Wild", 2, 3),
('She Knows', 2, 3),
('Fantasy For Me', 3, 4),
('Celebration Of More', 3, 4),
('Rock His Everything', 3, 4),
('Home Forever', 3, 4),
('Diamond Power', 3, 4),
("Honey, Let's Be Silly", 3, 4),
('Thang Of Thunder', 4, 5),
('Words Of Her Life', 4, 5),
('Without My Streets', 4, 5);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

INSERT INTO historico_reproducoes(usuario_id, cancao_id)
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
