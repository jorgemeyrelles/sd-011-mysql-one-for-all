DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(userId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_historic INT;
SELECT
COUNT(h.song_id) AS 'quantidade_musicas_no_historico'
FROM historic AS h
WHERE h.user_id = userId INTO total_historic;
RETURN total_historic;
END $$
DELIMITER ;
