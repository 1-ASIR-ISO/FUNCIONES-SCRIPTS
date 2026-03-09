#!/usr/bin/env bash
# Autor: Sergio
# Descripción: Script que devuelve 0 en caso de que seas root
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================

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
