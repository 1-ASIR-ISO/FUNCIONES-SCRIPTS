#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Fecha: 16-03-2026

error="\e[31m"
azul="\e[1;34m"
exito="\e[32m"
reset="\e[0m"

# =========================================
# Nombre: f_logs
# Descripción: Registra un evento en un archivo de log cronológico.
# Parametros Entrada: $1  Mensaje de texto a registrar (Obligatorio), $2 Ruta del archivo de log. Por defecto /var/log/sysadmin.log.
# Parametros Salida: 0 Registro guardado correctamente, 1 Error de permisos al escribir en el archivo

f_log() {
    local mensaje="$1"
    local log_file="${2:-/var/log/sysadmin.log}"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    # ── Validación del mensaje ─────────────────────────────
    if [[ -z "$mensaje" ]]; then
        echo "[ERROR] El mensaje no puede estar vacío." >&2
        return 1
    fi

    # ── Crear el archivo si no existe ─────────────────────
    if [[ ! -f "$log_file" ]]; then
        mkdir -p "$(dirname "$log_file")" 2>/dev/null
        touch "$log_file" 2>/dev/null
    fi

    # ── Validar permisos de escritura ──────────────────────
    if [[ ! -w "$log_file" ]]; then
        echo "[ERROR] Sin permisos de escritura en '$log_file'." >&2
        return 1
    fi

    # ── Escribir en el log ─────────────────────────────────
    printf '[%s] %s\n' "$timestamp" "$mensaje" >> "$log_file" 2>/dev/null

    if [[ $? -ne 0 ]]; then
        echo "[ERROR] No se pudo escribir en '$log_file'." >&2
        return 1
    fi

    return 0
}

f_log $1 $2
echo $?
