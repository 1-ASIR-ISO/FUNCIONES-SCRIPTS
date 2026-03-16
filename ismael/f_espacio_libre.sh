#!/usr/bin/env bash
# Autor:Ismael 
# Fecha: 16/03/2026

error="[31m"
azul="[1;34m"
exito="[32m"
reset="[0m"

# =========================================
# Nombre:f_espacio_libre
# Descripción:Comprueba si un punto de montaje tiene suficiente espacio libre
# Parametros Entrada: ubicacion y porcentaje de espacio requerido
# Parametros Salida: 0 si hay espacio suficiene, 1 si no hay espacio

f_espacio_libre() {
    libre=$(df "$1" | tail -1 | awk '{print 100-$5}')
    if [ "$libre" -ge "$2" ]; then
        return 0
    else
        return 1
    fi
}

echo $?
