import pandas as pd

# Leer los tres archivos originales
temperatura = pd.read_csv(
    "inumet_temperatura_del_aire.csv",
    sep=";"
)

humedad = pd.read_csv(
    "inumet_humedad_relativa.csv",
    sep=";"
)

precipitacion = pd.read_csv(
    "inumet_precipitacion_acumulada_horaria.csv",
    sep=";"
)

# Eliminar las filas vacías que vienen en los CSV
temperatura = temperatura.dropna(subset=["fecha", "estacion_id"])
humedad = humedad.dropna(subset=["fecha", "estacion_id"])
precipitacion = precipitacion.dropna(subset=["fecha", "estacion_id"])

# Convertir fecha a tipo fecha/hora
temperatura["fecha"] = pd.to_datetime(temperatura["fecha"])
humedad["fecha"] = pd.to_datetime(humedad["fecha"])
precipitacion["fecha"] = pd.to_datetime(precipitacion["fecha"])

# Unir temperatura y humedad
datos = temperatura.merge(
    humedad,
    on=["fecha", "estacion_id"],
    how="outer"
)

# Agregar precipitación
datos = datos.merge(
    precipitacion,
    on=["fecha", "estacion_id"],
    how="outer"
)

# Crear las columnas necesarias para la partition key
datos["anio"] = datos["fecha"].dt.year
datos["mes"] = datos["fecha"].dt.month

# Ordenar para dejar el CSV entendible
datos = datos.sort_values(
    ["estacion_id", "fecha"]
)

# Cambiar el nombre de fecha
datos = datos.rename(
    columns={"fecha": "fecha_hora"}
)

# Humedad es entera, pero puede haber valores ausentes
datos["hum_relativa"] = (
    datos["hum_relativa"]
    .round()
    .astype("Int64")
)

# Formato de timestamp fácil de importar en Cassandra
datos["fecha_hora"] = datos["fecha_hora"].dt.strftime(
    "%Y-%m-%d %H:%M:%S"
)

# Orden definitivo de columnas
datos = datos[
    [
        "estacion_id",
        "anio",
        "mes",
        "fecha_hora",
        "temp_aire",
        "hum_relativa",
        "precip_horario"
    ]
]

# Guardar CSV combinado
datos.to_csv(
    "inumet_completo.csv",
    index=False,
    na_rep=""
)

print("Archivo generado correctamente.")
print("Cantidad de filas:", len(datos))
print()
print(datos.head(10))
