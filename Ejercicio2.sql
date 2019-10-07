create database empresa;
use empresa;

create table if not exists proveedor (
    IDProveedor int auto_increment primary key,
    IDProducto int,
    ProvNIF varchar(255) default '' not null,
    ProvNombre varchar(255) default '' not null,
    ProvDireccion varchar(255) default '' not null
) ENGINE=INNODB;

create table if not exists producto (
    IDProducto int auto_increment primary key,
    IDProveedor int,
    ProdNombre varchar(255) not null,
    ProdPrecioUd float
) ENGINE=INNODB;

create table if not exists cliente (
    IDCliente int auto_increment primary key,
    IDProducto int,
    ClienteNombre varchar(255) not null,
    ClienteApellidos varchar(255) not null,
    ClienteDireccion varchar(255) not null,	
    ClienteTelefono varchar(255) not null
) ENGINE=INNODB;

ALTER TABLE proveedor
  ADD FOREIGN KEY fk1(IDProducto) REFERENCES producto(IDProducto) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE producto
  ADD FOREIGN KEY fk2(IDProveedor) REFERENCES proveedor(IDProveedor) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE cliente
  ADD FOREIGN KEY fk3(IDProducto) REFERENCES producto(IDProducto) ON DELETE RESTRICT ON UPDATE CASCADE;

insert into proveedor(ProvNombre)
VALUES	('Prov1'), 
		('Prov2');

insert into producto(ProdNombre, IDProveedor)
VALUES	('aaaaa', 2), 
		('bbbbb', 1);

