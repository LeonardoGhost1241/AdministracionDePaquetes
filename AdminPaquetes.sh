#/bin/bash
#



echo "============================"
echo "ADMINISTRACION DE PAQUETERIA"
echo "============================"

echo "Seleccione su gestor de paquete "

nameP="PAQUETE"


dpkg(){
	clear	
	opt=("Instalar paquete" "Obtener informacion de un paquete" "Lista de paquetes instalados en el sistema" "Obtener lista de un archivo instalado por un paquete" "eliminar paquete (conserva sus archivos)" "eliminar paquete (elimina tambien sus archivos)" "Encontrar origen de un archivo especifico" "Reconfigurar un paquete" "regresar")

	getName(){		
		read -p "Nombre del paquete" NamePakage
	}

	PS3="DPKG> "

	select option in "${opt[@]}"; do
		case $REPLY in ## Usamos $REPLY En lugar de comparar con el texto de las opciones, usa $REPLY, que contiene el número de la opción seleccionada por el usuario 
			1)	echo "dpkg -i $nameP"	;;
			2)
				echo "dpkg -I $nameP"	;;
			3)
				echo "dpkg --get-selections "	;;
			4)
				echo "dpkg -L $nameP"	;;
			5)
				echo "dpkg -r $nameP"	;;
			6)
				echo "dpkg -P $nameP" 	;;
			7)	echo "dpkg-query -S FILENAME" ;;

			8)	echo "dpkg-reconfigure $nameP" ;;

			9)
				Menu
				return
				;;
			*) default ;;
		esac
	done
}


apt(){
	PS3="APT> "

	opc=("Instalar un paquete" "eliminar un paquete (conservar sus archivos)" "Eliminar un paquete (Eliminar tambien sus archivos)" "Actualizar uno o mas paquetes" "Arreglar dependencias rotas" "Comando apt-cache" "Comando apt-file")


	select opc in "${opc[@]}"; do
		case $REPLY in 
			1) echo "apt install $nameP" ;;
			2) echo "apt remove $nameP" ;;
			3) echo "apt purge $nameP  / apt --purge $nameP" ;;
			4) echo "apt update $nameP  / apt update" ;;
			5) echo "apt install -f" ;;
			6) aptCache ;;
			7) aptFile ;;
			8) Menu return ;;
			*) default ;;
		esac

	done
}


aptCache(){
	clear
	select opt in "buscar un paquete" "Mostrar informacion de un paquete" "Limpiar la cache de apt" "Regresar"; do
		case $REPLY in
			1) echo "apt-cache search $nameP" ;;
			2) echo "apt-cache show $nameP" ;;
			3) echo "apt clean" ;; 
			4) return ;;
			*) default ;;
		esac		
	done
}


aptFile(){
	clear
	select opt in "Actualizar la cache" "Enumerar contenido de un paquete" "regresar"; do
		case $REPLY in 
			1) echo "apt-file update" ;;
			2) echo "apt-file list $nameP" ;;
			3) return ;;
			*) default ;;
		esac
	done

}


rpm(){
	PS3="rpm> "

	opt=("")

	select


}



default(){
echo "Opcion no encontrada"
}

Menu(){
clear

PS3="paquete>"
echo '''
Seleccione su gestor de paquetes
1) DPKG
2) APT
3) RPM
4) YUM
5) DNF
6) ZYPPER
7) salir
'''
}

while true; do

	PS3="paquete>"

	select paquete in DPKG APT RPM YUM DNF ZYPPER salir; do
	       case $paquete in
			DPKG)	  
			       echo "dpkg"
			       dpkg
			       ;;
			APT)
				echo "apt"
				apt
				;;
			RPM)	
				echo "rpm"
				;;
			YUM)
				echo "rpm"
				;;
			DNF)
				echo "dnf"
				;;
			ZYPPER)
				echo "zypper"
				;;
			salir)
				echo "Saliendo..."
				exit 0
				;;
			*)
				echo "Opcion no encontrada"
				;;
		esac
	done
done

