DROP DATABASE IF EXISTS cadastro_lives;
CREATE DATABASE cadastro_lives;
use cadastro_lives;

CREATE TABLE streamer (
id_streamer int not null primary key auto_increment,
nome varchar(100) not null,
usuario varchar(20) not null,
senha varchar(20) not null,
dt_cadastro date,
email varchar(50) not null,
inlive boolean 
);

CREATE TABLE categoria (
id_categ int not null primary key auto_increment,
nome varchar(50) not null
);

CREATE TABLE live ( 
id_live int not null primary key auto_increment,
id_categ int not null,
titulo varchar(50),
id_streamer int not null,
constraint fk_id_streamer foreign key (id_streamer) references streamer(id_streamer),
constraint fk_id_categ foreign key (id_categ) references categoria(id_categ) 
);

CREATE TABLE bot (
id_bot int not null primary key auto_increment,
nome varchar(20) not null
);


CREATE TABLE espectador_seguidor (
id_user int not null primary key auto_increment,
email varchar(50),
usuario varchar(20),
senha varchar(20),
nome varchar(100),
dt_cadastro date,
id_bot int,
constraint fk_id_bot foreign key (id_bot) references bot(id_bot)
);
 
CREATE TABLE live_bot (
id_live int not null,
id_bot int not null,
constraint fk_id_live_ foreign key (id_live) references live(id_live),
constraint fk_id_bot_ foreign key (id_bot) references bot(id_bot),
constraint pk_live_bot primary key (id_live,id_bot)
);

CREATE TABLE live_espectador_seguidor (
id_user  int,
id_live int,
constraint fk_id_user foreign key (id_user) references espectador_seguidor(id_user),
constraint fk_id_live foreign key (id_live) references live(id_live),
constraint pk_live_espectador_seguidor primary key (id_user,id_live)
);