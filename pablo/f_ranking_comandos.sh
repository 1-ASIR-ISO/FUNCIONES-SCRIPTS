#!/usr/bin/env bash
# Autor: Pablo Villalón Alfaro
# Fecha: 10/03/2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_ranking_comandos
# Descripción: Muestra los 10 comandos más utilizados por el usuario.
# Parámetros Entrada: 0
# Parámetros Salida: Muestra el Top 10 de los comandos más utilizados por el usuario
# ordenado de mayor a menor con el nº de veces que se ha ejecutado cada uno.

f_ranking_comandos() {

    #Comprobación de que existe el historial de bash.
    if [ ! -f ~/.bash_history ]; then
        printf "${error}No se encontró el archivo del historial.${reset}"
        return 1
    fi

    #Cabecera
    printf "${azul}======================================${reset}\n"
    printf "${exito}     TOP 10 COMANDOS MÁS USADOS${reset}\n"
    printf "${azul}======================================${reset}\n"

    #Explicación de comandos que se usan en esta función:

    #cat ~/.bash_history   ->   Muestra el historial de comandos.
    #awk '{print $1}'      ->   Obtiene solo el comando principal ( 1ª palabra).
    #sort                      ->   Ordena los comandos.
    #uniq -c           ->   Cuenta las repeticiones.
    #sort -nr          ->   Ordena de mayor a menor.
    #head -10          ->   Muestra los 10 primeros.

    #Comando completo

    cat ~/.bash_history | awk '{print $1}' | sort | uniq -c | sort -nr | head -10 | awk '{printf "%3d → %s\n", $1, $2}'

}

f_ranking_comandos
