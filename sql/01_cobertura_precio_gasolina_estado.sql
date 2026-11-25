-- 01_cobertura_precio_gasolina_estado.sql
-- Propósito: conocer cuántos registros, estados y fechas distintas tiene
-- precio_gasolina_estado, para verificar su cobertura.
-- Hallazgo: 20,000 filas, 32 estados y 209 fechas (todas de 1981).
SELECT count(*),
       count(DISTINCT cve_ent) AS estados,
       count(DISTINCT fecha) AS fechas
FROM precio_gasolina_estado;

