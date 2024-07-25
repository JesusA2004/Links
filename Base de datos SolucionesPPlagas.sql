drop database if exists SoluPlagas;
create database SoluPlagas;
	use SoluPlagas;

create table proveedor(
	idProveedor int(5) zerofill primary key auto_increment,
    razonSocial text not null,
    nombreComercial varchar(100) not null,
	info text not null
);    

create table producto(
	folio int(5) zerofill primary key auto_increment,
    codigo varchar(45) not null,
    tipo varchar(100) not null,
    componente varchar(100) not null,
    unidadM varchar(15) not null,
    existencia int not null,
	peso float not null,
    descripcion text not null,
    precio float not null,
    iva float not null,
    url varchar(100) not null,
    idProveedor int unsigned,
    foreign key(idProveedor) references proveedor (idProveedor) on delete set null on update cascade
);

create table listaPrecios(
	codigo varchar(35),
    nombreArchivo varchar(200)
);

create table cliente(
	noCliente int(5) zerofill primary key auto_increment,
    clienteRFC varchar(40) not null,
    nombre varchar(100) not null,
    nombreC varchar(100) not null,
    razonSocial varchar(100) not null,
    email varchar(50) not null,
    sucursal varchar(60) not null,
    telefonoC varchar(10) not null,
	direccion varchar(240) not null,
	colonia varchar(50) not null,
    localidad varchar(50) not null,
    municipio varchar(50) not null,
    estado varchar(50) not null,
    clienteCP int not null,
    codigo int unsigned,
	foreign key(codigo) references listaPrecios (codigo) on delete set null on update cascade
);

create table notaVenta(
	idNotaVenta int(5) zerofill primary key auto_increment,
    fecha date not null, 
	subtotal float not null,
    iva float not null,
    pagoTotal float not null,
    metodoPago varchar(60) not null,
    noCliente int unsigned,
    foreign key(noCliente) references cliente (noCliente) on delete set null on update cascade
);

create table venta(
	idVenta int(5) zerofill primary key auto_increment,
    cantidad int not null,
	total float not null,
    folio int unsigned,
    idNotaVenta int unsigned,
    foreign key(folio) references producto (folio) on delete set null on update cascade,
    foreign key(idNotaVenta) references notaVenta (idNotaVenta) on delete set null on update cascade
);
