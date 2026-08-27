USE inumet;

-- Q1
SELECT fecha_hora, temp_aire, hum_relativa, precip_horario
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes = 1
LIMIT 10;

-- Q2
SELECT fecha_hora, temp_aire, hum_relativa, precip_horario
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes = 1
  AND fecha_hora >= '2025-01-10 00:00:00'
  AND fecha_hora <  '2025-01-11 00:00:00';

-- Q3
SELECT estacion_id, fecha_hora, temp_aire, hum_relativa, precip_horario
FROM mediciones_por_mes
WHERE anio = 2025 AND mes = 1
LIMIT 20;

-- Q4
SELECT estacion_id, anio, mes, fecha_hora, temp_aire
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes IN (1, 2, 3)
LIMIT 30;

-- Q5
SELECT COUNT(*) AS cantidad_mediciones
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes = 1;

-- Q6
SELECT AVG(temp_aire) AS temperatura_promedio
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes = 1;

-- Q7: UPDATE con TTL
INSERT INTO mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES ('PRUEBA_UTEC_C7', 2025, 1, '2025-01-15 14:00:00', 25.0, 60, 0.0);

UPDATE mediciones_por_estacion_mes
USING TTL 60
SET temp_aire = 26.5
WHERE estacion_id = 'PRUEBA_UTEC_C7'
  AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 14:00:00';

SELECT temp_aire, TTL(temp_aire), hum_relativa, TTL(hum_relativa)
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC_C7'
  AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 14:00:00';

-- Q8
SELECT estacion_id, AVG(temp_aire) AS temperatura_promedio
FROM mediciones_por_mes
WHERE anio = 2025 AND mes = 1
GROUP BY estacion_id;

-- Q9
SELECT estacion_id, anio, mes, fecha_hora, temp_aire
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'Rocha G3' AND anio = 2025 AND mes IN (1, 2, 3)
PER PARTITION LIMIT 3;

-- Q10
BEGIN BATCH
INSERT INTO mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES ('UTEC_PRUEBA_BATCH', 2025, 1, '2025-01-15 15:30:00', 23.4, 67, 0.2);
INSERT INTO mediciones_por_mes (
  anio, mes, estacion_id, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES (2025, 1, 'UTEC_PRUEBA_BATCH', '2025-01-15 15:30:00', 23.4, 67, 0.2);
APPLY BATCH;
