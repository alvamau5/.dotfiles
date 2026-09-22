# Esquema de datos recomendado para reportes diarios de obra

Para que el reporte semanal y la curva S funcionen bien, cada RDO debería incluir estos campos de forma consistente.

## Datos generales

- Obra
- Número de reporte
- Fecha
- Día de obra
- Residente
- Director o supervisor
- Estado del reporte

## Condiciones del día

- Clima mañana
- Clima tarde
- Horas efectivas
- Horario
- Suspensión
- Temperatura aproximada

## Personal

| Cargo / Oficio | Nombre o referencia | Cantidad | Horas | Jornales |
|---|---:|---:|---:|---:|

## Maquinaria y equipo

| Equipo | ID / Placa | Actividad | Horas operación | Horas espera |
|---|---|---|---:|---:|

## Actividades ejecutadas

| Clave | Unidad | Descripción / Frente | Cantidad diaria | Acumulado | Estado |
|---|---|---|---:|---|---|

El campo acumulado debe idealmente tener formato `ejecutado / total`, por ejemplo `1,240 / 1,900`.

## Materiales recibidos

| Material | Proveedor | Cantidad | Unidad | Remisión / Factura | Estado |
|---|---|---:|---|---|---|

## Incidencias

| Tipo | Urgencia | Descripción | Acción tomada |
|---|---|---|---|

## Pendientes

| Tarea / Solicitud | Responsable | Fecha límite |
|---|---|---|

## Control presupuestal

| Partida | Presupuestado | Ejecutado acumulado | % Avance | Alerta |
|---|---:|---:|---:|---|

## Línea base mínima para curva S

Si el RDO no trae avance programado, anexar un archivo `linea_base.csv` con:

| fecha | avance_programado_pct | costo_programado |
|---|---:|---:|

Sin línea base se puede graficar el avance real, pero no se puede concluir atraso con rigor.
