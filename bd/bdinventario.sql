
drop schema if exists inventario;
create database inventario;
use inventario;
create table sede(
idSede int not null auto_increment,
nombreSede varchar(50),
primary key(idSede));

create table responsable(
idResponsable int not null auto_increment,
nombreCompleto varchar(255),
correo varchar(100),
telefono varchar(100),
primary key(idResponsable));

create table tipoEquipo(
idTipoEquipo int not null auto_increment,
tipoEquipo varchar(100),
primary key(idTipoEquipo));

create table equipo(
idEquipo int not null auto_increment,
nombreEquipo varchar(100),
modeloEquipo varchar(100),
serialEquipo varchar(100),
estadoOperatividad varchar(100),
sistemaOperativo varchar(100),
idTipoEquipo int ,
caracteristivas varchar(500),
idResponsable int,
foreign key (idTipoEquipo) references tipoEquipo (idTipoEquipo),
foreign key(idResponsable) references responsable (idResponsable),
primary key (idEquipo));

create table equipoSede(
idEquipoSede int not null auto_increment,
idEquipo int,
idSede int,
ubicacion varchar(50),
primary key(idEquipoSede),
foreign key (idEquipo) references equipo(idEquipo),
foreign key(idSede) references sede(idSede)

);


