create database banco;
use banco;
CREATE TABLE `entrada_banco` (
  `fecha` datetime DEFAULT NULL,
  `sucursal` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `referencia` varchar(30) DEFAULT NULL,
  `monto` decimal(20,3) DEFAULT NULL,
  `saldo` decimal(20,3) DEFAULT NULL,
  UNIQUE KEY `fecha` (`fecha`,`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

