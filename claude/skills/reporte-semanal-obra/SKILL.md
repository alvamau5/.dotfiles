---
name: reporte-semanal-obra
description: Analiza 5 reportes diarios de obra y genera un reporte semanal en Word con avances, atrasos, riesgos, incidencias, costos y curva S.
dependencies:
  - python>=3.10
  - python-docx
  - pandas
  - matplotlib
---

# Skill: Reporte semanal de obra

Usa esta skill cuando el usuario pida revisar reportes diarios de obra, consolidar una semana de obra, detectar atrasos/incidencias/riesgos, o generar un reporte semanal en Word a partir de RDO en `.docx`, PDF, Excel o documentos de Google Drive.

## Objetivo

Leer 5 reportes diarios de obra de una semana, extraer la información importante, detectar desviaciones y producir un **reporte semanal ejecutivo en `.docx`** con:

1. Resumen ejecutivo semanal.
2. Datos generales de obra y periodo revisado.
3. Avance físico ejecutado.
4. Actividades completadas, en proceso y pendientes.
5. Incidencias, restricciones y riesgos.
6. Personal, maquinaria y materiales relevantes.
7. Control presupuestal.
8. Curva S de avance físico y/o financiero.
9. Conclusiones y acciones recomendadas para la semana siguiente.

## Entrada esperada

Prioriza reportes diarios ubicados en una carpeta de Google Drive, por ejemplo:

`https://drive.google.com/drive/folders/17xwNMcCq76HWvfs5czCJT3A3eDxi_PfV?usp=drive_link`

Si tienes acceso a Google Drive mediante integración, abre la carpeta y selecciona los 5 reportes diarios correspondientes a la semana indicada por el usuario. Si no tienes acceso directo a la carpeta, pide al usuario que suba los 5 archivos o que los comparta como archivos adjuntos.

## Flujo de trabajo

### 1. Identificación de reportes

- Buscar los 5 reportes diarios de la semana solicitada.
- Ordenarlos cronológicamente por fecha de reporte, no por fecha de modificación del archivo.
- Si hay menos de 5 reportes, generar el reporte con los disponibles y declarar claramente qué días faltan.
- Si hay más de 5 reportes, usar solo los del periodo semanal solicitado.

### 2. Extracción mínima por reporte diario

Extrae y normaliza estos campos:

- Obra / proyecto.
- Número de reporte.
- Fecha.
- Día de obra.
- Residente y director responsable.
- Resumen ejecutivo diario.
- Condiciones climáticas y horas efectivas.
- Personal total y jornales.
- Maquinaria y horas de operación / espera.
- Actividades ejecutadas: clave, unidad, descripción, cantidad diaria, acumulado y estado.
- Materiales recibidos: material, proveedor, cantidad, unidad, remisión/factura y estado.
- Incidencias y novedades: tipo, urgencia, descripción y acción tomada.
- Tareas pendientes: tarea, responsable y fecha límite.
- Control presupuestal: partida, presupuesto, ejecutado acumulado, porcentaje de avance y alerta.

### 3. Criterios de análisis

Analiza la semana con criterio de control de obra, no solo como resumen textual.

Detecta:

- Actividades completadas.
- Actividades en proceso.
- Actividades con avance parcial relevante.
- Actividades pendientes vencidas o próximas a vencer.
- Incidencias repetidas o de alta urgencia.
- Suspensiones, lluvia, falta de personal, falta de material o equipo detenido.
- Incrementos de costo ejecutado acumulado.
- Posibles atrasos físicos si el avance real es menor que el programado.
- Posibles sobrecostos si el costo real supera el programado o si el avance financiero crece más rápido que el físico.

No inventes atrasos ni sobrecostos. Si falta línea base, programa semanal o presupuesto programado, indícalo explícitamente.

### 4. Curva S

Genera curva S cuando exista información suficiente.

Usa este orden de prioridad:

1. Avance programado y real acumulado por fecha, si viene en los reportes.
2. Archivo adicional de línea base o cronograma, si el usuario lo proporciona.
3. Si no existe avance programado, grafica solo el avance real acumulado y agrega una nota: “No se pudo comparar contra programa porque no se proporcionó línea base semanal”.

La curva S puede ser:

- Física: % de avance acumulado real vs % programado.
- Financiera: costo ejecutado acumulado vs costo programado.
- Mixta: avance físico y avance financiero, si ambos existen.

### 5. Reporte semanal en Word

El documento `.docx` debe tener esta estructura:

1. Portada simple:
   - Nombre de la obra.
   - Periodo semanal.
   - Fecha de generación.
   - Responsable, si está disponible.

2. Resumen ejecutivo:
   - Estado general de la semana: En tiempo / Con alertas / Atraso / Crítico.
   - 3 a 6 hallazgos principales.
   - Recomendación ejecutiva.

3. Indicadores clave:
   - Avance físico acumulado.
   - Avance financiero acumulado.
   - Personal promedio diario.
   - Horas efectivas promedio.
   - Incidencias relevantes.
   - Pendientes abiertos.

4. Avance semanal:
   - Tabla de actividades principales.
   - Comparación diaria si existe información.
   - Actividades completadas y en proceso.

5. Curva S:
   - Imagen de la curva.
   - Interpretación breve.

6. Incidencias y riesgos:
   - Tabla con tipo, urgencia, descripción, acción tomada y estado.
   - Riesgos para la semana siguiente.

7. Materiales, personal y equipo:
   - Resumen de recursos críticos.
   - Alertas por faltantes o tiempos muertos.

8. Control presupuestal:
   - Tabla por partida.
   - Avance financiero y alertas.
   - Comentario sobre sobrecostos solo si los datos lo soportan.

9. Pendientes y acciones recomendadas:
   - Acción.
   - Responsable.
   - Fecha límite.
   - Prioridad.

10. Conclusión semanal.

## Formato de salida

- Usar español profesional, claro y directo.
- Evitar lenguaje inflado.
- Separar hechos comprobados de inferencias.
- Incluir tablas ejecutivas.
- No copiar todo el reporte diario; consolidar.
- Señalar datos faltantes en una sección de “Limitaciones de la información”.

## Uso del script incluido

Cuando tengas los reportes diarios descargados o disponibles como archivos locales, puedes usar el script:

```bash
python ${CLAUDE_SKILL_DIR}/scripts/generar_reporte_semanal.py \
  --input ./reportes_diarios \
  --output ./reporte_semanal_obra.docx
```

Con línea base de avance programado:

```bash
python ${CLAUDE_SKILL_DIR}/scripts/generar_reporte_semanal.py \
  --input ./reportes_diarios \
  --baseline ./linea_base.csv \
  --output ./reporte_semanal_obra.docx
```

El archivo `linea_base.csv` debe contener al menos:

```csv
fecha,avance_programado_pct,costo_programado
2026-05-11,40.0,950000
2026-05-12,41.0,975000
```

## Reglas importantes

- No afirmar que hay atraso si no existe avance programado o programa de obra.
- No afirmar sobrecosto si no hay presupuesto programado, costo planeado o valor ganado comparable.
- Si solo existe avance financiero acumulado, describirlo como avance financiero, no como avance físico.
- Si una partida aparece al 100%, marcarla como terminada solo para esa partida.
- Si una actividad aparece “en proceso”, estimar su avance solo si existe relación acumulado/total.
- Al finalizar, entregar el `.docx` generado y un resumen corto en el chat.
