#!/usr/bin/env bash
# Autor: Pablo Villalón Alfaro
# Fecha: 16/03/2026

error="[31m"
azul="[1;34m"
exito="[32m"
reset="[0m"

# =========================================
# Nombre: f_es_ip_valida
# Descripción: 
# Parametros Entrada: $1 Cadena de texto a validar.
# Parametros Salida: Devuelve 0 si el formato de la IP es correcto.
# Y 1 si el formato de la IP no es correcto.

f_es_ip_valida() {

    ip="$1"

    if [ -z "$ip" ]; then
        echo "${error} No se proporcionó ninguna IP.${reset}" >&2
        return 1
    fi

    echo "$ip" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'
    if [ $? -ne 0 ]; then
        echo "${error}1${reset}" >&2
        return 1
    fi

    OLD_IFS=$IFS
    IFS='.'
    set -- $ip
    IFS=$OLD_IFS

    for octeto in "$@"
    do
        if [ "$octeto" -lt 0 ] || [ "$octeto" -gt 255 ]; then
            echo "${error}1${reset}" >&2
            return 1
        fi
    done
    echo "${azul}0${reset}"
    return 0
}

f_es_ip_valida "$1"
exit $?
