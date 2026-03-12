#!/usr/bin/env bash
# Autor: Gabriel
# Fecha: 11-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_buscar_paquetes
# Descripción: funcion dedicada a la busqueda de paquetes a traves de un binario
# Parametros Entrada: 1
# Parametros Salida: 1

f_buscar_paquetes() {
    paquete=$(dpkg -S "$1" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        printf "${exito}Paquete: $paquete${reset}\\n"
        return 0
    else
        printf "${error}No encontrado: $1${reset}\\n"
        return 1
    fi
}

f_buscar_paquetes "$1"
