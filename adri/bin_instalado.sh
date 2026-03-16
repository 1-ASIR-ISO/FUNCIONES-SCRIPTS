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
# Parametros Entrada: Nombre del binario
# Parametros Salida: Devuelve si esta o no esta instalado el bin

f_bin_instalado() {
	command -v "$1" &>/dev/null;
	echo $?
}

f_bin_instalado "$1"
