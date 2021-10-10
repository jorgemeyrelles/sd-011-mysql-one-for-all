DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nameOfArtist VARCHAR(50))

BEGIN
SELECT
ar.artist_name AS 'artista',
al.album_name AS 'album'
FROM album AS al
INNER JOIN artists AS ar
ON al.artist_id = ar.id
WHERE ar.artist_name LIKE nameOfArtist
ORDER BY `album`;
END $$
DELIMITER ;
