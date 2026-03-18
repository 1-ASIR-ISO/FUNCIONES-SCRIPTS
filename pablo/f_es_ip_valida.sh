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
        printf "${error}No se proporcionó ninguna IP.${reset}\n" >&2
        return 1
    fi

    echo "$ip" | grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'
    if [ $? -ne 0 ]; then
        printf "${error}1${reset}\n" >&2
        return 1
    fi

    OLD_IFS=$IFS
    IFS='.'
    set -- $ip
    IFS=$OLD_IFS

    for octeto in "$@"
    do
        if [ "$octeto" -lt 0 ] || [ "$octeto" -gt 255 ]; then
            printf "${error}1${reset}\n" >&2
            return 1
        fi
    done

    printf "${exito}0${reset}\n"
    return 0
}

# =========================================
# MENÚ

printf "${azul}=================================${reset}\n"
printf " ${exito}Elige una de las dos opciones:${reset}\n"
printf "${azul}=================================${reset}\n"
printf "1. Validar tu IP\n"
printf "2. Validar una IP cualquiera\n\n"

read -p "Opción: " opcion

case $opcion in
    1)
        ip=$(ip a | grep 'enp' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}\/[0-9]{1,2}' | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')
        printf "\nTu IP es: ${azul}%s${reset}\n" "$ip"
        f_es_ip_valida "$ip"
        ;;
    2)
        read -p "Introduce la IP: " ip
        f_es_ip_valida "$ip"
        ;;
    *)
        printf "${error}Opción no válida.${reset}\n"
        exit 1
        ;;
esac

exit $?
