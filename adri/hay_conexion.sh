#!/usr/bin/env bash
# Autor: Adrián
# Descripción: Comprueba si hay conexion o no
# Fecha: 10/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# ========================================= hay_conexion

f_hay_conexion(){
	if ping -c 1 -q 8.8.8.8 > /dev/null 2>&1;then
		echo -e "${exito}Si hay conexión${reset}"
		return 0
	else
		echo -e "${error}No hay conexión${reset}"
		return 1
	fi
}

f_hay_conexion
