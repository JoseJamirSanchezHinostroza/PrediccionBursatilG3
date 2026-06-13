#!/usr/bin/env bash
# =====================================================================
# setup_estructura.sh
# Organiza el repositorio PrediccionBursatilG3 por módulo del sistema
# (Sistema Web para Apoyo en Decisiones de Inversión usando IA — Grupo 10)
#
# Uso:
#   1. Coloca este script en la raíz de tu repo (junto a los .html sueltos)
#   2. Ejecuta: bash setup_estructura.sh
#   3. El script crea las carpetas por módulo y mueve cada archivo
#      a su carpeta correspondiente (si el archivo existe en la raíz).
# =====================================================================
set -e

echo "Creando estructura de carpetas por módulo..."

mkdir -p 01_autenticacion
mkdir -p 02_visualizacion_mercado
mkdir -p 03_prediccion_svc
mkdir -p 04_prediccion_lstm
mkdir -p 05_analisis_nlp
mkdir -p 06_generacion_estrategias
mkdir -p 07_gestion_portafolio
mkdir -p 08_envio_senales_broker
mkdir -p 09_dashboard_completo
mkdir -p 10_consola_modelos_ia
mkdir -p 11_reportes_backtesting
mkdir -p docs/prompts
mkdir -p docs/especificaciones

# ---------------------------------------------------------------
# Mapa: archivo origen -> carpeta/destino
# (ajusta los nombres de origen si difieren en tu repo)
# ---------------------------------------------------------------
declare -A MAPA=(
  ["01_autenticacion.html"]="01_autenticacion/01_autenticacion.html"

  ["dashboard_bursatil.html"]="02_visualizacion_mercado/02_dashboard_bursatil.html"

  ["svc_clasificador_tendencia.html"]="03_prediccion_svc/03_svc_clasificador_tendencia.html"

  ["lstm_regressor_prediccion.html"]="04_prediccion_lstm/04_lstm_regressor_prediccion.html"

  ["Análisis de Noticias con NLP.html"]="05_analisis_nlp/05_analisis_noticias_nlp.html"

  ["Generacion de estrategias.html"]="06_generacion_estrategias/06_generacion_estrategias_react.jsx"

  ["HTML Gestion de portafolio.html"]="07_gestion_portafolio/07_gestion_portafolio.html"

  ["señales_broker.html"]="08_envio_senales_broker/08_envio_senales_broker.html"

  ["09_dashboard_completo .html"]="09_dashboard_completo/09_dashboard_completo.html"

  ["consola_modelos_ia.html"]="10_consola_modelos_ia/10_consola_modelos_ia.html"

  ["reporte_backtesting.html"]="11_reportes_backtesting/11_reporte_backtesting.html"

  # Documentación / especificaciones / prompts originales
  ["Especificaciones_de_Requisito_de_Software.docx"]="docs/especificaciones/ERS_Sem08.docx"
  ["26_06_06_V3_Especificaciones_Trabajo_Sem10_GUI_iDeSo.md"]="docs/especificaciones/Especificaciones_Sem10_GUI.md"

  ["contexto.txt"]="docs/prompts/A1_autenticacion_prompt.txt"
  ["Prompt A.2.txt"]="docs/prompts/A2_visualizacion_mercado_prompt.txt"
  ["PROMPT A.3.txt"]="docs/prompts/A3_prediccion_svc_prompt.txt"
  ["PROMPT 4.txt"]="docs/prompts/A4_prediccion_lstm_prompt.txt"
  ["Prompt 5.txt"]="docs/prompts/A5_analisis_nlp_prompt.txt"
  ["Prompt Gen de estrategias.txt"]="docs/prompts/A6_generacion_estrategias_prompt.txt"
  ["Prompt Gestion de portafolio.txt"]="docs/prompts/A7_gestion_portafolio_prompt.txt"
  ["Prompt A.8.txt"]="docs/prompts/A8_senales_broker_prompt.txt"
  ["contexto2.txt"]="docs/prompts/A9_dashboard_completo_prompt.txt"
  ["PROMPT10.txt"]="docs/prompts/A10_consola_modelos_prompt.txt"
  ["Prompt 11.txt"]="docs/prompts/A11_reportes_backtesting_prompt.txt"
)

for origen in "${!MAPA[@]}"; do
  destino="${MAPA[$origen]}"
  if [ -f "$origen" ]; then
    mv -v "$origen" "$destino"
  else
    echo "  (omitido, no encontrado en raíz): $origen"
  fi
done

echo ""
echo "Estructura final:"
find . -maxdepth 2 -type d | sort
