-- Propósito: precio promedio anual de magna y diésel y tipo de cambio en precio_referencia.
-- Hallazgo: magna y diésel se mantienen en 0.01 hasta 2013 y suben cada año desde 2014
-- (magna 0.0146 en 2014 a 0.0906 en 2026); el dólar sube todos los años (0.03 a 57.13).
SELECT extract(year FROM fecha) AS anio,
       round(avg(gasolina_magna), 4) AS magna_prom,
       round(avg(diesel), 4) AS diesel_prom,
       round(avg(usd_mxn), 2) AS usd_prom
FROM precio_referencia
WHERE fecha <= current_date
GROUP BY 1
ORDER BY 1;
