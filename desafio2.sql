CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(id_cancao) FROM SpotifyClone.cancao) AS cancao,
(SELECT COUNT(id_artista) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(id_album) FROM SpotifyClone.albuns) AS albuns;
