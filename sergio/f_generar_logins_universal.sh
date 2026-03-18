#!/usr/bin/env bash
# Autor: Sergio
# Fecha: 18/03/2026

error="\\e[31m"
azul="\\e[1;34m"
exito="\\e[32m"
reset="\\e[0m"

# =========================================
# Nombre: f_generar_logins_universal
# Descripción: Genera identificadores en minúsculas procesando nombres y apellidos.
# Compatible con /bin/sh y /bin/bash. Ejemplo: Francisco Javier;de la Vega;López Cobos;12345678Z
# Nombre: Todas las iniciales. Francisco Javier ->fj
# Apellidos: 3 primeras letras (sin espacios). de la Vega;López Cobos ->del
# DNI: 3 últimos caracteres. 78z
# Valores de entrada: $1: Fichero origen (CSV delimitado por ;). $2: Fichero destino.
# Parametros Entrada: $1 Fichero origen, $2 Fichero destino
# Parametros Salida: Escribe logins en fichero destino. 0=OK, 1=error

f_generar_logins_universal() {
   [ ! -f "$1" ] && { printf "${error}Fichero origen no existe: $1${reset}\n"; return 1; }
   
   while IFS=';' read -r nombres ap1 ap2 dni; do
      ini1=$(echo "$nombres" | cut -d' ' -f1 | head -c1)
      ini2=$(echo "$nombres" | cut -d' ' -f2 | head -c1 || echo "")
      ape=$(echo "$ap1$ap2" | tr -d ' ' | cut -c1-3)
      ult=$(echo "$dni" | tail -c4)
      login=$(echo "$ini1$ini2$ape$ult" | tr 'A-Z' 'a-z')
      echo "$login" >> "$2"
   done < "$1"
   
   printf "${exito}Logins generados en: %s${reset}\n" "$2"
   return 0
}

f_generar_logins_universal "$1" "$2"
echo $?
