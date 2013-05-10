#!/usr/local/zend/bin/php
<?php
error_reporting(-1);
ini_set('display_errors', 1);
$file = $argv[1];
$target = $argv[2];

if (!$file) {
	echo "debe especificar un zip de origen\n";exit();
}

if (!file_exists($file)) {
	echo "el archivo especificado zip de origen no existe\n";exit();
}


if (!$target) {
	echo "debe especificar un archivo sql de destino\n";exit();
}

if (file_exists($target)) {
	echo "el archivo especificado sql de destino ya existe\n";exit();
}

$file = dirname(__FILE__) . "/" . $file;
$target = dirname(__FILE__) . '/' . $target;
$tmp = dirname(__FILE__) . '/tmp';

$cwd = getcwd();

if (file_exists($tmp)) {
	echo "el directorio tmp debe estar vacio\n";exit();
}
echo "creando directorio temporal\n";
`mkdir $tmp`;
chdir('tmp');

echo "descomprimiendo\n";
`unzip $file`;

echo "creando csvs\n";
`libreoffice --headless --convert-to csv * --outdir .`;

echo "parseando csv\n";
`find . -type f -name "*.csv" | xargs cat | egrep -v "^[,]+$" | egrep -v "^,Fecha" | egrep -v "^,Ultimos Movimientos" | egrep -v "^,Cuenta,Cuenta Unica 270-364477" > resultado.txt`;

echo "generando sql\n";
`../convertir.php resultado.txt > $target`;

echo "eliminando directorio temporal\n";
`rm -Rf $tmp`;

