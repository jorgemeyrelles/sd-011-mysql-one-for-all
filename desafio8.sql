DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historic
WHERE user_id = OLD.id;
DELETE FROM SpotifyClone.followers
WHERE user_id = OLD.id;
END $$
DELIMITER ;
