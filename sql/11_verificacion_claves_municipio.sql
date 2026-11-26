-- Propósito: confirmar la clave (cve_mun) de los municipios candidatos y de los centros actuales,
-- porque los nombres tienen caracteres dañados y no sirven para filtrar.
SELECT DISTINCT cve_ent, cve_mun, entidad, municipio
FROM denue_inegi_oficial
WHERE (cve_ent = 2  AND cve_mun = 4)    -- Tijuana
   OR (cve_ent = 8  AND cve_mun = 19)   -- Chihuahua
   OR (cve_ent = 26 AND cve_mun = 30)   -- Hermosillo
   OR (cve_ent = 25 AND cve_mun = 6)    -- Culiacán
   OR (cve_ent = 10 AND cve_mun = 5)    -- Durango
   OR (cve_ent = 26 AND cve_mun = 18)   -- Cajeme
   OR (cve_ent = 25 AND cve_mun = 12)   -- Mazatlán
ORDER BY cve_ent, cve_mun;

