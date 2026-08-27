# Evaluación Continua — Cassandra

Material de entrega para **Bases de Datos NoSQL — Unidad 2**, tema **Familia de Columnas (Apache Cassandra)**.

Documento principal: `main.tex`.

## Estructura

- `main.tex`: archivo raíz de LaTeX.
- `secciones/`: introducción, modelado, carga, modificaciones, consultas y reflexión.
- `imagenes/capturas/`: evidencias reales de Cassandra, renombradas de forma semántica.
- `scripts/creacion.cql`: keyspace y tablas.
- `scripts/carga.cql`: importación del CSV en las dos tablas.
- `scripts/modificaciones.cql`: cinco modificaciones del punto 3.
- `scripts/consultas.cql`: Q1–Q10 tal como quedaron documentadas.
- `datos/preparar_inumet.py`: script utilizado para integrar los tres CSV públicos de INUMET.
- `references.bib`: bibliografía.

Los CSV completos no se incluyen en esta carpeta preparada para Overleaf debido a su tamaño. Fueron inspeccionados para verificar el trabajo: el archivo unificado contiene 385.668 filas, 7 estaciones y años de 2020 a 2026.

## Pendientes antes de entregar

- Completar los nombres de los integrantes en `main.tex`.
- Agregar el enlace a la presentación cuando esté disponible, si se decide incluirlo en el repositorio o documento.

## Compilación local / Overleaf

El documento utiliza `biblatex` con `biber` y estilo APA. En Overleaf, `main.tex` debe quedar seleccionado como **Main document**. El compilador recomendado es **pdfLaTeX** y la bibliografía debe procesarse con **Biber**.

Método universal de importación:

1. Descargar esta carpeta como ZIP desde GitHub (`Code` → `Download ZIP`).
2. En Overleaf: `New Project` → `Upload Project`.
3. Seleccionar el ZIP.
4. Verificar que `main.tex` sea el documento principal.
5. Recompilar.

Si una imagen no aparece, revisar que la ruta y las mayúsculas/minúsculas coincidan. Si la bibliografía no aparece, limpiar archivos auxiliares/recompilar y comprobar que Overleaf esté ejecutando Biber. Si el ZIP crea una carpeta adicional, ingresar a esa carpeta y seleccionar `main.tex` como Main document.
