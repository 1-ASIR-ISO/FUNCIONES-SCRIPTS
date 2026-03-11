#!/usr/bin/env bash
# Autor: Grupal
#Descripción: libreria de funciones grupal 
# Fecha: 09-3-2026

error=$'\e[31m'       # Rojo
azul=$'\e[1;34m'      # Azul intenso
exito=$'\e[32m'       # Verde
reset=$'\e[0m'        # Reset

# =========================================

f_uid() {
    id -u
}

f_buscar_paquetes() {
    echo -n "${azul}Introduce la ruta al binario: ${reset}"
    read binario
    if [ -z "$binario" ]; then
        echo "${error}Debes introducir un binario correcto ❌${reset}" >&2
        return 1
    fi
    paquete=$(dpkg -S "$binario" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        echo "${exito}Paquete: $paquete ✅${reset}"
        return 0
    else
        echo "${error}Paquete no encontrado para '$binario' ❌${reset}"
        return 1 
    fi
}

f_paquete_instalado() {
    echo -n "${azul}Introduce nombre del paquete: ${reset}"
    read paquete
    if [ -z "$paquete" ]; then
        echo "${error}Debes introducir un paquete valido${reset}" >&2
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        echo "${exito}$paquete ESTÁ INSTALADO${reset}"
        return 0
    else
        echo "${error}$paquete NO está instalado${reset}"
        return 1
    fi
}

f_paquete_disponible() {
echo -n "Introduce el nombre del paquete: "
    read nombre_paquete
    resultado=$(apt-cache policy "$nombre_paquete" 2>/dev/null | grep "Candidato:")
    if [ -n "$resultado" ]; then
        echo "Paquete '$nombre_paquete' ESTA disponible"
        return 0
    else
        echo "Paquete '$nombre_paquete' NO ESTA disponible"
        return 1
    fi
}

f_eres_root() {
    usuario_id=$(id -u)
    if [ $usuario_id = 0 ]; then
        echo "Eres root"
        return 0
    else
        echo "No eres root, hazlo como root"
        return 1
    fi
}

f_bin_instalado(){
  if command -v $bin &>/dev/null; then
        echo "Si está instalado"
        return 0

  else
        echo "No está instalado"
        return 1

  fi
}

f_hay_conexion(){
        if ping -c 1 -q 8.8.8.8 > /dev/null 2>&1;then
                echo "Si hay conexión"
                return 0
        else
                echo "No hay conexión"
                return 1
        fi
}

f_ayuda() {
  printf "${azul}Uso: $0 PARAM1 PARAM2\n"
  printf "Descripción: Este script hace x cosa con los parametros\n"
  printf " PARAM1 - Explicación del parametro 1\n"
  printf " PARAM2 - Explicación del parametro 2${reset}\n"
}

f_parametros() {
  if [ $# -lt 2 ]; then
  printf "${error}FALTAN PARAMETROS${reset}\n"
  f_ayuda
  exit 1
  fi
}
