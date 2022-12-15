CREATE DATABASE airbnb_dante;
use airbnb_dante;

CREATE TABLE huesped (
id_hues INT auto_increment primary key not null,
lastn_hues VARCHAR(50) NOT NULL,
name_hues VARCHAR(50) NOT NULL,
dni_hues VARCHAR(15) NOT NULL,
mail_hues VARCHAR(50) NOT NULL,
num_hues INT NOT NULL
);

CREATE TABLE anfitrion (
id_anfi INT auto_increment primary key not null,
lastn_anfi VARCHAR(50) NOT NULL, 
name_anfi VARCHAR(50) NOT NULL,
dni_anfi VARCHAR(15) NOT NULL,
mail_anfi VARCHAR(50) NOT NULL,
num_anfi INT NOT NULL
);

CREATE TABLE propiedad(
id_prop INT auto_increment primary key not null,
limit_hues INT NOT NULL,
direc_prop VARCHAR(100),
tipo_prop VARCHAR(20),
fecha_prop DATE NOT NULL,
serv_prop VARCHAR(20),
prec_prop INT NOT NULL,
id_anfi INT NOT NULL,
foreign key (id_anfi) references anfitrion(id_anfi)
);

CREATE TABLE reserva(
id_reser INT auto_increment primary key not null,
fech_reser_inicio DATE NOT NULL,
fech_reser_fin DATE NOT NULL,
cant_hues INT NOT NULL,
id_hues INT NOT NULL,
id_prop INT NOT NULL,
id_pago INT NOT NULL,
id_anfi INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_prop) references propiedad(id_prop),
foreign key (id_anfi) references anfitrion(id_anfi)
);

CREATE TABLE pago(
id_pago INT auto_increment primary key not null,
fech_pago DATE NOT NULL,
monto_total INT NOT NULL,
id_hues INT NOT NULL,
id_reser INT NOT NULL,
id_prop INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_reser) references reserva(id_reser),
foreign key (id_prop) references propiedad(id_prop)
);

ALTER TABLE reserva ADD foreign key (id_pago) references pago(id_pago);

CREATE TABLE calificacion(
id_calif INT auto_increment primary key not null,
id_hues INT NOT NULL,
id_prop INT NOT NULL,
calif INT NOT NULL,
foreign key (id_hues) references huesped(id_hues),
foreign key (id_prop) references propiedad(id_prop)
);





