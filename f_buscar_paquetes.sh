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
    if [ $# -ne 1 ]; then
        echo "Uso: f_buscar_paquetes <binario>"
        return 1
    fi
    paquete=$(dpkg -S "$1" 2>/dev/null | cut -d: -f1)
    if [ -n "$paquete" ]; then
        echo "$paquete"
    else
        echo "Paquete no encontrado"
    fi
}

