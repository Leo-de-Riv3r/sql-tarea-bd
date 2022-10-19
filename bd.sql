drop database if exists ml;
create database ml;
use ml;
 
create table Customer (
 
    id int AUTO_INCREMENT unique,
    nombre varchar(40),
    apellido varchar(40),
    genero varchar(20),
    email varchar(40) unique,
    tel int,
    fecha_nac DATE,
    direccion varchar(40),
 
    constraint PK_Customers PRIMARY KEY (id)
);
 
create table Category (
 
    id int AUTO_INCREMENT unique,
    nombre varchar(20) unique,
 
    constraint PK_Category PRIMARY KEY (id)
);
 
create table category_update (
  id int AUTO_INCREMENT UNIQUE,
  id_category int not null,
  fecha_update date,
  nombre varchar(40),
 
  constraint PK_category_update PRIMARY KEY (id),
  constraint FK_Caregory FOREIGN KEY (id_category) REFERENCES Category(id)
 
);
 
create table Item (
   
    id int AUTO_INCREMENT unique,
    nombre varchar(20),
    precio float,
    fecha_publi DATE,
    stock int,
    estado boolean,
    idCustomer int,
    idCategory int,
    constraint PK_Item PRIMARY KEY (id),
    constraint FK_item_customer FOREIGN KEY (idCustomer) REFERENCES Customer (id)
        ON UPDATE CASCADE,
    constraint FK_Category FOREIGN KEY (idCategory) REFERENCES Category(id)
);
 
create table precio_item(
id int AUTO_INCREMENT unique,
id_Item int,
fecha DATE not null,
precio float,
constraint PK_precioItem PRIMARY KEY(id),
constraint FK_Item FOREIGN KEY(id_Item) REFERENCES Item(id)
);
 
create table Orders(
    id int AUTO_INCREMENT unique,
    id_customer int not null,
    id_item int not null,
    fecha DATE not null,
   
    constraint PK_order PRIMARY KEY (id),
    constraint FK_Order_Item FOREIGN KEY (id_item) REFERENCES Item (id)
        ON UPDATE CASCADE,
    constraint FK_Order_customer FOREIGN KEY (id_customer) REFERENCES Customer(id)
        ON UPDATE CASCADE
);
 
 
INSERT INTO `customer` (`id`, `nombre`, `apellido`, `genero`, `email`, `tel`, `fecha_nac`, `direccion`) VALUES (NULL, 'Juan', 'Limon', 'Masculino'
, 'johnlemmon@lemmon.com', '22337756', '1970-10-10', 'Av. Beatles 1987'),
(NULL, 'Paul', 'Mc Carne', 'Masculino'
, 'carniceriamccarne@tienda.com', '22337756', '1978-09-10', 'Av. Beatles 1987'),
(NULL, 'Gym', 'Morrison', 'Masculino'
, 'gymdemorrison@info.com', '22337756', '1979-12-10', 'Av. Beatles 1987'),
(NULL, 'Eduardo', ',veni a buscar a juan cruz', 'Masculino'
, 'edubuscaajuancruz@email.com', '22337756', '1970-10-10', 'Av. Beatles 1987'),
(NULL, 'Esteban', 'Tabajos', 'Masculino'
, 'jobs@manzana.com', '22337756', '1970-10-10', 'Av. Beatles 1987'),
(NULL, 'Juan', 'Lima', 'Masculino'
, 'jhonlima@limon.com', '22337756', '1970-10-10', 'Av. Beatles 1987');
 
INSERT INTO category VALUES ('', 'Celulares');
INSERT INTO `item` (`id`, `nombre`, `precio`, `fecha_publi`, `stock`, `estado`, `idCustomer`, `idCategory`) VALUES
(NULL, 'Huawei CH19', '50500', '2020-01-02', '0', '0', '1', '1'),
(NULL, 'Moto G4', '30200', '2020-01-02', '0', '0', '3', '1');
 
INSERT INTO `orders` (`id`, `id_customer`, `id_item`, `fecha`) VALUES
(NULL, '1', '3', '2019-01-19'),
(NULL, '1', '4', '2019-01-19');

INSERT INTO `Item` VALUES
(NULL, 'Huawei CH19', '50500', '2019-01-19', 0, 0,1,1),
(NULL, 'Moto G4', '30200', '2019-01-19', 0, 0, 3,1);
