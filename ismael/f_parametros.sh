#!/usr/bin/env bash
# Autor: Ismael
# Fecha: 09/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

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

echo $?
