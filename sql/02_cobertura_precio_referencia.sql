-- 02_cobertura_precio_referencia.sql
-- Propósito: conocer el periodo, el número de registros y el rango de precios
-- de precio_referencia
-- Hallazgo: 16,802 registros, uno por día, del 1981-01-01 al 2027-01-01.
-- Los precios sí varían (magna 0.01-0.10, diesel 0.01-0.08, USD/MXN 0.0269-60.9999),
-- pero la fecha final es posterior a la fecha de consulta (24/11/2026).

SELECT min(fecha) AS fecha_inicial,
       max(fecha) AS fecha_final,
       count(*) AS registros,
       count(DISTINCT fecha) AS dias_distintos,
       min(gasolina_magna) AS magna_min,
       max(gasolina_magna) AS magna_max,
       min(diesel) AS diesel_min,
       max(diesel) AS diesel_max,
       min(usd_mxn) AS usd_min,
       max(usd_mxn) AS usd_max
FROM precio_referencia;
