#!/usr/bin/env bash
# Autor: Adrián
# Fecha: 16/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_puerto_abierto
# Descripción: Verifica si un servicio esta escuchando en un puerto.
# Parametros Entrada: La direccion IP y numeor de puerto
# Parametros Salida: 0 si esta abierto y 1 si esta cerrado

f_puerto_abierto(){
	 nc -z "$1" "$2" >/dev/null 2>&1
	echo $?
}

f_puerto_abierto "$1" "$2"
