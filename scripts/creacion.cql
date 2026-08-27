CREATE KEYSPACE IF NOT EXISTS inumet
WITH REPLICATION = {
  'class': 'SimpleStrategy',
  'replication_factor': 1
};

USE inumet;

CREATE TABLE IF NOT EXISTS mediciones_por_estacion_mes (
  estacion_id TEXT,
  anio INT,
  mes INT,
  fecha_hora TIMESTAMP,
  temp_aire FLOAT,
  hum_relativa INT,
  precip_horario FLOAT,
  PRIMARY KEY ((estacion_id, anio, mes), fecha_hora)
)
WITH CLUSTERING ORDER BY (fecha_hora ASC);

CREATE TABLE IF NOT EXISTS mediciones_por_mes (
  anio INT,
  mes INT,
  estacion_id TEXT,
  fecha_hora TIMESTAMP,
  temp_aire FLOAT,
  hum_relativa INT,
  precip_horario FLOAT,
  PRIMARY KEY ((anio, mes), estacion_id, fecha_hora)
)
WITH CLUSTERING ORDER BY (estacion_id ASC, fecha_hora ASC);
