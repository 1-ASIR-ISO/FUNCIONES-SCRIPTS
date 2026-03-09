#!/bin/bash
# Título: Pruebas llamadas funciones externas
# Autor: Gabriel Merencio Ortega
# Fecha: $(date +%Y-%m-%d)
# Descripción: Llama funciones de fichero externo

# Carga las funciones de tu fichero
source ./f_uid ./f_buscar_paquetes  # Cambia por tu ruta real

echo "LLAMANDO FUNCIONES EXTERNAS"
echo

echo "1) f_uid:"
echo "   UID: $(f_uid)"
echo

echo "2) f_buscar_paquetes:"
f_buscar_paquetes /bin/ls
f_buscar_paquetes /bin/bash
f_buscar_paquetes /noexiste
echo

echo "✅ Pruebas OK"
