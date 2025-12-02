# DPKG (Debian package)

### Tipo
    * Herramienta de bajo nivel para manejar paquetes .deb

### Archivos importantes
    - /var/lib/dpkg     Base de datos de paqutes instalados
    - /etc/dpkg/dpkg.cfg        Configuracion 

### Caracteristicas 
    * Gestiona instalación directa de .deb
    * No resuelve dependencias automáticamente
    * Mantiene scripts de control (preinst, postinst, prerm, postrm)

### Cosas a considerar
    * Si el archivo /var/lib/dpkg/status se corrompe, se rompe el sistema de paquetes
    * APT depende totalmente de DPKG



# APT (Advanced Pakage Tool)
### Tipo
    * Gestor de alto nivel para Debian/Ubuntu

### Archivos importantes
    - /etc/apt/sources.list → Lista principal de repositorios
    - /etc/apt/sources.list.d/*.list → Repos adicionales
    - /var/lib/apt/lists/ → Índices descargados de paquetes
    - /var/cache/apt/archives/ → Caché de paquetes .deb descargados
    - /etc/apt/apt.conf → Configuración global
    - /etc/apt/apt.conf.d/ → Configs fragmentadas

### Carcateristicas
    * Usa DPKG como backend
    * Resuelve dependencias automáticamente
    * Trabaja con repositorios en línea o locales

### Cosas a considerar
    * La caché vieja en /var/lib/apt/lists/ puede causar inconsistencias
    * Permite pins, prioridades y repos personalizados


# RPM (Red Hat Pakage Manager)
### Tipo 
    * Herramienta de bajo nivel para paquetes .rpm
    
### Archivos y directorios importantes
    - /var/lib/rpm/   Contiene la base de datos de RPM (Paquetes instalados, scripts, dependencias)
    - /etc/rpm/   Configuracion global de RPM
    - /usr/lib/rpm/     Macros, scripts y librerias que usa RPM

### Carcateristicas
    * Maneja paquetes de forma individual
    * No resuelve dependencias por sí mismo
    * Mantiene metadatos detallados (scripts pre/post, requerimientos, propiedades

### Cosas a considerar
    * Si la base de datos en /var/lib/rpm se corrompe, el sistema no puede instalar nada
    * Útil para inspeccionar paquetes sin instalar
    * Es el backend de YUM/DNF y Zypper



# YUM (Yellowdog Updater, Modified)
### Tipo
    * Gestor de paquetes de alto nivel para sistemas basados en RPM

### Archivos importantes
    - /etc/yum.conf → Configuración principal
    - /etc/yum.repos.d/*.repo → Archivos de repositorios
    - /var/cache/yum/ → Caché, metadatos y cabeceras descargadas
    - /usr/lib/yum-plugins/ → Plugins para funcionalidad extra

### Carcateristicas
    * Usa RPM por debajo, pero añade resolucion automatica de dependencias

### Cosas a considerar
    * Obsoleto en RHEL 8, Fedora y derivados (sustituido por DNF)
    * Problemas al corromperse la caché (metadatos incorrectos)

# DNF (Dandified YUM)
### Tipo
    * Evolucion moderna de YUM

### Archivos importantes
    - /etc/dnf/dnf.conf → Configuración principal
    - /etc/yum.repos.d/*.repo → Repositorios (igual que YUM)
    - /var/cache/dnf/ → Caché de paquetes y metadatos
    - /usr/lib/dnf/ → Módulos internos

### Caracteristicas
    * Mejor gestion de dependencias que YUM
    * Usa una base de datos mas limpia y rapida
    * Soporta extensiones en Python

### Cosas a considerar
    * Es el gestor predeterminado en RHEL 8+, Fedora, CentOS Stream
    * Administra mejor los conflictos de paquetes que YUM


# Zypper (openSUSE / SLES)
### Tipo
    * Gestor de paquetes de alto nivel basado en RPM

### Archivos importantes
    - /etc/zypp/zypp.conf → Archivo principal de configuración
    - /etc/zypp/repos.d/*.repo → Repositorios de Zypper
    - /var/cache/zypp/ → Caché de paquetes descargados
    - /var/lib/zypp/ → Base de datos del sistema de paquetes
    - /usr/lib/zypp/ → Librerías internas

### Carcateristicas
    * “Libzypp” es una librería muy potente para resolver dependencias
    * Implementa snapshots cuando se usa con Btrfs (rollback del sistema)

### Cosas a considerar
    * Es uno de los gestores más robustos para dependencias
    * Interactúa estrechamente con “snapper” en sistemas con Btrfs


















dnf repolist   Para listar solo los repositorios habilitados/deshabilitados, agregamos la opcion (--enabled/--disabled)

dnf config-manager --add-repo URL    Agregar un repositorio
dnf config-manager --set-enabled REPO_ID   Para habilitar un repositorio
dnf config-manager --set-disabled REPO_ID   Para deshabilitar un repositorio
    ++ Los repositorios agregados estan habilitados por defecto
    ++ Los repositorios se almacenan en archivos .repo  en el directorio /etc/yum.repos.d/, con la misma sintaxis que yum



