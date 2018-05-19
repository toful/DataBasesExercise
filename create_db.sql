
drop database DB1;

create database DB1;
use DB1;


create table masses_aigua (
    nom_massa varchar(20) not null,
    constraint pk_masses_aigua primary key (nom_massa)
) engine=innodb;

insert into masses_aigua(nom_massa) values ('Riu');
insert into masses_aigua(nom_massa) values ('Pantà');
insert into masses_aigua(nom_massa) values ('Canal');


create table zones (
    num_zona int not null auto_increment,
    nom_massa varchar(20) not null,
    municipi varchar(20),
    limit_superior varchar(20),
    limit_inferior varchar(20),
    constraint pk_zones primary key (num_zona, nom_massa),
    constraint fk_masses_aigua foreign key (nom_massa) references masses_aigua(nom_massa)
) engine=innodb;

insert into zones(nom_massa, municipi, limit_superior, limit_inferior) values ('Riu', 'Campredó', 'Tortosa', 'Amposta');
insert into zones(nom_massa, municipi, limit_superior, limit_inferior) values ('Riu', 'Tortosa', 'Xerta', 'Campredó');
insert into zones(nom_massa, municipi, limit_superior, limit_inferior) values ('Riu', 'Amposta', 'Campredó', 'Sant Jaume');
insert into zones(nom_massa, municipi, limit_superior, limit_inferior) values ('Pantà', 'Campredó', 'Tortosa', 'Amposta');
insert into zones(nom_massa, municipi, limit_superior, limit_inferior) values ('Pantà', 'Tortosa', 'Xerta', 'Campredó');


create table especies (
    nom_popular varchar(20) not null,
    nom_cientific varchar(20) not null unique,
    long_mitja real,
    constraint pk_especies primary key (nom_popular)
) engine=innodb;
--He de ficar nom_cientific com a clau alternativa

insert into especies(nom_popular, nom_cientific, long_mitja) values ('PESCADILLA', 'Merluccius merluccius', 2);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('SALMONETE', 'Mullus barbatus', 5);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('LENGUADO', 'Solea vulgaris', 7);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('RODABALLO', 'Scophthalmus maximus', 8);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('SARDINA', 'Sardina pilchardus', 6);


create table persones (
    DNI varchar(10) not null,
    nom varchar(20) not null,
    constraint pk_prsones primary key (DNI) 
) engine=innodb;

insert into persones(DNI, nom) values ('47473645-Q', 'Aitor Menta');
insert into persones(DNI, nom) values ('47473634-F', 'Tomas Turbado');
insert into persones(DNI, nom) values ('47343645-G', 'Elena Nito');
insert into persones(DNI, nom) values ('47473645-H', 'Lola Mento');
insert into persones(DNI, nom) values ('47253645-I', 'Helen Chufe');
insert into persones(DNI, nom) values ('47479845-X', 'Jorge Nitles');

create table funcionaris (
    DNI varchar(10) not null,
    nss varchar(20),
    sou real not null,
    constraint pk_funcionaris primary key (DNI),
    constraint fk_persones_funcionaris foreign key (DNI) references persones(DNI)
) engine=innodb;

insert into funcionaris(DNI, nss, sou) values ('47473645-Q', 'num_seg_social_1', 34);
insert into funcionaris(DNI, nss, sou) values ('47473634-F', 'num_seg_social_2', 34);
insert into funcionaris(DNI, nss, sou) values ('47343645-G', 'num_seg_social_3', 34);

create table pescadors (
    DNI varchar(10) not null,
    carrer varchar(20),
    ciutat varchar(20),
    comunitat varchar(20),
    constraint pk_pescadors primary key (DNI),
    constraint fk_persones_pescadors foreign key (DNI) references persones(DNI)
) engine=innodb;

insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47473645-H', 'Carrer A', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47253645-I', 'Carrer B', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47479845-X', 'Carrer C', 'Campredó', 'Catalunya');



