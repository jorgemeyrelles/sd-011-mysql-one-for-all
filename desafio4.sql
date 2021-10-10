CREATE VIEW top_3_artistas AS
SELECT
a.artist_name AS 'artista',
COUNT(f.user_id) AS 'seguidores'
FROM followers AS f
INNER JOIN artists AS a
ON f.artist_id = a.id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
