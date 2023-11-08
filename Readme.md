<img width="200" src="img/carrying-box-silhouette-svgrepo-com.svg" align="right"/>

# **COMPRESSION S3** [![Downloads](https://img.shields.io/badge/any_text-Git_Shell_Scipts-blue?style=for-the-badge&logo=gnubash&logoColor=%23ffffff&label=GGONZALES&labelColor=%231C1C1C&color=%23F4831B)](http://pepy.tech/count/shallow-backup)

<div style="display: flex;">
    <div style="flex: 50%;">
    <img src="img/Evidence1.png">
    </div>
    <div style="flex: 50%;">
    <p>
    Esta rama de <strong><code>GitHub</code></strong> alberga un script de shell diseñado para simplificar y automatizar la gestión de registros de logs en un entorno de servidor <strong><code>JBoss</strong></code>. El script realiza una serie de tareas esenciales de manera ordenada y eficiente. Aquí se describe el flujo de trabajo del script en pasos detallados:
    </p>
        <ul>
            <li><strong>Nombre del servidor:</strong><br>
                El script comienza por recuperar el nombre del servidor en el que se ejecuta a través del comando <code>hostname</code>. Luego, utiliza <code>grep</code> con expresiones regulares para extraer un nombre específico <strong>hardcodeado</strong>, como <code>jbossX</code> o <code>jboss-XXpse</code>. El resultado se almacena en la variable <code>hostname</code>.
            </li>
    </ul>
    </p>
        <ul>
            <li><strong>Asignación de la variable <code>node</code>:</strong><br>
                A continuación, el script utiliza una estructura <code>case</code> para asignar un valor a la variable <code>node</code> en función del valor de <code>hostname</code>. Dependiendo de <code>hostname</code>, se asigna un nombre de nodo específico a la variable node, como <code>ND01</code>, <code>ND02</code>, <code>PSE1</code>, etc.
            </li>
    </ul>





Función 'moving_logs':
El script define una función llamada moving_logs que se encarga de las siguientes acciones:

a. Cambio de Directorio de Trabajo: Cambia el directorio de trabajo actual a /home/bizlinks/bizlinks/log/.

b. Iteración y Cambio de Nombre de Archivos: Itera a través de los archivos en ese directorio que cumplen ciertas condiciones. Busca archivos con nombres que coincidan con el patrón "bizlinksOSE_ws.log.AÑO --date="yesterday")_NUMERO". Luego, extrae el número final del nombre del archivo y realiza un cambio de nombre, eliminando los dos últimos dígitos de ese número.

c. Compresión de Archivos y Cambio de Nombre: Itera nuevamente a través de los mismos archivos que coinciden con el patrón "bizlinksOSE_ws.log.AÑO --date="yesterday")". Comprime cada archivo en un archivo .tar.gz con un nombre que incluye el valor de node. Luego, realiza un cambio de nombre en el archivo .tar.gz, eliminando una parte de su nombre.

d. Transferencia a AWS S3: Utiliza el comando aws para mover los archivos .tar.gz al bucket S3 oselog/$node/.

Llamada a la Función 'moving_logs':
Finalmente, el script llama a la función moving_logs, lo que desencadena todas las acciones definidas en la función, como el cambio de nombre de archivos, la compresión y la carga de archivos en un bucket S3.
    </div>
</div>
