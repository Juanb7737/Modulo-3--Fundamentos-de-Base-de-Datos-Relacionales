use alke_wallet;
create table usuario(
user_id int primary key auto_increment not null,
nombre varchar(50) not null,
correo varchar(50)not null,
contraseña varchar(50)not null,
saldo decimal(10.2)
);

alter table usuario change contraseña pass varchar(50) not null;

ALTER TABLE usuario
ADD currency_id INT,
ADD FOREIGN KEY (currency_id) REFERENCES moneda(currency_id);

 create table transaccion(
 transaccion_id int primary key auto_increment not null,
 sender_user_id int not null,
 foreign key(sender_user_id) references usuario(user_id),
 receiver_user_id int not null,
 foreign key(receiver_user_id) references usuario(user_id),
 importe decimal (10.2) not null,
 transaccion_date date not null
 );
 
create table moneda(
currency_id int primary key auto_increment not null,
current_name varchar(50) not null,
currency_symbol varchar(3) not null   
);
INSERT INTO usuario(nombre, correo, contraseña, saldo) VALUES ('Juan', 'juan@correo.cl', 'password', 9999999);
INSERT INTO usuario(nombre, correo, contraseña, saldo) VALUES ('Pedro', 'pedro@correo.cl', 'password', 9999999);
INSERT INTO usuario(nombre, correo, contraseña, saldo) VALUES ('Maria', 'maria@correo.cl', 'password', 9999999);

INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, transaccion_date) VALUES (1, 2, 100, '2021-10-10');
INSERT INTO transaccion (sender_user_id, receiver_user_id, importe, transaccion_date) VALUES (2, 3, 200, '2021-10-11');

INSERT INTO moneda(current_name, currency_symbol) VALUES ('Peso Chileno', 'CLP');
INSERT INTO moneda(current_name, currency_symbol) VALUES ('Dolar', 'USD');
INSERT INTO moneda(current_name, currency_symbol) VALUES ('Euro', 'EUR');
INSERT INTO moneda(current_name, currency_symbol) VALUES ('Yen', 'JPY');
INSERT INTO moneda(current_name, currency_symbol) VALUES ('Libra', 'GBP');
INSERT INTO moneda(current_name, currency_symbol) VALUES ('Bitcoin', 'BTC');



insert into usuario(nombre, correo, contraseña, saldo) values ('Juan', 'juan@correo.cl', '1234', 1000000);
insert into usuario(nombre, correo, contraseña, saldo) values ('Jose', 'jose@correo.cl', '4321', 1000000);
insert into usuario(nombre, correo, contraseña, saldo) values ('Maria', 'Maria@correo.cl', '5678', 1000000); 

SELECT moneda.current_name, moneda.currency_symbol, usuario.nombre, usuario.saldo
FROM usuario
JOIN moneda
ON usuario.currency_id = moneda.currency_id;

select * from transaccion;

select * from transaccion join usuario on transaccion.sender_user_id = usuario.user_id where usuario.user_id = 1;

update usuario set correo = "juanito.example@.cl" where user_id = 1;

delete from transaccion where transaccion_id = 1;
 