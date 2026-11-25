
-- Propósito: ranking de los 15 municipios con más panaderías únicas.
-- Hallazgo: Tijuana (399), Hermosillo (380) y Culiacán (329) lideran;
-- Hermosillo y Culiacán concentran 709 panaderías sin centro de la empresa.
SELECT entidad, municipio, count(DISTINCT clee) AS panaderias_unicas
FROM denue_inegi_oficial
WHERE codigo_act = 311812
  AND cve_ent IN (2, 8, 10, 25, 26)
GROUP BY entidad, municipio
ORDER BY panaderias_unicas DESC
LIMIT 15;
