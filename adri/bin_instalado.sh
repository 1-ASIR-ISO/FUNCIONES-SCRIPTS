#!/usr/bin/env bash
# Autor: Adrián
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# ========================================= bin_instalado

# Nombre: f_bin_instalado
# Descripción: Va a comprobar si tienes un binario instalado y devolvera un 0 s>
# Parametros Entrada: 1
# Parametros Salida: Devuelve si esta o no esta instalado el bin

f_bin_instalado() {
   if command -v "$1" &>/dev/null; then
      printf "${exito}Si está instalado ${reset}\n"
      return 0

   else
      printf "${error}No está instalado ${reset}\n"
      return 1

   fi
}

f_bin_instalado "$1"
