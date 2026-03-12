#!/usr/bin/env bash
# Autor: Ismael
# Fecha: 09/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

# Nombre: f_ayuda
# Descripción: Te muestra la ayuda de un script para saber que parametros usar 
# Parametros Entrada: No recibe ningún parametro de salida
# Parametros Salida: Devuelve la ayuda de un script

f_ayuda() {
  printf "${azul}Uso: $0 PARAM1 PARAM2\n"
  printf "Descripción: Este script hace x cosa con los parametros\n"
  printf " PARAM1 - Explicación del parametro 1\n"
  printf " PARAM2 - Explicación del parametro 2${reset}\n"
}


