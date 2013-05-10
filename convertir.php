#!/usr/local/zend/bin/php
<?php
error_reporting(-1);
ini_set('display_errors', 1);
$file = $argv[1];
if (!$file) {
	echo "debe especificar un archivo\n";exit();
}

if (!file_exists($file)) {
	echo "el archivo especificado no existe\n";exit();
}

$content = file_get_contents($file);
$csvNumColumns = 8; 
$csvDelim = ","; 
$data = array_chunk(str_getcsv($content, $csvDelim), $csvNumColumns); 
//var_dump($data);

$res = 'insert IGNORE into entrada_banco(fecha, sucursal, descripcion, referencia, monto, saldo) values' . "\n";
foreach ($data as $row) {
	$row = array_merge(array_slice($row, 1, 5), array_slice($row, 7));
	if (!count($row)) {continue;}

	//08/03/2013 18:35:00
	$row[0] = preg_replace("(^([0-9]+)\\/([0-9]+)\\/([0-9]+) ([0-9]+):([0-9]+):([0-9]+))", "$3$2$1$4$5$6", $row[0]);
	echo $res;
	$res = '("' . implode('","', $row) . '"),' . "\n";
}

//echo $res;
echo substr($res, 0, -2) . ";";

echo "\n";
