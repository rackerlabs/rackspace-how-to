---
permalink: migracion-de-nube-a-nube/
audit_date: '2019-08-29'
title: 'Migración de nube a nube'
type: article
created_date: '2019-08-29'
created_by: Lou Navarro
last_modified_date: '2019-08-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Consideraciones Iniciales

Asuntos que deberías considerar antes de la migración:

#### Los cambios en DNS no son automáticos, ¡así que es necesario tener un plan!

Si tu servidor de nube no está detrás de un balanceador de carga, habrá un
cambio de IP. Esto significa que tendrás que modificar tus entradas en DNS
a la nueva IP.  Recomendamos revisar el TTL ("time to live") para asegurar
que tenga un valor bajo (300 segundos / 5 minutos) y esperar al menos 24
horas para que el cambio tome efecto. Este cambio asegura que cualquier
cambio que hagas en tus DNS se propague por el sistema en 5 minutos o menos.

#### ¿Cuál es el propósito de éste servidor?

Es importante tomar tiempo para determinar qué función ejerce el
servidor. ¿Es sólo para aplicaciones web? ¿Hospeda correo electrónico?
¿Existen bases de datos? Una buena evaluación inicial puede ahorrar mucho
tiempo y evitar pánico de último minuto cuando cambies del servidor viejo
al nuevo.  Es importante identificar dónde se encuentran tus datos, archivos
de configuración, etcétera. Tener un buen conocimiento de tu ambiente
ayudará a tener una migración exitosa.

#### ¡Pueba la migración con un colchón de seguridad!

Una de las ventajas de realizar una migración en la nube es lo rápido y
fácil que es crear o eliminar un servidor.  Te recomendamos que una vez que
consideres estar listo para el cambio entre el servidor viejo y el nuevo, que
solo apagues el servidor viejo, no lo elimines todavía. Déjalo en éste
estado entre 24 horas y una semana. Si encuentras que tu sitio web u otra
aplicacación funciona correctamente es probable que puedas dar la migración
por completada. Si al apagar el servidor viejo observas algún problema, es
posible que no hayas migrado todo lo que se debía migrar. Todavía tienes
el servidor viejo así que puedes volver a encenderlo (selecciona la
opción 'reboot' en el portal)

### Realizando el trabajo

#### Revisa el tamaño del servidor viejo

Para determinar el espacio en disco mínimo necesario en tu nuevo
servidor, es necesario saber cuánto ocupa tu viejo servidor.

Puedes usar el siguiente comando para observar el uso en disco de tu
servidor viejo:

    df -h

Si requieres mas de 160Gb (el tamaño máximo de disco para un servidor
tipo 'General Purpose') deberás usar volúmenes de Cloud Block Storage en
el nuevo servidor para almacenar toda tu información.

#### Identificar requerimientos de directorio

Cuando estés configurando los volúmenes de Cloud Block Storage es bueno
revisar el tamaño de los directorios en tu servidor de origen. Esta información
te ayudará a planificar la organización de la información en el nuevo
servidor, detallando qué información se almacenará en el disco de sistema y
qué otra información se almacenará en los volúmenes adicionales.

En Linux puedes determinar el espacio usado por archivos y directorios con el
siguiente comando:

    du -hs *

También puedes especificar el nombre del directorio o archivo con el
siguiente comando:

    du -hs NombredeDirectorio

Una vez que conozcas qué información vas a copiar al disco de sistema, y qué
información copiarás al disco adicional, podrás planificar el tamaño del
nuevo servidor y sus volúmenes adicionales.

#### Crear el servidor destino

Cuando crees el servidor destino es importante considerar los requerimientos
para almacenamiento en disco, al igual que memoria, CPU y redes.

Si el tamaño de tu información excede el tamaño del disco de sistema del
servidor, será necesario decidir si quieres usar uno o más discos adicionales
(servidores tipo I/O solamente) o usar un volumen de Cloud Block Storage.
Es importante considerar los requisitos actuales, al igual que los
requisitos futuros.

Los servidores tipo I/O-optimized no se pueden cambiar de tamaño una vez
creados, así que los únicos cambios que podrás realizar es añadir o eliminar
espacio en disco usando Cloud Block Storage. Los servidores tipo
"General Purpose" tienen un tamaño máximo de 8Gb RAM/160Gb en disco. Solo los
servidores tipo "General Purpose" que no estén usando el modo de virtualización
deprecado paravirtual (PV) pueden modificar su tamaño.

