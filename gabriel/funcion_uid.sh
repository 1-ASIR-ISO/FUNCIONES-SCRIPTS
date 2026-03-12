#!/usr/bin/env bash
# Autor: Gabriel
# Descripción: Obtiene UID del usuario actual

error="\\e[31m"
azul="\\e[1;34m"
exito="\\e[32m"
reset="\\e[0m"

# =========================================
# Nombre: f_uid
# Descripción: función para saber el UID del usuario que ejecuta el script.
# Entrada: 0.
# Salida: Muestra UID del usuario con color.

f_uid() {
    uid=$(id -u)
    printf "${exito}La UID del usuario es: %s${reset}\\n" "$uid"
}

f_uid
