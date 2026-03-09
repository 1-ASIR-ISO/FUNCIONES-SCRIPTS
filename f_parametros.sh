#!/usr/bin/env bash
# Autor: Ismael
# Descripción: Comprueba si se han introducido argumentos al script 
# Fecha: 09/03/26

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

#Funcion: f_parametros
#Recibe los argumentos de un script ($@)
#Funcionamiento: Si hay menos de dos parametros muestra error, llama a f_ayuda y finaliza con exit 1

f_parametros() {
  if [ $# -lt 2 ]; then
  printf "${error}FALTAN PARAMETROS${reset}\n"
  f_ayuda
  exit 1
  fi
}

