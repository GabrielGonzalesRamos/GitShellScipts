<img width="200" src="img/funnel-svgrepo-com.svg" align="right"/>

# **GREP AND SED** [![Downloads](https://img.shields.io/badge/grep_and_sed-you_like-blue?style=for-the-badge&logo=linux&labelColor=%23797EF6&color=%234ADEDE)](http://pepy.tech/count/shallow-backup)

Dentro de esta rama de **`GitHub`**, se encuentra un script de **`bash`** diseñado para descargar masivos archivos **`logs`**  provenientes de un servicio `S3`.

Se Aplican filtros necesarios con **`grep`** para recolectar información relevante. Además, a cada filtro se le agrega una etiqueta con el nombre del servidor utilizando el comando **`ex`**, dichos parámetros utilizados con el comando **`ex`**  se detallarán más adelante. Estos procesos están definidos dentro de una función llamada **`looking_document`**.

Finalmente, se utiliza el comando **`sed`** para sustituir caracteres como corchetes **`[]`** por espacios en blanco, así como guiones **`-`**. Se emplean tuberías para capturar la salida del comando **`sed`** y procesarla con el comando **`awk`**, utilizando un espacio en blanco como separador de campos.

#### **EXPLICANDO EL USO DEL COMANDO  `ex`**

- *`+`* : Este parámetro indica que se realizará un subcomando después de abrir el archivo, sin necesidad de ingresarlo manualmente.

- *`%s/$/ $job/g`* : Esta es una expresión en el estilo de sustitución de vi. Desglosemos esto también:

| Parámetro      | Descripción |
| ----------- | ----------- |
| *`%s`*      | Indica que se realizará una sustitución en todo el archivo.       |
| *`/$/ $job/`*   | Se busca el final de cada línea `$` y reemplazándolo con un espacio y el contenido de la variable `$job`. |
| *`/g`*   | indica que la sustitución debe hacerse globalmente, es decir, en todas las instancias de la expresión en cada línea.|
