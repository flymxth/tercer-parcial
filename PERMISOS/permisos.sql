create database software;
use software;

create table libros (
	idLibro int primary key,
    isbn varchar(13),
    titulo varchar(50),
    paginas int
);

insert into libros values (1, 'RB12', 'La Ouija', 100);

-- CREACION DE UN USUARIO QUE PUEDA ACCEDER A LA BD
create user developer@'localhost' identified by 'hola#';

-- OTORGAR EL PERMISO DE SELECCIONAR EN LA
-- BASE DE DATOS SOFTWARE AL USUARIO developer
GRANT select ON software.libros to developer@'localhost';

-- OTORGA INSERTAR REGISTROS
GRANT insert ON software.libros to developer@'localhost';

-- VER LOS PERMISOS QUE TIENE EL USUARIO developer
SHOW GRANTS FOR developer@'localhost';

-- QUITAR PERMISO (SELECCIONAR)
REVOKE SELECT ON software.libros FROM developer@'localhost';

-- ASIGNAR TODOS LOS PERMISOS
GRANT ALL ON software.* TO developer@'localhost';