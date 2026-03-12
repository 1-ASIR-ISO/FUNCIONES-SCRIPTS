#!/usr/bin/env bash
# Autor: Gabriel
# Fecha: 11-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_buscar_paquetes
# Descripción: Busqueda del paquete por binario
# Parametros Entrada: Nombre del binario
# Parametros Salida: Nombre del paquete

f_buscar_paquetes() {
    paquete=$(dpkg -S "$1" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
	uptime
#    	printf "${exito}$paquete${reset}\\n"
        return 0
    else
        printf "${error}No encontrado: $1${reset}\\n"
        return 1
    fi
}

variable=$(f_buscar_paquetes "tealdeer")
echo $?
echo $variable
