#!/usr/bin/env sh
# Autor: Grupal
# Descripción: Librería de funciones grupal
# Fecha: 09-3-2026

# Colores ANSI (compatibles bash/sh)
error=$'\033[31m'      # Rojo
azul=$'\033[1;34m'     # Azul intenso
exito=$'\033[32m'      # Verde
reset=$'\033[0m'       # Reset

# =========================================

f_uid() {
    id -u
}

f_buscar_paquetes() {
    printf '%sIntroduce la ruta al binario: %s' "$azul" "$reset"
    read binario
    if [ -z "$binario" ]; then
        printf '%sDebes introducir un binario correcto ❌%s\n' "$error" "$reset" >&2
        return 1
    fi
    paquete=$(dpkg -S "$binario" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        printf '%sPaquete: %s ✅%s\n' "$exito" "$paquete" "$reset"
        return 0
    else
        printf '%sPaquete no encontrado para '%s' ❌%s\n' "$error" "$binario" "$reset"
        return 1
    fi
}

f_paquete_instalado() {
    printf '%sIntroduce nombre del paquete: %s' "$azul" "$reset"
    read paquete
    if [ -z "$paquete" ]; then
        printf '%sDebes introducir un paquete valido%s\n' "$error" "$reset" >&2
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        printf '%s%s ESTÁ INSTALADO%s\n' "$exito" "$paquete" "$reset"
        return 0
    else
        printf '%s%s NO está instalado%s\n' "$error" "$paquete" "$reset"
        return 1
    fi
}

f_paquete_disponible() {
    printf '%sIntroduce el nombre del paquete: %s' "$azul" "$reset"
    read nombre_paquete
    resultado=$(apt-cache policy "$nombre_paquete" 2>/dev/null | grep "Candidato:")
    if [ -n "$resultado" ]; then
        printf '%sPaquete '%s' ESTÁ disponible%s\n' "$exito" "$nombre_paquete" "$reset"
        return 0
    else
        printf '%sPaquete '%s' NO ESTÁ disponible%s\n' "$error" "$nombre_paquete" "$reset"
        return 1
    fi
}

f_eres_root() {
    usuario_id=$(id -u)
    if [ "$usuario_id" = 0 ]; then
        printf '%sEres root%s\n' "$exito" "$reset"
        return 0
    else
        printf '%sNo eres root, hazlo como root%s\n' "$error" "$reset"
        return 1
    fi
}

f_bin_instalado() {
    printf '%sIntroduce nombre del binario: %s' "$azul" "$reset"
    read bin
    if command -v "$bin" >/dev/null 2>&1; then
        printf '%sSí está instalado%s\n' "$exito" "$reset"
        return 0
    else
        printf '%sNo está instalado%s\n' "$error" "$reset"
        return 1
    fi
}

f_hay_conexion() {
    if ping -c 1 -q 8.8.8.8 >/dev/null 2>&1; then
        printf '%sSí hay conexión%s\n' "$exito" "$reset"
        return 0
    else
        printf '%sNo hay conexión%s\n' "$error" "$reset"
        return 1
    fi
}

f_ayuda() {
    printf '%sUso: %s PARAM1 PARAM2\n' "$azul" "$0"
    printf 'Descripción: Librería de funciones para gestión de paquetes y sistema\n'
    printf 'Funciones disponibles:\n'
    printf '  f_buscar_paquetes    - Busca paquete de un binario\n'
    printf '  f_paquete_instalado  - Verifica si paquete está instalado\n'
    printf '  f_paquete_disponible - Verifica disponibilidad en repos\n'
    printf '  f_eres_root          - Comprueba si eres root\n'
    printf '  f_bin_instalado      - Verifica si binario existe\n'
    printf '  f_hay_conexion       - Test de conexión internet\n'
    printf '  f_ranking_comandos   - Top 10 comandos más usados%s\n' "$reset"
}

f_parametros() {
    if [ $# -lt 2 ]; then
        printf '%sFALTAN PARAMETROS%s\n' "$error" "$reset"
        f_ayuda
        exit 1
    fi
}

f_ranking_comandos() {
    if [ ! -f "$HOME/.bash_history" ]; then
        printf '%sNo se encontró ~/.bash_history%s\n' "$error" "$reset"
        return 1
    fi

    printf '%s======================================%s\n' "$azul" "$reset"
    printf '%s    TOP 10 COMANDOS MÁS USADOS%s\n' "$exito" "$reset"
    printf '%s======================================%s\n' "$azul" "$reset"

    cat "$HOME/.bash_history" | awk '{print $1}' | sort | uniq -c | sort -nr | head -10
}
