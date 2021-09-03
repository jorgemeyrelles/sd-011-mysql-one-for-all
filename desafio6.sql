CREATE VIEW faturamento_atual AS
SELECT MIN(p.plano_valor) AS `faturamento_minimo`,
MAX(p.plano_valor) AS `faturamento_maximo`,
ROUND(AVG(p.plano_valor), 2) AS `faturamento_medio`,
SUM(p.plano_valor) AS `faturamento_total`
FROM spotifyclone.planos AS p
INNER JOIN spotifyclone.usuarios AS u
ON p.plano_id = u.plano_id
WHERE u.plano_id IN (1,2,3);