create table habitats (
    massa_aigua varchar(20) not null,
    num_zona int not null,
    nom_especie varchar(20) not null,
    index_poblacio int,
    constraint pk_habitats primary key (massa_aigua, num_zona, nom_especie),
    constraint fk_habitats_zona foreign key (num_zona, massa_aigua) references zones(num_zona, nom_massa),
    constraint fk_habitats_especie foreign key (nom_especie) references especies(nom_popular)
) engine=innodb;

insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 1, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 1, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 1, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 1, 'RODABALLO', 38);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 2, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 2, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 3, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 3, 'RODABALLO', 38);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu', 3, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà', 4, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà', 4, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà', 5, 'RODABALLO', 38);


create table assignacions (
    funcionari varchar(10) not null,
    data_inici date not null,
    num_zona int not null,
    nom_massa varchar(20) not null,
    data_fi date,
    constraint pk_assignacions primary key (funcionari, data_inici, num_zona, nom_massa),
    constraint fk_assignacions_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa),
    constraint fk_habitats_funcionari foreign key (funcionari) references funcionaris(DNI)
) engine=innodb;

insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473645-Q', '2018-05-28','Riu', 1);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473645-Q', '2018-05-28','Riu', 2);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473634-F', '2018-05-28','Riu', 3);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473634-F', '2018-05-28','Pantà', 4);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47343645-G', '2018-05-28','Pantà', 5);


create table permisos (
    num_zona int not null,
    nom_massa varchar(20) not null,
    data_vigencia date not null,
    num_max int,
    constraint pk_permisos primary key (num_zona, nom_massa, data_vigencia),
    constraint fk_permisos_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa)
) engine=innodb;

insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu', 1, '2018-08-28', 6);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu', 2, '2018-08-28', 8);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu', 3, '2018-08-28', 7);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Pantà', 4, '2018-08-28', 10);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Pantà', 5, '2018-08-28', 2);

create table captures (
    num_zona int not null,
    nom_massa varchar(20) not null,
    nom_especie varchar(20) not null,
    num_max int,
    long_mitja real,
    constraint pk_captures primary key (num_zona, nom_massa, nom_especie),
    constraint fk_captures_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa),
    constraint fk_captures_especie foreign key (nom_especie) references especies(nom_popular)
) engine=innodb;


insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 1, 'PESCADILLA', 6, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 1, 'SALMONETE', 7, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 1, 'LENGUADO', 8, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 1, 'RODABALLO', 9, 7.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 2, 'PESCADILLA', 6, 8.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 2, 'SALMONETE', 10, 9.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 3, 'LENGUADO', 6, 52.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 3, 'RODABALLO', 16, 15.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Riu', 3, 'PESCADILLA', 7, 45.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Pantà', 4, 'SALMONETE', 8, 7.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Pantà', 4, 'LENGUADO', 3, 9.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_mitja) values ('Pantà', 5, 'RODABALLO', 12, 2.6);


create table multes (
    funcionari varchar(10) not null,
    infractor varchar(10) not null,
    data_multa date not null,
    num_zona int not null,
    nom_massa varchar (20) not null,
    motiu varchar(50),
    import real not null,
    constraint pk_multes primary key (funcionari, infractor, data_multa, num_zona, nom_massa),
    constraint fk_multes_funcionari foreign key (funcionari) references funcionaris(DNI),
    constraint fk_multes_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa)
) engine=innodb;

insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47473645-H','2018-06-17','Pantà', 5, 'És un careto', 2.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47253645-I','2018-06-17','Pantà', 5, 'Massa canyes', 23.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47479845-X','2018-06-17','Pantà', 5, 'Tràfic de cucs', 12.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47343645-G','47253645-I','2018-06-17','Pantà', 5, 'Pesca en C4', 28.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47343645-G','47473645-H','2018-06-17','Pantà', 5, 'Mal dia', 25.6);
