---
permalink: como-modificar-mi-archivo-de-hosts/
audit_date: '2018-09-05'
title: Como modificar mi archivo de hosts?
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-09-05'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

Modificar su archivo **hosts** le permite invalidar el sistema de nombres de
dominio (DNS) para un dominio en una máquina específica. Este proceso es útil
cuando desea realizar las siguientes tareas:

- Probar su sitio sin el enlace de pruebas antes de publicarlo con SSL.
- Verificar que un sitio alias funcione antes de los cambios al DNS.
- Trabajar en otras tareas relacionadas con el DNS.

Modificar su archivo hosts provocará que su máquina local vea directamente
hacia la dirección protocolo de internet (IP) que especifique.

Modificar el archivo hosts exige añadirle dos entradas. Cada entrada contiene
la dirección IP a la que quiere que resuelva el sitio y una versión de la
dirección de internet. Por ejemplo, añada los siguientes dos puntos de
entrada, **www.domain.com** y **domain.com**, al clúster PHP5 (PHP5-ITK)
renovado de Rackspace:

    64.49.219.194 www.domain.com
    64.49.219.194 domain.com

Este artículo brinda instrucciones para localizar y editar el archivo
**hosts** en los siguientes sistemas operativos:

- Microsoft&reg; Windows&reg; 10, Windows 8, Windows 7 y Windows Vista&trade;
- Microsoft Windows NT&trade;, Windows 2000, y Windows XP
- Linux&reg;
- MacOS&reg; X versiones 10.0 a 10.1.5
- MacOS X versiones 10.6 a 10.12

Después de añadir la información de dominio y salvar el archivo, su sistema
comienza a resolver a la dirección IP que especificó. Cuando termine con las
pruebas, remueva estas entradas.

### Windows

Windows 10, Windows 8, Windows 7 y Windows Vista utilizan User Account Control
(UAC). Como resultado, debe ejecutar Microsoft Notepad (Bloc de notas) como
administrador.


#### Windows 10 y Windows 8

Siga las instrucciones que se muestran a continuación si utiliza Windows 10 o
Windows 8:

1. Presione la tecla **Windows**.
2. Teclee **Notepad** (Bloc de notas) en el campo de búsqueda.
3. En los resultados de búsqueda, dé clic derecho en **Notepad** (Bloc de
   notas) y elija **Ejecutar como administrador** (Run as administrator).
4. En Notepad (Bloc de notas), abra el siguiente archivo:

    **c:\Windows\System32\Drivers\etc\hosts**
5. Haga los cambios necesarios al archivo.
6. Elija **Archivo > Guardar** (File > Save) para guardar sus cambios.

#### Windows 7 y Windows Vista

Siga las instrucciones que se muestran a continuación si utiliza Windows 7 o
Windows Vista:

1. Elija **Inicio > Todos los programas > Accesorios**
   (Start > All Programs > Accessories).
2. Dé clic derecho en **Notepad** (Bloc de notas) y elija **Ejecutar como
   administrador** (Run as administrator).

     La ventana UAC Windows necesita su autorización (Windows needs your
     permission) aparece.
3. Dé clic en **Continuar** (Continue) para otorgar autorización.

    Bloc de notas (Notepad) inicia.
4. En Bloc de notas (Notepad), elija **Archivo > Abrir** (File > Open).
5. En el campo **Nombre de archivo** (File name), escriba la siguiente ruta:

    **C:\Windows\System32\Drivers\etc\hosts**
6. Elija **Abrir** (Open).
7. Haga los cambios necesarios al archivo.
8. Elija **Archivo > Guardar** (File > Save) para guardar sus cambios.

#### Windows NT, Windows 2000 y Windows XP

Siga las instrucciones que se muestran a continuación si utiliza Windows NT,
Windows 2000 o Windows XP:

1. Elija **Inicio > Todos los programas > Accesorios > Bloc de notas**
   (Start > All Programs > Accessories > Notepad).
2. Elija **Archivo > Abrir** (File > Open).
3. En el campo **Nombre de archivo** (File name), escriba
   **C:\Windows\System32\Drivers\etc\hosts**.
4. Elija **Abrir** (Open).
5. Haga los cambios necesarios al archivo.
6. Elija **Archivo > Guardar** (File > Save) para guardar sus cambios.

### Linux

Siga las instrucciones que se muestran a continuación si utiliza Linux:

1. Abra una ventana de Terminal.
2. Escriba el siguiente comando para abrir el archivo hosts en un editor de
   texto:

        sudo nano /etc/hosts

3. Escriba su contraseña de usuario de dominio.
4. Haga los cambios necesarios al archivo.
5. Presione **Ctrl+X**.
6. Cuando se le pregunte si quiere guardar los cambios, presione **y**.

### MacOS X versiones 10.0 a 10.12

Esta sección muestra instrucciones para modificar su archivo hosts si utiliza
MacOS X 10.0 a 10.12.

### MacOS X 10.0 a 10.1.5

Siga las instrucciones que se muestran a continuación si utiliza MacOS X 10.0
a 10.1.5:

1. Abra **/Applications/Utilities/NetInfo Manager**.
2. Para habilitar la edición de la base de datos Network Information
   (NetInfo), dé clic en el icono de candado en la esquina inferior izquierda
   de la ventana.
3. Escriba su contraseña de usuario de dominio y elija **OK**.
4. En la segunda columna de la vista de navegador, elija el nodo llamado
   **machines**.
5. En la tercera columna, elija el nombre de entrada localhost.
6. Del menú **Edit**, elija **Duplicate**.

    Una alerta de confirmación aparece.
7. Dé clic en **Duplicate**.

    Una nueva entrada llamada localhost copy aparece y sus propiedades
    aparecen debajo de la vista de navegador.
8. Dé doble clic en el valor de la propiedad de ip_address y escriba la
   dirección IP de la otra computadora.
9. Dé doble clic en el valor de propiedad name e ingrese el nombre de host que
   quiera utilizar para la otra computadora.
10.	Dé clic en la propiedad serves y elija **Borrar** (Delete) del menú
    **Editar** (Edit).
11.	Del menú **File** (Archivo), elija **Save** (Guardar).

     Una alerta de confirmación aparecerá.
12.	Dé clic en **Update this copy** (Actualizar esta copia).
13.	Repita los pasos 6 al 12 para cada entrada de host adicional que quiera
    añadir.
14.	En el menú **NetInfo Manager** elija **Quit**.

No necesita reiniciar su computadora.

### MacOS X 10.6 a 10.12

Siga las instrucciones que se muestran a continuación si utiliza MacOS X 10.6
a 10.12:

1. En su computadora, elija **Applications > Utilities > Terminal**
   (Aplicaciones > Utilidades > Terminal) para abrir una ventana de Terminal.
2. Teclee el siguiente comando en la ventana Terminal para abrir el archivo
   **hosts**:

        sudo nano /private/etc/hosts

3. Cuando se le solicite, teclee su contraseña de usuario de dominio.
4. Edite el archivo **hosts**.

    El archivo contiene comentarios (líneas que comienzan con el símbolo #) y
    algunos mapeos de nombre de host por defecto (por ejemplo, 127.0.0.1 –
    local host). Añada nuevos mapeos después de los mapeos por defecto.
5. Para guardar el archivo hosts, presione **Ctrl+X**.
6. Cuando se le pregunte si quiere guardar los cambios, presione **y**.
7. Para hacer que sus cambios surtan efecto, limpie el caché DNS con el
   siguiente comando:

        dscacheutil -flushcache
