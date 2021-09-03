USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_musics INT;
SELECT COUNT(*) FROM SpotifyClone.historico_de_reproducoes
WHERE usuario_id = user_id INTO total_musics;
RETURN total_musics;
END $$
DELIMITER ;
