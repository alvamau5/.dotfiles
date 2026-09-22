---
name: informe-visita-obra-con-fotos
description: Genera informes de visita de obra en Word a partir de una carpeta con notas, datos del proyecto, fotos y opcionalmente una plantilla. Usa esta skill cuando el usuario pida crear, redactar o automatizar un informe de visita, reporte de obra, acta técnica de visita o resumen de obra con registro fotográfico.
---

# Informe de visita de obra con fotos

## Objetivo

Convertir una carpeta de visita de obra en un documento Word profesional, editable y listo para revisión por un arquitecto o responsable técnico.

La salida principal siempre debe ser un archivo `.docx` que incluya las fotos de la carpeta dentro del documento, no solo una descripción de ellas.

## Cuándo usar esta skill

Usa esta skill cuando el usuario pida algo como:

- "hazme un informe de visita de obra";
- "genera un reporte de obra con estas fotos";
- "convierte estas notas y fotos en un informe Word";
- "ordena la visita y prepara el correo para el cliente";
- "haz una minuta/informe técnico de visita de obra".

## Archivos de entrada esperados

Busca dentro de la carpeta de trabajo archivos como:

- `Datos_Proyecto.txt`, `datos_proyecto.docx` o similar;
- `Notas_Visita.txt`, `notas.docx`, `minuta.txt` o similar;
- carpetas llamadas `Fotos`, `Fotos_Visita`, `Imagenes`, `Registro_Fotografico` o similares;
- imágenes en `.jpg`, `.jpeg`, `.png`, `.webp`, `.heic` si están disponibles;
- una plantilla Word opcional llamada `Plantilla_Informe_Visita.docx` o similar.

Si no hay plantilla, crea el documento desde cero usando la estructura definida en esta skill.

## Reglas fundamentales

1. No inventes datos.
2. Si falta un dato, escribe `[DATO PENDIENTE]` o `No encontrado en la documentación revisada`.
3. Separa hechos observados de interpretaciones técnicas.
4. No afirmes causas de daños o patologías si solo se observan indicios. Usa expresiones como `posible`, `aparente`, `requiere verificación`.
5. No afirmes cumplimiento normativo si no hay datos suficientes.
6. Mantén un tono profesional, claro y técnico.
7. El documento debe quedar listo para revisión, no para firma automática.
8. Incluye las fotos físicamente dentro del Word, con pie de foto y nombre del archivo.

## Flujo de trabajo obligatorio

### 1. Revisar la carpeta

Antes de redactar, identifica:

- documentos de datos del proyecto;
- notas de visita;
- fotos disponibles;
- plantilla Word, si existe;
- cualquier archivo que pueda contener acuerdos, pendientes o responsables.

### 2. Extraer información base

Extrae, si aparece:

- nombre del proyecto;
- ubicación;
- fecha de visita;
- cliente;
- responsable del informe;
- asistentes;
- contratista o responsable de obra;
- etapa de obra;
- objetivo de la visita.

### 3. Analizar notas y fotos

A partir de las notas y fotos, identifica:

- avances observados;
- incidencias;
- pendientes;
- acuerdos;
- posibles riesgos;
- zonas o partidas afectadas;
- responsables mencionados;
- fechas comprometidas.

Cuando analices fotos:

- usa el nombre del archivo como referencia;
- observa solo lo visible;
- no concluyas más de lo que la imagen permite;
- si la foto está borrosa o no es concluyente, indícalo;
- si hay muchas fotos, incluye las más relevantes en el cuerpo del informe y manda el resto a un anexo o inventario fotográfico.

### 4. Crear el documento Word

Genera un archivo `.docx` con esta estructura mínima:

1. Portada
2. Datos generales de la visita
3. Resumen ejecutivo
4. Avances observados
5. Incidencias y observaciones técnicas
6. Pendientes y responsables
7. Acuerdos y próximos pasos
8. Registro fotográfico
9. Recomendaciones preliminares
10. Información pendiente de confirmar
11. Correo de seguimiento sugerido

Si existe una plantilla Word, úsala como base y respeta su estilo general. Si no existe plantilla, crea un documento limpio con títulos, tablas y fotografías.

### 5. Incluir fotos dentro del Word

