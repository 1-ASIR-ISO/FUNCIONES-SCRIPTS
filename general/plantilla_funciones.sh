#!/usr/bin/env bash

# ===== PLANTILLA DE SCRIPT =====
# Este script genera otro script con cabecera, colores y funciones listas

read -p "Nombre del script a crear (sin .sh): " nombrescript

# Crear el archivo con la cabecera
echo "#!/usr/bin/env bash" > "$nombrescript.sh"
echo "# Autor: " >> "$nombrescript.sh"
echo "# Fecha: " >> "$nombrescript.sh"
echo "" >> "$nombrescript.sh"

# Colores como variables
echo "error=\"\\e[31m\"" >> "$nombrescript.sh"
echo "azul=\"\\e[1;34m\"" >> "$nombrescript.sh"
echo "exito=\"\\e[32m\"" >> "$nombrescript.sh"
echo "reset=\"\\e[0m\"" >> "$nombrescript.sh"
echo "" >> "$nombrescript.sh"

echo "# =========================================" >> "$nombrescript.sh"

echo "# Nombre: " >> "$nombrescript.sh"
echo "# Descripción: " >> "$nombrescript.sh"
echo "# Parametros Entrada: " >> "$nombrescript.sh"
echo "# Parametros Salida: " >> "$nombrescript.sh"
