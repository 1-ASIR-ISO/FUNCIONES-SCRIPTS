#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Descripción: funcion dedicada a buscar paquetes en el sistema a traves del binario que pasa el usuario como argumento
# Fecha: 09-3-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
f_buscar_paquetes() {
    echo -n "Introduce la ruta al binario: "
    read binario
    if [ -z "$binario" ]; then
        echo "Debes introducir un binario" >&2
        return 1
    fi
    paquete=$(dpkg -S "$binario" 2>/dev/null | cut -d: -f1 2>/dev/null || echo "")
    if [ -n "$paquete" ]; then
        echo "Paquete: $paquete"
    else
        echo "Paquete no encontrado para '$binario'"
    fi
}

f_uid() {
    id -u
}

echo "Mi UID es: $(f_uid)"
