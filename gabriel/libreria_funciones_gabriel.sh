#!/usr/bin/env bash
# Autor: Gabriel Merencio Ortega
# Descripción: funcion dedicada a buscar paquetes en el sistema a traves del binario que pasa el usuario como argumento
# Fecha: 09-3-2026

error=$'\e[31m'       # Rojo
azul=$'\e[1;34m'      # Azul intenso
exito=$'\e[32m'       # Verde
reset=$'\e[0m'        # Reset

# =========================================

f_uid() {
    id -u
}

f_buscar_paquetes() {
    echo -n "${azul}Introduce la ruta al binario: ${reset}"
    read binario
    if [ -z "$binario" ]; then
        echo "${error}Debes introducir un binario correcto ❌${reset}" >&2
        return 1
    fi
    paquete=$(dpkg -S "$binario" 2>/dev/null | head -n1 | cut -d: -f1)
    if [ -n "$paquete" ]; then
        echo "${exito}Paquete: $paquete ✅${reset}"
        return 0
    else
        echo "${error}Paquete no encontrado para '$binario' ❌${reset}"
        return 1 
    fi
}

f_paquete_instalado() {
    echo -n "${azul}Introduce nombre del paquete: ${reset}"
    read paquete
    if [ -z "$paquete" ]; then
        echo "${error}Debes introducir un paquete valido${reset}" >&2
        return 1
    fi
    if dpkg-query -W -f='${Status}' "$paquete" 2>/dev/null | grep -q "ok installed"; then
        echo "${exito}$paquete ESTÁ INSTALADO${reset}"
        return 0
    else
        echo "${error}$paquete NO está instalado${reset}"
        return 1
    fi
}

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
