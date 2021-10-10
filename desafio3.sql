CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.user_name AS 'usuario',
s.song_name AS 'nome'
FROM historic AS h
INNER JOIN users AS u
ON h.user_id = u.id
INNER JOIN songs AS s
ON h.song_id = s.id
ORDER BY `usuario`, `nome`;
