#!/usr/bin/env bash

# Autor: Pablo Villalón Alfaro
# Versión: 1
# Fecha: 10/03/2026

# ===============================================================

# Nombre: f_ranking_comandos
# Descripción: Muestra los 10 comandos más utilizados por el usuario.
# Parámetros Entrada: 0
# Parámetros Salida: Muestra el Top 10 de los comandos más utilizados por el usuario
#         ordenado de mayor a menor con el nº de veces que se ha ejecutado cada uno.

f_ranking_comandos() {

    #Colores
    ROJO="\033[31m"
    VERDE="\033[32m"
    AMARILLO="\033[33m"
    AZUL="\033[34m"
    RESET="\033[0m"

    #Comprobación de que existe el historial de bash.
    if [ ! -f ~/.bash_history ]; then
        printf "${ROJO}No se encontró el archivo del historial.${RESET}"
        return 1
    fi

    #Cabecera
    printf "${AZUL}======================================${RESET}"
    printf "${VERDE}    TOP 10 COMANDOS MÁS USADOS${RESET}"
    printf "${AZUL}======================================${RESET}\n"

    #Explicación de comandos que se usan en esta función:

    #cat ~/.bash_history   ->   Muestra el historial de comandos.
    #awk '{print $1}'      ->   Obtiene solo el comando principal ( 1ª palabra).
    #sort		       ->   Ordena los comandos.
    #uniq -c	       ->   Cuenta las repeticiones.
    #sort -nr	       ->   Ordena de mayor a menor.
    #head -10	       ->   Muestra los 10 primeros.

    #Comando completo

    cat ~/.bash_history | awk '{print $1}' | sort | uniq -c | sort -nr | head -10 | awk -v color="$AMARILLO" -v reset="$RESET" '{print color $1 " veces -> " $2 reset}'

}

f_ranking_comandos
