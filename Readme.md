<img width="200" src="img/carrying-box-silhouette-svgrepo-com.svg" align="right"/>

# **COMPRESSION S3** [![Downloads](https://img.shields.io/badge/any_text-Git_Shell_Scipts-blue?style=for-the-badge&logo=gnubash&logoColor=%23ffffff&label=GGONZALES&labelColor=%231C1C1C&color=%23F4831B)](http://pepy.tech/count/shallow-backup)

![Flow](img/Evidence1.png)

Esta rama de GitHub alberga un script de shell diseñado para simplificar y automatizar la gestión de registros de logs en un entorno de servidor JBoss. El script realiza una serie de tareas esenciales de manera ordenada y eficiente. Aquí se describe el flujo de trabajo del script en pasos detallados:

Obtención del Nombre del Host:
El script inicia obteniendo el nombre del host en el que se está ejecutando mediante el comando hostname. Luego, utiliza grep con expresiones regulares para extraer un nombre específico de JBoss, como "jbossX" o "jboss-XXpse". El resultado se almacena en la variable hostname.

Asignación de Valor a la Variable 'node':
A continuación, el script utiliza una estructura case para asignar un valor a la variable node en función del valor de hostname. Dependiendo de hostname, se asigna un nombre de nodo específico a la variable node, como "ND01", "ND02", "PSE1", etc.

Función 'moving_logs':
El script define una función llamada moving_logs que se encarga de las siguientes acciones:

a. Cambio de Directorio de Trabajo: Cambia el directorio de trabajo actual a /home/bizlinks/bizlinks/log/.

b. Iteración y Cambio de Nombre de Archivos: Itera a través de los archivos en ese directorio que cumplen ciertas condiciones. Busca archivos con nombres que coincidan con el patrón "bizlinksOSE_ws.log.AÑO --date="yesterday")_NUMERO". Luego, extrae el número final del nombre del archivo y realiza un cambio de nombre, eliminando los dos últimos dígitos de ese número.

c. Compresión de Archivos y Cambio de Nombre: Itera nuevamente a través de los mismos archivos que coinciden con el patrón "bizlinksOSE_ws.log.AÑO --date="yesterday")". Comprime cada archivo en un archivo .tar.gz con un nombre que incluye el valor de node. Luego, realiza un cambio de nombre en el archivo .tar.gz, eliminando una parte de su nombre.

d. Transferencia a AWS S3: Utiliza el comando aws para mover los archivos .tar.gz al bucket S3 oselog/$node/.

Llamada a la Función 'moving_logs':
Finalmente, el script llama a la función moving_logs, lo que desencadena todas las acciones definidas en la función, como el cambio de nombre de archivos, la compresión y la carga de archivos en un bucket S3.