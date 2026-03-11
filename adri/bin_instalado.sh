#!/usr/bin/env bash
# Autor: Adrián
# Descripción: Va a comprobar si tienes un binario instalado y devolvera un 0 si sí y un 1 si no.
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# ========================================= bin_instalado

echo -e "${azul}Dime el nombre del binario${reset}"
read bin

f_bin_instalado(){
  if command -v $bin &>/dev/null; then
	echo -e "${exito}Si está instalado ${reset}"
	return 0

  else
	echo -e "${error}No está instalado ${reset}"
	return 1

  fi
}

f_bin_instalado $bin
