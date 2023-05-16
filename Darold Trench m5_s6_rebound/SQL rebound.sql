create table empresas(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	direccion varchar(120) not null,
	telefono varchar(15) not null,
	correo varchar(80) not null, 
	web varchar(50)	
);

create table clientes(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	correo varchar(80) not null, 
	direccion varchar(120) not null,
	telefono varchar(15) not null,
	alta char(1) not null
);

create table vehiculos(
	id numeric(12) primary key,
	patente varchar(10) not null,
	marca varchar(20) not null,
	modelo varchar(20) not null,
	color varchar(15) not null,
	precio numeric(12,2) not null,
	frecuencia_matencion numeric(5) not null,
	id_marca numeric(12) not null references marcas(id),
	id_tipoVehiculo numeric(12) not null references tipo_vehiculos(id)
);

create table ventas(
	folio numeric(12) primary key,
	fecha date default now(),
	monto numeric(12,2) not null,
	id_vehiculo numeric(12) not null references vehiculos(id),
	id_cliente varchar(10) not null references clientes(run)
);

create table mantenciones(
	id numeric(12) primary key,
	fecha date default now(),
	trabajaos_realizados varchar(1000),
	id_venta numeric(12) not null references ventas(folio)
);

create table tipo_vehiculos(
	id numeric(12) primary key,
	nombre varchar(120) not null
);

create table marcas(
	id numeric(12) primary key,
	nombre varchar(120) not null
);

insert into empresas(run, nombre, direccion, telefono, correo, web)
values
('25555555-4', 
 'Alameda', 
 'calle juanco 21', 
 '912345678', 
 'soporte@alameda.cl', 
 'www.alameda.cl');
 
 update tipo_vehiculos set nombre = 'SUV' where id = 21;
 select * from tipo_vehiculos;
 
 insert into tipo_vehiculos(id, nombre)
 values ('20', 'Sedan'), ('21', 'SUV');
 
 insert into clientes(run, nombre, correo, direccion, telefono, alta)
 values ('10111222-5', 'Juan', 'juan@mail.com', 'Calle 1', '244445555', 'A'),
 ('10333222-8', 'Antonio', 'antonio@mail.com', 'Calle 2', '244448888', 'A'),
 ('10111000-1', 'Carlos', 'carlos@mail.com', 'Calle 3', '244440000', 'B');
 
 insert into marcas(id, nombre)
 values ('1','Toyota'), ('2', 'Suzuki')
 
 insert into vehiculos(id, patente, marca, modelo, color, precio, frecuencia_matencion, id_marca, id_tipoVehiculo)
 values ('101', 'DDHH11', 'Suzuki', 'Alto', 'blanco', '5000000', '20000', '2', '20'),
 ('102', 'GGHH12', 'Suzuki', 'Baleno', 'rojo', '8000000', '20000', '2', '20'),
('103', 'HHHH13', 'Suzuki', 'Vitara', 'azul', '15000000', '30000', '2', '21'),
('104', 'RRHH14', 'Toyota', '4 Runner', 'gris', '25000000', '30000', '1', '21'),
('105', 'HHHH15', 'Toyota', 'Yaris', 'blanco', '11000000', '30000', '2', '20')

select * from clientes;
delete from clientes where run = '10111000-1';

insert into ventas (folio, monto, id_vehiculo, id_cliente)
values (000001, '5500000', '101', '10111222-5'),
(000002, '9000000', '102', '10333222-8')

 update clientes set nombre = 'Roberto' where run = '10333222-8';
 select * from clientes;
 
 select * from ventas;
 
 select * from ventas where id_cliente = '10111222-5';
 
 select patente from vehiculos;
 
 --  Listar todos los vehículos que no han sido vendidos. --
 select * from  vehiculos vh left join ventas vt on vh.id = vt.id_vehiculo 
 where vt.folio is null;
 
 -- suando sub consulta != = <> --
 select * from vehiculos where id not in (select id_vehiculo from ventas);
 
 
 --  Listar todas las ventas de enero del 2020 con las columnas: Folio, FechaVenta, -- 
 -- MontoVenta, NombreCliente, RutCliente, Patente, NombreMarca, y Modelo.--
 
insert into ventas (folio, fecha, monto, id_vehiculo, id_cliente)
values (000003, '2023-01-06', '5500000', '103', '10111222-5');
(000004, '2023-01-05', '9000000', '104', '10333222-8'),
(000005, '2023-01-05', '9000000', '105', '10333222-8')
 
 select folio, fecha, monto, nombre, run, patente, marca, modelo from ventas vt
 join vehiculos vh on vt.id_vehiculo = vh.id
 join clientes cl on vt.id_cliente = cl.run 
 where vt.fecha >='2023-01-01' and vt.fecha <='2023-01-31';
 
 select folio, fecha, monto, nombre, run, patente, marca, modelo from ventas vt
 join vehiculos vh on vt.id_vehiculo = vh.id
 join clientes cl on vt.id_cliente = cl.run 
 where vt.fecha between '2023-01-01' and '2023-01-31';
 
 -- Sumar las ventas por mes y marca del año 2020. --
 select extract(month from vt.fecha) as mes, marca, sum(monto), count(*) as cant 
 from ventas vt
 join vehiculos vh on vt.id_vehiculo = vh.id
 where extract(year from vt.fecha) = '2023'
 group by mes, vh.marca;
 
 --  Listar Rut y Nombre de las tablas cliente y empresa. --
 select run, nombre from clientes
 union
 select run, nombre from empresas
 
 select * from empresas
 cross join clientes
 
 -- mostrar total de ventas por marca que superen los 5 mill de pesos --
select marca, count(*) as cant, sum(monto) as total from
	ventas vt join vehiculos vh on vt.id_vehiculo = vh.id
	group by vh.marca having sum(monto) >= 6000000;
 
 