En un ambiente con un solo servidor para cambiar recursos de RAM o CPU será
necesario migrar a un nuevo servidor.

Si prevés que habrá necesidad de incrementar o reducir recursos en tu ambiente
puedes diseñar tu solución para tomar ventaja del escalamiento horizontal.
Usando un balanceador de carga puedes tener múltiples nodos corriendo tu
aplicación y puedes agregar o eliminar nodos a medida que cambie la carga. Cabe
señalar que el escalamiento horizontal no es necesariamente el indicado para
todas las aplicaciones.

El artículo [open cloud reference architectures](https://support.rackspace.com/how-to/rackspace-open-cloud-reference-architecture)
ilustra algunos ejemplos de diferentes ambientes de nube.

**Nota:** Si estás usando servidores tipo Performance es importante observar
que los discos de información no están incluídos cuando generas una imagen.
Para respaldar discos de datos es necesario utilizar el servicio de Rackspace
Cloud Backup u otra solución similar. Si requieres que tu almacenamiento
sea portable o tienes que tomar snapshots recomendamos usar volúmenes de
Cloud Block Storage.

#### Preparar los volúmenes de Cloud Block Storage o discos de datos

Una vez creado el nuevo servidor es necesario preparar los discos de data o
Cloud Block Storage realizando un formateo del disco y configurando el
sistema operativo para usarlos.

Para preparar Cloud Block Storage puedes ver
[Prepare your Cloud Block Storage volume](https://support.rackspace.com/how-to/prepare-your-cloud-block-storage-volume).

Para preparar los discos de datos en servidores tipo I/O-optimized puedes ver
[Prepare data disks on a Linux Cloud Servers](https://support.rackspace.com/how-to/preparing-data-disks-on-linux-cloud-servers).

Si deseas utilizar los discos adicionales en configuración RAID en Linux puedes
ver [Linux Software-RAID HOWTO](http://www.tldp.org/HOWTO/Software-RAID-HOWTO.html).

### Opciones para migración manual

Existen varias opciones para una migración manual en Linux, incluyendo
Rackspace Cloud Backup, Rackspace Cloud Block Storage o rsync.

#### Cloud Backup

Para migrar directorios específicos puedes usar Cloud Backup. Puedes crear un
respaldo de tus datos en el servidor origen y restaurarlo en el servidor
destino.

###Cloud Block Storage

Para migrar datos específicos puedes usar Cloud Block Storage.  Agregas el
disco a tu servidor origen y copias los datos. Luego lo desmontas del
servidor origen, lo montas sobre el servidor destino y copias los datos.

#### rsync en Linux para la migración de directorios

En Linux puedes usar rsync para copiar un directorio por medio de la red
directamente. Por ejemplo, desde el servidor origen puedes correr el siguiente
comando para copiar /var/lib/mysql:

    rsync -e 'ssh' -avl --stats --progress /var/lib/mysql username@123.45.67.89:/var/lib/mysql

**Importante:** Si los dos servidores de nube se encuentran en el mismo centro
de datos regional (DFW, ORD, IAD, LON, HKG, SYD) puedes usar la dirección
IP 10.x asignada a los dos servidores para transferir tu data. Usando esta red
no se cobrará por el uso de ancho de banda entre los servidores. Si
transfieres la data mediante la IP pública incurrirás cargos por uso de
ancho de banda.

Para mas información sobre rsync puedes ver
[Back up your files with rsync](https://support.rackspace.com/how-to/backing-up-your-files-with-rsync).

#### Opciones específicas en aplicaciones

Otras aplicaciones pueden tener sus propios medios para facilitar la migración
de datos. Por ejemplo, para migrar una base de datos puedes crear en el
servidor destino una instancia esclava y replicar automáticamente los datos
del servidor origen. Para información sobre como crear una replicación
maestro-esclavo ve aquí.

### Tareas post-migración

Una vez que todos tus datos se encuentren en el servidor destino, recomendamos
probar tu aplicación detalladamente para asegurar que está corriendo como
se espera. Como mencionamos al principio de éste artículo, recomendamos que
apagues el servidor origen, pero no lo borres. Espera de 1 a 7 días para tener
oportunidad de determinar si faltó algo en la migración que estaba usando la
IP anterior. Si al pasar los 7 días todo parece estar en orden, generalmente
es seguro proceder con el borrado del servidor origen.

Si no lo haz hecho, éste es un buen momento para implementar un plan de
respaldos en el servidor destino.
