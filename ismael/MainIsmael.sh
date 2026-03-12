#!/usr/bin/env bash
# Autor: Ismael
# Fecha: 12/03/26

error="[31m"
azul="[1;34m"
exito="[32m"
reset="[0m"

# =========================================
# Nombre: MainIsmael.sh 
# Descripción: Script que une las funciones de ayuda y parametros
# Parametros Entrada: Parametros del script
# Parametros Salida: Ayuda en caso de error


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


# Nombre: f_parametros
# Descripción: Comprueba si se han introducido argumentos al script. 
# Parametros Entrada: Parametros del script.
# Parametros Salida: Devuelve error y ayuda. 


f_parametros() {
  if [ $# -lt 2 ]; then
  printf "${error}FALTAN PARAMETROS${reset}\n"
  f_ayuda
  exit 1
  fi
}

f_parametros "$@"
echo $?
