-- Propósito: estimar cuánto baja la distancia promedio (en línea recta) de las 4,879 panaderías
-- al centro más cercano si se agrega un centro nuevo en cada municipio candidato.
-- La ubicación de cada centro se aproxima con el promedio de latitud y longitud
-- de las panaderías de ese municipio.
WITH panaderias AS (
  SELECT DISTINCT ON (clee)
         clee, cve_ent, cve_mun,
         latitud::float8 AS lat, longitud::float8 AS lon
  FROM denue_inegi_oficial
  WHERE codigo_act = 311812
    AND cve_ent IN (2, 8, 10, 25, 26)
),
centros AS (
  SELECT 'Tijuana' AS nombre, 'actual' AS tipo, avg(lat) AS lat, avg(lon) AS lon
    FROM panaderias WHERE cve_ent = 2 AND cve_mun = 4
  UNION ALL
  SELECT 'Chihuahua', 'actual', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 8 AND cve_mun = 19
  UNION ALL
  SELECT 'Hermosillo', 'candidato', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 26 AND cve_mun = 30
  UNION ALL
  SELECT 'Culiacán', 'candidato', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 25 AND cve_mun = 6
  UNION ALL
  SELECT 'Durango', 'candidato', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 10 AND cve_mun = 5
  UNION ALL
  SELECT 'Cajeme', 'candidato', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 26 AND cve_mun = 18
  UNION ALL
  SELECT 'Mazatlán', 'candidato', avg(lat), avg(lon)
    FROM panaderias WHERE cve_ent = 25 AND cve_mun = 12
),
distancias AS (
  SELECT p.clee, c.nombre, c.tipo,
         6371 * 2 * asin(sqrt(
           power(sin(radians(p.lat - c.lat) / 2), 2) +
           cos(radians(c.lat)) * cos(radians(p.lat)) *
           power(sin(radians(p.lon - c.lon) / 2), 2)
         )) AS km
  FROM panaderias p
  CROSS JOIN centros c
),
actuales AS (
  SELECT clee, min(km) AS km_actual
  FROM distancias
  WHERE tipo = 'actual'
  GROUP BY clee
)
SELECT d.nombre AS candidato,
       round(avg(a.km_actual)::numeric, 1) AS km_prom_sin_centro_nuevo,
       round(avg(least(a.km_actual, d.km))::numeric, 1) AS km_prom_con_centro_nuevo,
       round((100 * (1 - avg(least(a.km_actual, d.km)) / avg(a.km_actual)))::numeric, 1) AS pct_reduccion
FROM actuales a
JOIN distancias d ON d.clee = a.clee AND d.tipo = 'candidato'
GROUP BY d.nombre
ORDER BY pct_reduccion DESC;
