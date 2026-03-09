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

f_paquete_disponible() {
    nombre_paquete=$1
    
    resultado=$(apt-cache policy $nombre_paquete 2>/dev/null | grep "Candidate:")
    
    if [ -n "$resultado" ]; then
	echo "Paquete '$nombre_paquete' esta disponible"
        return 0
    else
	echo "Paquete '$nombre_paquete' NO esta disponible"
        return 1
    fi
}
