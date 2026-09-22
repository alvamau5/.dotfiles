# Instalación de la skill `reporte-semanal-obra`

## Opción A: Claude.ai

1. Comprime la carpeta `reporte-semanal-obra` como `.zip`.
2. En Claude, ve a **Customize > Skills**.
3. Sube el `.zip`.
4. Activa la skill.
5. Usa el prompt incluido en `examples/prompt_de_uso.md`.

## Opción B: Claude Code

Copia la carpeta en:

```bash
~/.claude/skills/reporte-semanal-obra/
```

Debe quedar así:

```text
~/.claude/skills/reporte-semanal-obra/
├── SKILL.md
├── README_INSTALACION.md
├── resources/
├── examples/
└── scripts/
```

Luego puedes invocarla con:

```text
/reporte-semanal-obra
```

## Sobre Google Drive

La skill no se ejecuta sola ni monitorea carpetas automáticamente. Para automatizar el proceso cada viernes, conecta Google Drive con n8n, Make, Apps Script o una integración MCP/API, y pasa los archivos a Claude para que aplique esta skill.

## Dependencias del script

El script incluido usa:

```bash
pip install python-docx pandas matplotlib
```

## Uso local del script

```bash
python scripts/generar_reporte_semanal.py --input ./reportes_diarios --output ./reporte_semanal_obra.docx
```

Con línea base:

```bash
python scripts/generar_reporte_semanal.py --input ./reportes_diarios --baseline ./linea_base.csv --output ./reporte_semanal_obra.docx
```
