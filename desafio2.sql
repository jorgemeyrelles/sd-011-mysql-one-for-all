CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(*) FROM songs) AS 'cancoes',
(SELECT COUNT(*) FROM artists) AS 'artistas',
(SELECT COUNT(*) FROM album) AS 'albuns';
