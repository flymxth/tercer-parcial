drop database disparadores;

create database disparadores;
use disparadores;
create table editoriales
(
idEditorial            int            primary key,
NombreEditorial        varchar(50),
Pais                varchar(50)
);



create table libros (
    idLibro        int primary key,
    Titulo         varchar(50),
    Precio         decimal(19,4),
    Descripcion    varchar(300),
    idEditorial    int,
    foreign key (idEditorial) references editoriales(idEditorial)
);
create table BITACORA_LIBROS (
    idBitacora       int primary key auto_increment,
    idLibro          int,
    TituloAnterior   varchar(50),
    TituloNuevo      varchar(50),
    PrecioAnterior   decimal(19,4),
    PrecioNuevo      decimal(19,4),
    Usuario          varchar(50),
    FechaHora        datetime,
    foreign key (idLibro) references libros(idLibro)
);


insert into editoriales values
(1, 'Limusa', 'España'), (2, 'Mc Graw Hill', 'España'),
(3, 'Pearson', 'USA'), (4, 'Planeta', 'Mexico'),
(5, 'AM Editores', 'Mexico'), (6, 'Praxis', 'Mexico');
insert into libros values
(100, 'Harry Potter', 150, 'Libro 1 de la serie', 3),
(101, 'Pedro Páramo', 120, 'Novela, Juan Rulfo', 4),
(102, 'El llano en Llamas', 110, 'México en la revolución', 4),
(103, 'El Principito', 210, 'Libro clásico frances', 6),
(104, 'Competitive Programming', 450, 'Libro de los HALIM', 6);