Notepad++ v7.8.5 Enhancement & bug-fixes:
DROP DATABASE IF EXISTS cadastro_lives;
CREATE DATABASE cadastro_lives;
use cadastro_lives;

CREATE TABLE streamer (
id_streamer int not null primary key auto_increment,
nome varchar(100) not null,
usuario varchar(20) not null,
senha varchar(20) not null,
dt_cadastro date not null,
inlive boolean not null
);

CREATE TABLE categoria (
id_categ int not null primary key auto_increment,
nome varchar(50) not null
);

CREATE TABLE live ( 
id_live int not null primary key auto_increment,
id_categ int not null,
titulo varchar(50) not null,
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

/* Adicionando valores na tabela Streamer */

INSERT INTO streamer (id_streamer,nome,usuario,senha,dt_cadastro,inlive) VALUES (1, 'Evandro Mota', 'evandro369', 'Evandro159', '2019-05-01', TRUE);
INSERT INTO streamer (id_streamer,nome,usuario,senha,dt_cadastro,inlive) VALUES (2, 'Enos Victor', 'enosvt1', 'Enos5500', '2019-06-02', TRUE);
INSERT INTO streamer (id_streamer,nome,usuario,senha,dt_cadastro,inlive) VALUES (3, 'Maria Eduarda', 'dudinha00', 'duda2405', '2020-08-23', TRUE);
INSERT INTO streamer (id_streamer,nome,usuario,senha,dt_cadastro,inlive) VALUES (4, 'Gabriel Souza', 'gabriel007', '159753', '2020-09-20', FALSE);
INSERT INTO streamer (id_streamer,nome,usuario,senha,dt_cadastro,inlive) VALUES (5, 'Daniel Silva', 'danisil', 'dandan123', '2020-12-28', FALSE);

/* Adicionando valores na tabela Categoria */

INSERT INTO categoria (id_categ,nome) VALUES (1,'League of Legends');
INSERT INTO categoria (id_categ,nome) VALUES (2,'Apex Legends');
INSERT INTO categoria (id_categ,nome) VALUES (3,'CS:GO');
INSERT INTO categoria (id_categ,nome) VALUES (4,'ARK');
INSERT INTO categoria (id_categ,nome) VALUES (5,'Valorant');

/* Adicionando valores na tabela Live */

INSERT INTO live (titulo,id_streamer,id_categ) VALUES ('live do Evandro', 1,1);
INSERT INTO live (titulo,id_streamer,id_categ) VALUES ('live do Victor', 2,2);
INSERT INTO live (titulo,id_streamer,id_categ) VALUES ('live da Duda', 3,3);
INSERT INTO live (titulo,id_streamer,id_categ) VALUES ('live do Gabriel', 4,4);
INSERT INTO live (titulo,id_streamer,id_categ) VALUES ('live do Daniel', 5,5);


/* Adicionando valores na tabela Bot */

INSERT INTO bot (nome) VALUES ('Groovy');
INSERT INTO bot (nome) VALUES ('Rythm');
INSERT INTO bot (nome) VALUES ('Element');
INSERT INTO bot (nome) VALUES ('Holics');
INSERT INTO bot (nome) VALUES ('Venom');

/* Adicionando valores na tabela Espectador_Seguidor */

INSERT INTO espectador_seguidor (email,usuario,senha,nome,dt_cadastro,id_bot) VALUES ('pauloborges@gmail.com', 'paulobg0', 'paulo#13', 'Paulo Borges', '2019-09-13', 3);
INSERT INTO espectador_seguidor (email,usuario,senha,nome,dt_cadastro) VALUES ('rodrigojose@gmail.com', 'jrodrigo1', 'jrod63', 'José Rodrigo', '2018-05-12');
INSERT INTO espectador_seguidor (email,usuario,senha,nome,dt_cadastro) VALUES ('carlosalmeida@gmail.com', 'carlosalm36', '1596320', 'Carlos Almeida', '2018-07-018');
INSERT INTO espectador_seguidor (email) VALUES (null);
INSERT INTO espectador_seguidor (email) VALUES (null);

/* Adicionando valores na tabela Live_Bot */

INSERT INTO live_bot (id_live,id_bot) VALUES (1, 1);
INSERT INTO live_bot (id_live,id_bot) VALUES (2, 1);
INSERT INTO live_bot (id_live,id_bot) VALUES (3, 3);
INSERT INTO live_bot (id_live,id_bot) VALUES (4, 4);
INSERT INTO live_bot (id_live,id_bot) VALUES (5, 5);

/* Adicionando valores na tabela live_espectador_seguidor */

INSERT INTO live_espectador_seguidor (id_user,id_live) VALUES (1, 1);
INSERT INTO live_espectador_seguidor (id_user,id_live) VALUES (2, 2);
INSERT INTO live_espectador_seguidor (id_user,id_live) VALUES (3, 3);
INSERT INTO live_espectador_seguidor (id_user,id_live) VALUES (4, 4);
INSERT INTO live_espectador_seguidor (id_user,id_live) VALUES (5, 5);   
 
 




















