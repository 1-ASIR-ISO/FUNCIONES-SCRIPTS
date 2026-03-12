#!/usr/bin/env bash
# Autor: Sergio
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_paquete_disponible
# Descripción: Devuelve cero en caso de estar disponible en el repositorio configurado en sources.list,
# uno en caso contrario. Se pasa el nombre del paquete como argumento.
# Parametros Entrada: 1
# Parametros Salida: Devuelve si esta disponible (0) el paquete o no (1)

f_paquete_disponible() {
   resultado=$(apt-cache policy "$1" 2>/dev/null | grep "Candidato:")
   if [ -n "$resultado" ]; then
#     printf "${exito}Paquete $1 ESTA disponible${reset}\n"
      return 0
   else
#     printf "${error}Paquete $1 NO ESTA disponible${reset}\n"
      return 1
   fi
}

f_paquete_disponible "$1"
echo $?
