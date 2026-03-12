#!/usr/bin/env bash
# Autor: Gabriel
# Descripción:

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

#Nombre: f_uid
#Descripción: función para saber el UID del usuario que ejecuta el script.
#Entrada: No.
#Salida: Parametro UID del usuario.

f_uid() {
    id -u
}
