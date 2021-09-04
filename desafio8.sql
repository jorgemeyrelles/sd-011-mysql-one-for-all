-- Crie uma trigger chamada trigger_usuario_delete que deve ser disparada sempre que uma pessoa usuária for excluída do banco de dados, refletindo essa exclusão em todas as tabelas que ela estiver.

-- Teste a funcionalidade correta de sua trigger, fazendo a exclusão da usuária "Thati".

-- O que será verificado:

-- Será validado se ao excluir uma pessoa usuária do banco de dados a trigger_usuario_delete é ativada e a ação de exclusão reflete em todas as tabelas em que esta pessoa está presente.

DELIMITER $$

CREATE TRIGGER `SpotifyClone.trigger_usuario_delete`
BEFORE DELETE ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.Historico WHERE usuario_id = OLD.usuario_id;
    DELETE FROM SpotifyClone.Seguidores WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
