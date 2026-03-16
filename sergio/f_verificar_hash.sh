#!/usr/bin/env bash
# Autor: Sergio
# Fecha: 09/03/2026

error="\\e[31m"
azul="\\e[1;34m"
exito="\\e[32m"
reset="\\e[0m"

# =========================================
# Nombre: f_verificar_hash
# Descripción: Compara la integridad de un archivo contra un hash MD5.
# Parametros Entrada: $1: Ruta del archivo. $2: Cadena del hash esperado.
# Parametros Salida: 0: OK. 1: No coincide o no existe.

f_verificar_hash() {
   resultado=$(md5sum "$1" 2>/dev/null | awk '{print $1}')
   if [ -n "$resultado" ] && [ "$resultado" = "$2" ]; then
      return 0
   else
      return 1
   fi
}

f_verificar_hash "$1" "$2"
echo $?
