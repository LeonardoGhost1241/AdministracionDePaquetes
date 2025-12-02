#/bin/bash
#



echo "============================"
echo "ADMINISTRACION DE PAQUETERIA"
echo "============================"

echo "Seleccione su gestor de paquete "

nameP="PAQUETE"


dpkgF(){
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


aptF(){
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


rpmF(){
	clear
	PS3="rpm> "

	opt=("Instalar un paquete" "Actualizar un paquete instalado" "Solo actualizar un paquete SI ya esta instalado" "eliminar un paquete" "Listar todos los paquetes instalados" "Obtener informacion de un paquete instalado" "Obtener lista de los archivos dentro de un paquete " "Mostrar paquete que posee un archivo especifico" "Regresar")

	select option in "${opt[@]}"; do
		case $REPLY in
			1) echo "rpm -i $nameP" ;; 
			2) echo "rpm -U $nameP" ;;
			3) echo  "rpm -F $nameP" ;;
			4) echo "rpm -evh $nameP" ;; ## Se utiliza v en modo verbose y h para ver el progreso con "#"
			5) echo  "rpm -qa" ;;
			6) echo  "rpm -qi $nameP" ;;
			7) echo  "rpm -ql $nameP" ;; # podemos agregar -p para consultar de un paquete que NO esta instalado
			8) echo "rpm -qf FILENAME" ;;
			9) 	Menu 
				return ;;
			*) default ;;
		esac	
	done
}


yumF(){
	PS3="yum> "

	opt=("Instalar un paquete" "Eliminar un paquete" "Verificar si hay actualizaciones disponibles" "Actualizar un paquete" "Actualizar todo el sistema" "Buscar un paquete" "Saber de que paquete proviene un archivo" "Informacion de un paquete" "Ver lista de repositorios disponibles " "Limpier cache" "Regresar")

	select option in "${opt[@]}"; do 
		case $REPLY in
			1) echo "yum install $nameP" ;;
			2) echo "yum remove $nameP" ;;
			3) echo "yum check-update" ;;
			4) echo "yum update $nameP" ;;
			5) echo "yum update" ;;
			6) echo "yum search PATTERN" ;;
			7) echo "yum whatprovides FILENAME" ;;
			8) echo "yum info $nameP" ;;
			9) echo "yum repolist all" ;;
			10) echo "yum clean" ;;
			11) Menu ; return ;;
			*) default ;;
		esac
	done
}




dnfF(){
	clear
	PS3="dnf> "

	opt=("Instalar un paquete" "Eliminar un paquete" "Buscar paquetes" "Obtener informacion de un paquete" "Actualizar todos los paquetes" "Actualizar un paquete en especifico" "Encontrar que paquete proporciona un archivo especifico" "Listar todos los paquetes instalados en el sistema" "Regresr")

	select option in "${opt[@]}"; do
		case $REPLY in
			1) echo "dnf install $nameP" ;;
			2) echo "dnf remove $nameP" ;;
			3) echo "dnf search PATTERN" ;;
			4) echo "dnf info $nameP" ;;
			5) echo "dnf upgrade" ;;
			6) echo "dnf upgrade $nameP" ;;
			7) echo "dnf provides FILENAME" ;;
			8) echo "dnf list --installed" ;;
			9) 	Menu 
				return ;;
			*) default ;;
		esac
	done
}


zypperF(){
	clear
	PS3="zypper> "

	opt=("Instalar un paquete" "Eliminar un paquete" "Actualizar un paquete" "Ver metadatos de un paquete" "Actualizar lista de repositorios" "Listar las actualizaciones disponibles para el sistema" "Buscar un paquete" "Regresar")


	select option in "${opt[@]}"; do
		case $REPLY in

			1) echo "zypper install $nameP" ;; ##Puedes simplificar la sentencia "install" por "in" 
			2) echo "zypper remove $nameP"  ;; ##Puedes simplificar la sentencia "remove" por "rm"
			3) echo "zypper update $nameP" ;;
			4) echo "zypper info $nameP" ;;
			5) echo "zypper refresh " ;;
			6) echo "zypper list-updates" ;;
			7) echo "zypper search $nameP" ;; ##Puedes simplificar la sentencia "search" por "se"
			8) 	Menu 
				return ;;
			*)  default ;;
		esac
	done



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
			       dpkgF
			       ;;
			APT)
				echo "apt"
				aptF
				;;
			RPM)	
				echo "rpm"
				rpmF
				;;
			YUM)
				echo "yum"
				yumF
				;;
			DNF)
				echo "dnf"
				dnfF
				;;
			ZYPPER)
				echo "zypper"
				zypperF
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

