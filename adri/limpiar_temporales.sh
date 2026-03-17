#!/usr/bin/env bash
# Autor: Adrián
# Fecha: 16/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_limpiar_temporales
# Descripción: Elimina los arichivos de una ruta que hayan sido modificados despues de un tiempo.
# Parametros Entrada: Ruta del directorio y antiguedad en dias.
# Parametros Salida: 0 si se ha limpiado correctamente y 1 si no se encontro el directorio

f_limpiar_temporales(){
	sudo find "$1" -type f -mtime +"$2" -delete
}

f_limpiar_temporales "$1" "$2"
