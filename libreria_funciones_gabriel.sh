#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Descripción: funcion dedicada a buscar paquetes en el sistema a traves del binario que pasa el usuario como argumento
# Fecha: 09-3-2026

error=$'\e[31m'      
azul=$'\e[1;34m'
exito=$'\e[32m'
reset=$'\e[0m'

# =========================================
f_uid() {
    id -u
}

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

# =========================================
f_listar_interfaces() {
    echo "${azul}📡 INTERFACES DE RED DETECTADAS:${reset}"
    mapfile -t interfaces < <(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(enx|wlp|eth|wlan|docker|virbr)')
    
    if [ ${#interfaces[@]} -eq 0 ]; then
        echo "${error}❌ No se detectaron interfaces${reset}"
        return 1
    fi
    
    local i=1
    for iface in "${interfaces[@]}"; do
        echo "  $i) $iface"
        ((i++))
    done
    echo
}

f_elegir_interfaz() {
    f_listar_interfaces || return 1
    
    echo -n "${azul}Elige número (1-${#interfaces[@]}) o 0=salir: ${reset}"
    read opcion
    
    if [ "$opcion" = "0" ]; then
        return 1
    fi
    
    mapfile -t interfaces < <(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(enx|wlp|eth|wlan|docker|virbr)')
    INTERFAZ="${interfaces[$((opcion-1))]}"  # <-- SIN 'local' = GLOBAL
    
    if [ -n "$INTERFAZ" ]; then
        echo "${exito}✅ Seleccionada: $INTERFAZ${reset}"
        echo "INTERFAZ=$INTERFAZ"  # Debug
        return 0
    else
        echo "${error}❌ Opción inválida${reset}"
        return 1
    fi
}

f_mi_ip() {
    local iface="${INTERFAZ:-enx00e04c680be7}"  # Usa variable global SIEMPRE
    local ip
    
    echo "${azul}Usando interfaz: $iface${reset}"  # DEBUG
    
    ip=$(ip a show "$iface" 2>/dev/null | grep -oP 'inet \K[0-9.]+(?=/)' | head -n1)
    
    if [ -n "$ip" ]; then
        echo "${exito}✅ IP $iface: $ip${reset}"
        return 0
    else
        echo "${error}❌ $iface sin IP (DOWN/no carrier)${reset}"
        return 1
    fi
}