El registro fotográfico debe incluir imágenes insertadas, no solo referencias textuales.

Para cada foto incluida:

- inserta la imagen en tamaño legible;
- debajo coloca un pie de foto con este formato:

`Foto N. [Descripción técnica breve]. Archivo: [nombre_archivo]`

Ejemplo:

`Foto 3. Posible humedad superficial en muro de baño; requiere verificación en sitio. Archivo: 02_humedad_muro_bano.jpg`

Si el sistema no permite insertar físicamente las imágenes, crea el documento con marcadores claros como:

`[INSERTAR FOTO: 02_humedad_muro_bano.jpg]`

pero antes de entregar, intenta insertar las imágenes directamente en el `.docx`.

## Formato recomendado del informe

### Portada

Debe incluir:

- título: `Informe de visita de obra`;
- proyecto;
- ubicación;
- fecha;
- cliente;
- elaborado por;
- versión: `Borrador para revisión`.

### Tabla de datos generales

Usa una tabla de dos columnas:

| Campo | Información |
|---|---|
| Proyecto | ... |
| Ubicación | ... |
| Fecha de visita | ... |
| Cliente | ... |
| Responsable | ... |
| Asistentes | ... |
| Objetivo de la visita | ... |

### Resumen ejecutivo

Debe ser breve: 1 a 3 párrafos.

Debe explicar:

- qué se revisó;
- estado general observado;
- principales avances;
- incidencias relevantes;
- próximos pasos.

### Avances observados

Organiza por partida, zona o tema:

- albañilería;
- acabados;
- instalaciones;
- carpinterías;
- estructura;
- limpieza y seguridad;
- otros.

No uses categorías que no apliquen.

### Incidencias y observaciones técnicas

Usa una tabla:

| No. | Zona/Partida | Observación | Evidencia | Prioridad | Acción sugerida |
|---|---|---|---|---|---|

Prioridades recomendadas:

- Alta: afecta seguridad, calidad, costo, plazo o impide avanzar.
- Media: requiere revisión o corrección, pero no detiene la obra.
- Baja: observación menor o de seguimiento.

### Pendientes y responsables

Usa una tabla:

| Pendiente | Responsable sugerido | Prioridad | Fecha límite | Comentario |
|---|---|---|---|---|

Si no hay responsable claro, escribe `[RESPONSABLE POR DEFINIR]`.

### Registro fotográfico

Incluye las fotos en el Word.

Orden recomendado:

1. fotos generales de contexto;
2. avances;
3. incidencias;
4. detalles;
5. anexos.

Cada foto debe tener pie de foto. No dupliques fotos salvo que sea necesario.

### Correo de seguimiento sugerido

Al final del documento, redacta un correo breve con:

- saludo;
- resumen de la visita;
- principales pendientes;
- adjunto del informe;
- solicitud de confirmación o respuesta.

## Nombres de archivo de salida

Usa este formato cuando sea posible:

`Informe_Visita_Obra_[Proyecto]_[AAAA-MM-DD].docx`

Si no conoces el proyecto o la fecha, usa:

`Informe_Visita_Obra_Borrador.docx`

## Control de calidad antes de entregar

Antes de finalizar, verifica:

- el Word se generó correctamente;
- las fotos aparecen dentro del documento;
- cada foto tiene pie de foto;
- no hay datos inventados;
- los datos faltantes están marcados;
- las tablas se leen bien;
- hay una sección de revisión humana;
- el tono es profesional.

## Frase de advertencia recomendada

Incluye al final del informe una nota como esta:

> Este informe constituye un borrador técnico elaborado a partir de las notas, fotografías y documentos disponibles. Las observaciones deben ser verificadas por el responsable técnico antes de su emisión formal.

## Modo avanzado con script opcional

Si tienes acceso a ejecución de Python y necesitas garantizar que las fotos queden insertadas en el Word, puedes usar el script incluido en `scripts/create_visit_report_docx.py`.

El flujo recomendado es:

1. Analiza documentos y fotos.
2. Crea un archivo `analysis.json` siguiendo el esquema de `resources/analysis_schema.json`.
3. Ejecuta el script para generar el `.docx` con fotos embebidas.
4. Revisa el documento final.
