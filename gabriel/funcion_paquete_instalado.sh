#!/usr/bin/env bash
# Autor: Gabriel
# Fecha: 12-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_paquete_instalado
# Descripción: verifica si un paquete está instalado
# Parametro entrada: 1
# Parametro salida: 1


f_paquete_instalado() {
    local paquete="$1"
    if [ -z "$paquete" ]; then
        printf "${error}Error: Debes pasar un paquete (ej: ${0##*/} nano)${reset}\\n" >&2
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        printf "${exito}%s ESTÁ INSTALADO${reset}\\n" "$paquete"
        return 0
    else
        printf "${error}%s NO está instalado${reset}\\n" "$paquete"
        return 1
    fi
}

f_paquete_instalado "$1"
