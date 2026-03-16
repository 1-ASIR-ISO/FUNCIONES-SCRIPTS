#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Fecha: 16-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_borrar_duplicados
# Descripción: Identifica y Elimina archivos duplicados en un directorio basado en su hash (contenido) y opcionalmente por patrón de nombre.
# Parametros Entrada: $1: Ruta del directorio, $2: Modo (CHECK(listar), DELETE (borrar))
# Parametros Salida: 0 existe y 1 no existe directorio o no hay permisos.

f_borrar_duplicados() {
    local dir="$1"
    local modo="${2^^}"

    # ── Validación del directorio ──────────────────────────
    if [[ -z "$dir" ]]; then
        echo "[ERROR] Debes indicar un directorio." >&2
        return 1
    fi

    if [[ ! -d "$dir" ]]; then
        echo "[ERROR] El directorio '$dir' no existe." >&2
        return 1
    fi

    if [[ ! -r "$dir" ]]; then
        echo "[ERROR] Sin permisos de lectura en '$dir'." >&2
        return 1
    fi

    # ── Validación del modo ────────────────────────────────
    if [[ "$modo" != "CHECK" && "$modo" != "DELETE" ]]; then
        echo "[ERROR] Modo inválido: '$modo'. Usa CHECK o DELETE." >&2
        return 1
    fi

    # ── Calcular hashes y detectar duplicados ──────────────
    echo "[INFO] Analizando: $dir"
    echo "[INFO] Modo: $modo"
    echo "---"

    local duplicados=0
    local liberado=0
    local tamano=0          # FIX: declarar fuera del bucle
    declare -A primero

    while IFS= read -r linea; do
        local hash ruta
        hash=$(echo "$linea" | awk '{print $1}')
        ruta=$(echo "$linea" | cut -d' ' -f2-)

        if [[ -z "${primero[$hash]+x}" ]]; then
            primero[$hash]="$ruta"
        else
            # FIX: sin 'local', usando --format portable
            tamano=$(stat --format="%s" "$ruta" 2>/dev/null || echo 0)
            duplicados=$((duplicados + 1))
            liberado=$((liberado + tamano))

            echo "[DUPLICADO] $ruta"
            echo "  Original: ${primero[$hash]}"
            printf "  Tamaño:   %s bytes\n" "$tamano"

            if [[ "$modo" == "DELETE" ]]; then
                rm -f "$ruta" && echo "  [BORRADO]" || echo "  [ERROR al borrar]" >&2
            fi
        fi
    done < <(find "$dir" -type f \
        ! -path "/proc/*" \
        ! -path "/sys/*" \
        ! -path "/dev/*" \
        ! -path "/run/*" \
        -exec md5sum {} + 2>/dev/null | sort)

    # ── Resumen ────────────────────────────────────────────
    echo "---"
    echo "[RESUMEN] Duplicados encontrados : $duplicados"
    printf "[RESUMEN] Espacio recuperable    : %s bytes\n" "$liberado"

    if [[ "$modo" == "CHECK" ]]; then
        echo "[INFO] Modo CHECK: ningún archivo fue eliminado."
    else
        echo "[INFO] Modo DELETE: duplicados eliminados."
    fi

    return 0
}

f_borrar_duplicados $1 $2
echo $?
