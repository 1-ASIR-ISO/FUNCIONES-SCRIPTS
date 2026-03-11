#!/usr/bin/env bash
# Autor: Sergio
# Descripción: Devuelve cero en caso de estar disponible en el repositorio configurado en sources.list, 
#uno en caso contrario. Se pasa el nombre del paquete como argumento.
# Fecha: 09/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
#Nombre:
#Descripción:
#Parametro Entrada:
#Parametro Salida:


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

f_paquete_disponible
