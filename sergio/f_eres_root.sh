#!/usr/bin/env bash
# Autor: Sergio
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

# Nombre: f_eres_root
# Descripción: Dice si el usuario que ha ejecutado el script es root o no
# Parametros Entrada: 0
# Parametros Salida: Devuelve 0 si el usuario que ha ejecutado el script es root y 1 si no lo es

f_eres_root() {
   usuario_id=$(id -u)
   if [ $usuario_id = 0 ]; then
      printf "${exito}Eres root${reset}\n"
      return 0
   else
      printf "${error}No eres root, hazlo como root${reset}\n"
      return 1
   fi
}

f_eres_root
