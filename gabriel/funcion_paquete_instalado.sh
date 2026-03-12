#!/usr/bin/env bash
# Autor: Gabriel
# Fecha: 12-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_paquete_instalado
# Descripción: verifica paquete instalado sistema
# Parametro entrada: nombre paquete
# Parametro salida: 0 si está instalado, 1 si no lo está


f_paquete_instalado() {
    local paquete="$1"
    if [ -z "$paquete" ]; then
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        return 0
    else
        return 1
    fi
}

f_paquete_instalado "$1"
echo $?
