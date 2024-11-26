create database disparadores;
use disparadores;
create table editoriales
(
idEditorial            int            primary key,
NombreEditorial        varchar(50),
Pais                varchar(50)
);
create table libros
(
idLibro                int            primary key,
Titulo                varchar(50),
Descripcion            varchar(300),
idEditorial            int,
foreign key (idEditorial) references editoriales(idEditorial)
);
insert into editoriales values
(1, 'Limusa', 'España'), (2, 'Mc Graw Hill', 'España'),
(3, 'Pearson', 'USA'), (4, 'Planeta', 'Mexico'),
(5, 'AM Editores', 'Mexico'), (6, 'Praxis', 'Mexico');
insert into libros values
(100, 'Harry Potter', 'Libro 1 de la serie', 3),
(101, 'Pedro Páramo', 'Novela, Juan Rulfo', 4),
(102, 'El llano en Llamas', 'México en la revolución', 4),
(103, 'El Principito', 'Libro clásico frances', 6),
(104, 'Competitive Programming', 'Libro de los HALIM', 6);