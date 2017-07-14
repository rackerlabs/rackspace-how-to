---
permalink: como-modificar-mi-archivo-de-hosts/
audit_date:
title: Como modificar mi archivo de hosts?
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-02-09'
last_modified_by: Joe Ashcraft
product: Cloud DNS
product_url: cloud-dns
---

La modificación de su archivo de hosts le permitirá anular el DNS para un dominio, en esa máquina en particular. Esto se puede utilizar para evaluar su sitio sin el enlace de prueba, antes de salir en vivo con SSL, verificar que el alias de un sitio funcione antes de los cambios de DNS, o para otras razones relacionadas con el DNS. Esto hace que su máquina local solo busque directamente en el IP especificado.

Su archivo de hosts necesitará dos entradas agregadas que contendrán la dirección de IP que quiere que el sitio resuelva y la dirección. Agregar las siguientes dos líneas, por ejemplo, dirigirá www.dominio.com y dominio.com a nuestro clúster PHP5-ITK (PHP5 "actualizado") actual:

    64.49.219.194 www.domain.com
    64.49.219.194 domain.com

A continuación se detalla cómo ubicar y editar el archivo de hosts en plataformas de varios sistemas operativos. Una vez que se agregue la información de dominio adecuada, guardará el archivo y su sistema comenzará a resolver el IP especificado. Luego de que finalicen las evaluaciones, estas entradas deberían eliminarse.

-  Windows 8, Windows 7, y Windows Vista
-  Windows NT, Windows 2000, y Windows XP
-  Linux
-  Mac OS X 10.0 - 10.1.5
-  Mac OS X 10.6 - 10.10  

### Windows 8, Windows 7 y Windows Vista

Windows 8, Windows 7 y Windows Vista usan el Control de cuentas de usuario (UAC, por sus siglas en inglés), así que el Bloc de notas debe ejecutarse como Administrador.

**Para Windows 8**

1.  Presione la tecla Windows.
2.  Escriba **Bloc de notas** en el campo de búsqueda.
3.  En el campo de búsqueda, presione con el botón derecho del ratón el **Bloc de notas** y seleccione **Ejecutar como administrador**.
4.  En el Bloc de notas, abra el siguiente archivo: **c:\Windows\System32\Drivers\etc\hosts**
5.  Realice los cambios necesarios para el archivo de hosts.
6.  Presione **Archivo > Guardar** para guardar los cambios.

**Para Windows 7 y Windows Vista**

1.  Presione **Iniciar > Todos los programas > Accesorios**.
2.  Presione con el botón derecho del ratón el Bloc de notas y seleccione **Ejecutar como administrador**.
3.  Presione **Continuar** en la ventana de UAC "Windows necesita su permiso".
4.  Cuando el Bloc de notas se abra, presione **Archivo > Abrir**.
5.  En el campo de nombre de archivo, escriba: **C:\Windows\System32\Drivers\etc\hosts**
6.  Presione **Abrir**.
7.  Realice los cambios necesarios para el archivo de hosts.
8.  Presione **Archivo > Guardar** para guardar los cambios.

**Windows NT, Windows 2000, y Windows XP**

1.  Presione **Iniciar > Todos los programas > Accesorios > Bloc de notas**.
2.  Presione **Archivo > Abrir**.
3.  En el campo de nombre de archivo, escriba: **C:\Windows\System32\Drivers\etc\hosts**
4.  Presione **Abrir**.
5.  Realice los cambios necesarios para el archivo de hosts.
6.  Presione **Archivo > Guardar** para guardar los cambios.

### Linux

1. Abra una ventana de terminal.

2. Abra el archivo de hosts en un editor de texto (puede utilizar cualquier editor de texto):

       sudo nano /etc/hosts

3. Ingrese su contraseña

4. Realice los cambios necesarios para el archivo de hosts.

5. Presione **control X** (mantenga control y presione X), luego conteste **y** cuando le pregunten si quiere guardar los cambios.

### Mac OS X 10.0 - 10.8

**Mac OS X 10.0 - 10.1.5**

1. Abra **Aplicaciones > Utilidades > Gestor NetInfo**.

2. Para permitir la edición de la base de datos de NetInfo, presione el candado en la esquina inferior izquierda de la ventana.

3. Ingrese su contraseña y presione **OK**.

4. En la segunda columna de la ventana del navegador, seleccione el nodo llamado `machines`. Verá entradas para `-DHCP-`, `broadcasthost`, y `localhost` en la tercera columna.

5. Seleccione el elemento `localhost` en la tercera columna.

6. Elija **Duplicar** en el menú **Editar** (la manera más rápida de crear una nueva entrada es duplicar una existente). Aparecerá una alerta de confirmación.

7. Presione **Duplicar**. Una nueva entrada llamada `localhost` copy y sus propiedades se muestran debajo de la ventana del navegador.

8. Presione dos veces el valor de la propiedad `ip_address` e ingrese la dirección de IP de la otra computadora.

9. Presione dos veces el valor de la propiedad `name` e ingrese el nombre de host que desea para la otra computadora.

10. Presione la propiedad `serves` y elija **Eliminar** desde el menú **Edición**.

11. Elija **Guardar** en el menú **Archivo**. Aparecerá una alerta de confirmación.

12. Presione **Actualizar esta copia**.

13. Repita los pasos 6 al 12 para cada entrada host adicional que desee agregar.

14. Seleccione **Salir** del menú de Gestor NetInfo. No es necesario que reinicie la computadora.

**Mac OS X 10.6 - 10.10**

1. Abra **Aplicaciones > Utilidades > Terminal**.

2. Abra el archivo de hosts ingresando lo siguiente en la ventana Terminal:

        sudo nano /private/etc/hosts

  Escriba su contraseña de usuario cuando sea solicitada.

3. Edite el archivo de hosts. El archivo de hosts contiene algunos comentarios (las líneas que comienzan con el símbolo # ), y algunos mapeos de nombres de hosts predeterminados (por ejemplo, 127.0.0.1 - local host). Anexe sus mapeos nuevos debajo de los mapeos predeterminados.

4. Guarde el archivo de hosts al presionar *Control+x* y contestar *y*.

5. Para que se apliquen sus cambios, vacíe la caché del DNS con el siguiente comando:

       dscacheutil -flushcache

6. Ahora se aplicarán los nuevos mapeos.
