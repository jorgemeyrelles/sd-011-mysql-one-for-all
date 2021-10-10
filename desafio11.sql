CREATE VIEW cancoes_premium AS
SELECT
s.song_name AS 'nome',
COUNT(h.user_id) AS 'reproducoes'
FROM historic AS h
INNER JOIN songs AS s
ON h.song_id = s.id
INNER JOIN users AS u
ON h.user_id = u.id
WHERE plan_id IN (2, 3)
GROUP BY `nome`
ORDER BY `nome`;
