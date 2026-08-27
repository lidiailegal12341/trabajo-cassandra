USE inumet;

COPY mediciones_por_estacion_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
)
FROM '/tmp/inumet_completo.csv'
WITH HEADER = TRUE
AND NULL = '';

COPY mediciones_por_mes (
  estacion_id, anio, mes, fecha_hora,
  temp_aire, hum_relativa, precip_horario
)
FROM '/tmp/inumet_completo.csv'
WITH HEADER = TRUE
AND NULL = '';
