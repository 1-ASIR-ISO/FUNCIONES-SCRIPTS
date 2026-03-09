#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Descripción: Este script está enfocado en una funcion la cual nos muestre el UUID del usuario actual
# Fecha: 09-3-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
f_uid() {
    id -u
}

echo "Mi UID es: $(f_uid)"
