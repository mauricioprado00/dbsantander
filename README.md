dbsantander
===========

parseador de xls de santander a base de datos mysql.
estos archivos permiten convertir un archivo zip que contiene uno o mas xls descargados del homebanking de santander rio a un archivo sql para popular una base de datos mysql.
Para poder utilizarlo necesita una linux y el libreoffice instalado.

para crear la base de datos, simplemente ejecute lo siguiente:

    mysql -uTUUSUARIO -pTUPASSWORD < creardb.sql

para transformar un zip a sql:

    ./docstosql.sh elarchivozip.zip salida.sql

para cargar el sql a su db:

    mysql -uTUUSUARIO -pTUPASSWORD banco < salida.sql

hay 2 scripts con consultas sql basicas que se pueden ejecutar:

    ./ingresos_mensuales.sh
    ./gastos_mensuales.sh
