
-- Propósito: contar panaderías únicas por estado para ver dónde se concentran los clientes.
-- Hallazgo: Sonora (1,237) y Sinaloa (1,224) concentran el 50.4% de las 4,879 panaderías;
-- Durango es el menor con 628.
SELECT cve_ent, entidad, count(DISTINCT clee) AS panaderias_unicas
FROM denue_inegi_oficial
WHERE codigo_act = 311812
  AND cve_ent IN (2, 8, 10, 25, 26)
GROUP BY cve_ent, entidad
ORDER BY panaderias_unicas DESC;
