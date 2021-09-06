DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM reproduction_history
WHERE OLD.user_id = user_id;
DELETE FROM following_artist
WHERE OLD.user_id = user_id;
END $$

DELIMITER ;
