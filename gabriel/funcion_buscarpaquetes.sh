#!/usr/bin/env bash
# Autor: Gabriel
# Fecha: 11-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_buscar_paquetes
# Descripción: Busquedapaquete por binario
# Parametros Entrada: Nombre del binario
# Parametros Salida: 0 si existe, 1 si no existe

f_buscar_paquetes() {
    paquete=$(dpkg -S "$1" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        return 0
    else
        return 1
    fi
}

f_buscar_paquetes "$1"
echo $?
