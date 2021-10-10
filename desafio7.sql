CREATE VIEW perfil_artistas AS
SELECT
ar.artist_name AS 'artista',
al.album_name AS 'album',
COUNT(f.artist_id) AS 'seguidores'
FROM followers AS f
INNER JOIN artists AS ar
ON ar.id = f.artist_id
INNER JOIN album AS al
ON f.artist_id = al.artist_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;
