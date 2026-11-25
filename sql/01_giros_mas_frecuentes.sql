-- 01_giros_mas_frecuentes.sql
-- Propósito:Identificar los 30 giros con mas establecimientos en Baja Californa, Sonora, Sinaloa, Durando y Chihuahua. 

SELECT codigo_act, nombre_act, count(*)
FROM denue_inegi_oficial
WHERE cve_ent IN (2, 8, 10, 25, 26)
GROUP BY codigo_act, nombre_act
ORDER BY count(*) DESC
LIMIT 30;
