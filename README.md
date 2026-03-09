# FUNCIONES-SCRIPTS
repositorio dedicado a crear funciones del modulo Implantación Sistemas Operativos para scripts


----------------------------------------------------------------------------------------------------------------------

ISMAEL:

f_ayuda
Muestra por pantalla la sintaxis correcta del script, descripción de lo que hace el script así como los parámetros aceptados.

f_parametros
Comprueba que se han introducido argumentos al script.

f_ranking_comandos
Indica los 10 comandos más utilizados en la shell

----------------------------------------------------------------------------------------------------------------------


ADRIÁN:

f_bin_instalado
Función que devuelve cero en caso de estar instalado el binario que se pasa como argumento.y uno en caso contrario,

f_hay_conexion
Devuelve cero en caso de tener conexión a red, uno en caso contrario.

----------------------------------------------------------------------------------------------------------------------

SERGIO:

f_eres_root
Devuelve cero en caso de estar validado en la shell como root, uno en caso contrario.

f_paquete_disponible
Devuelve cero en caso de estar disponible en el repositorio configurado en sources.list, uno en caso contrario. Se pasa el nombre del paquete como argumento.

----------------------------------------------------------------------------------------------------------------------

GABRIEL:

f_paquete_instalado
Devuelve cero en caso de estar instalado el paquete pasado como argumento, uno en caso contrario.

f_buscar_paquetes
Devuelve el nombre del paquete al que pertenece el binario que se pasa como argumento

f_uid
Indica el uid del usuario actual de la shell
