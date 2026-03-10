#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Descripción: funcion dedicada a buscar paquetes en el sistema a traves del binario que pasa el usuario como argumento
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

f_buscar_paquetes() {
    echo -n "Introduce la ruta al binario: "
    read binario
    if [ -z "$binario" ]; then
        echo "❌ Debes introducir un binario$ correcto ❌" >&2
        return 1
    fi
    paquete=$(dpkg -S "$binario" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        echo "✅ Paquete: $paquete ✅"
        return 0
    else
        echo "❌ Paquete no encontrado para '$binario'❌"
        return 1 
    fi
}

f_paquete_instalado() {
    echo -n "Introduce nombre del paquete: "
    read paquete
    if [ -z "$paquete" ]; then
        echo "❌ Debes introducir un paquete valido" >&2
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        echo "✅ $paquete ESTÁ INSTALADO"
        return 0
    else
        echo "❌ $paquete NO está instalado"
        return 1
    fi
}

f_buscar_paquetes
f_paquete_instalado
