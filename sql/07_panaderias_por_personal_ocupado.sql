
-- Propósito: distribución de panaderías por rango de personal ocupado.
-- Hallazgo: 4,168 de 4,879 panaderías (85.4%) tienen de 0 a 5 personas;
-- solo 16 tienen más de 50.
SELECT per_ocu, count(DISTINCT clee) AS panaderias_unicas
FROM denue_inegi_oficial
WHERE codigo_act = 311812
  AND cve_ent IN (2, 8, 10, 25, 26)
GROUP BY per_ocu
ORDER BY panaderias_unicas DESC;
