USE inumet;

-- 1. INSERT
SELECT * FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';

INSERT INTO mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES ('PRUEBA_UTEC', 2025, 1, '2025-01-15 12:30:00', 24.5, 65, 1.2);

SELECT * FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';

-- 2. UPDATE
UPDATE mediciones_por_estacion_mes
SET temp_aire = 27.0
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';

-- 3. Sobrescritura/upsert con la misma PRIMARY KEY
INSERT INTO mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES ('PRUEBA_UTEC', 2025, 1, '2025-01-15 12:30:00', 18.0, 80, 5.5);

-- 4. INSERT USING TTL
SELECT * FROM mediciones_por_estacion_mes
WHERE estacion_id = 'UTEC_TTL' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 13:00:00';

INSERT INTO mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
) VALUES ('UTEC_TTL', 2025, 1, '2025-01-15 13:00:00', 22.0, 70, 0.5)
USING TTL 300;

SELECT estacion_id, fecha_hora, temp_aire, TTL(temp_aire)
FROM mediciones_por_estacion_mes
WHERE estacion_id = 'UTEC_TTL' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 13:00:00';

-- 5. DELETE
SELECT * FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';

DELETE FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';

SELECT * FROM mediciones_por_estacion_mes
WHERE estacion_id = 'PRUEBA_UTEC' AND anio = 2025 AND mes = 1
  AND fecha_hora = '2025-01-15 12:30:00';
