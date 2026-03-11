#!/usr/bin/env bash
# Autor: Adrián
# Fecha: 10/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

# Nombre: f_hay_conexion
# Descripción: Comprueba si hay conexion o no en la maquina.
# Parametros Entrada: 0
# Parametros Salida: Muestra si hay o no conexión.

f_hay_conexion(){
	if ping -c 1 -q 8.8.8.8 > /dev/null 2>&1;then
		printf "${exito}Si hay conexión${reset}"
		return 0
	else
		printf "${error}No hay conexión${reset}"
		return 1
	fi
}

f_hay_conexion
