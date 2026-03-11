#!/usr/bin/env bash
# Main script - Gestión de sistema y paquetes
# Usa: source ./libreria.sh && ./main.sh

# Cargar librería (ajusta la ruta si es necesario)
if [ -f "prueba.sh" ]; then
    . prueba.sh
else
    echo "Error: No se encontró libreria.sh" >&2
    exit 1
fi

# Función principal con menú
main_menu() {
    while true; do
        clear
        printf '\n%s=== GESTIÓN DE PAQUETES Y SISTEMA ===%s\n' "$azul" "$reset"
        printf '1) Buscar paquete de binario\n'
        printf '2) Verificar paquete instalado\n'
        printf '3) Verificar paquete disponible\n'
        printf '4) ¿Eres root?\n'
        printf '5) Verificar binario instalado\n'
        printf '6) Test conexión internet\n'
        printf '7) Top 10 comandos más usados\n'
        printf '8) Ayuda completa\n'
        printf '0) Salir\n\n'
        printf '%sOpción (0-8): %s' "$azul" "$reset"
        
        read opcion
        
        case $opcion in
            1)
                f_buscar_paquetes
                read -p "Presiona Enter para continuar..."
                ;;
            2)
                f_paquete_instalado
                read -p "Presiona Enter para continuar..."
                ;;
            3)
                f_paquete_disponible
                read -p "Presiona Enter para continuar..."
                ;;
            4)
                f_eres_root
                read -p "Presiona Enter para continuar..."
                ;;
            5)
                f_bin_instalado
                read -p "Presiona Enter para continuar..."
                ;;
            6)
                f_hay_conexion
                read -p "Presiona Enter para continuar..."
                ;;
            7)
                f_ranking_comandos
                read -p "Presiona Enter para continuar..."
                ;;
            8)
                f_ayuda
                read -p "Presiona Enter para continuar..."
                ;;
            0)
                printf '%s¡Hasta luego!%s\n' "$exito" "$reset"
                exit 0
                ;;
            *)
                printf '%sOpción inválida%s\n' "$error" "$reset"
                sleep 1
                ;;
        esac
    done
}

# Verificar parámetros mínimos (opcional)
f_parametros "$@"

# Ejecutar menú principal
main_menu
