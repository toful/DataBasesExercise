
drop database DB1;

create database DB1;
use DB1;

create table masses_aigua (
    nom_massa varchar(20) not null,
    constraint pk_masses_aigua primary key (nom_massa)
) engine=innodb;

create table zones (
    num_zona int not null,
    nom_massa varchar(30) not null,
    municipi varchar(30),
    limit_superior varchar(30),
    limit_inferior varchar(30),
    tipus ENUM('vedat', 'lliure', 'controlada'),
    constraint pk_zones primary key (num_zona, nom_massa),
    constraint fk_masses_aigua foreign key (nom_massa) references masses_aigua(nom_massa)
) engine=innodb;


create table especies (
    nom_popular varchar(20) not null,
    nom_cientific varchar(30) not null unique,
    long_mitja real,
    constraint pk_especies primary key (nom_popular)
) engine=innodb;


create table persones (
    DNI varchar(10) not null,
    nom varchar(20) not null,
    constraint pk_prsones primary key (DNI) 
) engine=innodb;


create table funcionaris (
    DNI varchar(10) not null,
    nss varchar(20),
    sou real not null,
    constraint pk_funcionaris primary key (DNI),
    constraint fk_persones_funcionaris foreign key (DNI) references persones(DNI)
) engine=innodb;


create table pescadors (
    DNI varchar(10) not null,
    carrer varchar(20),
    ciutat varchar(20),
    comunitat varchar(20),
    constraint pk_pescadors primary key (DNI),
    constraint fk_persones_pescadors foreign key (DNI) references persones(DNI)
) engine=innodb;


create table habitats (
    massa_aigua varchar(20) not null,
    num_zona int not null,
    nom_especie varchar(20) not null,
    index_poblacio real,
    constraint pk_habitats primary key (massa_aigua, num_zona, nom_especie),
    constraint fk_habitats_zona foreign key (num_zona, massa_aigua) references zones(num_zona, nom_massa),
    constraint fk_habitats_especie foreign key (nom_especie) references especies(nom_popular)
) engine=innodb;


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


create table permisos (
    num_zona int not null,
    nom_massa varchar(20) not null,
    data_vigencia date not null,
    num_max int,
    constraint pk_permisos primary key (num_zona, nom_massa, data_vigencia),
    constraint fk_permisos_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa),
    check (num_max<=50)
) engine=innodb;


create table captures (
    num_zona int not null,
    nom_massa varchar(20) not null,
    nom_especie varchar(20) not null,
    num_max int,
    long_min real,
    constraint pk_captures primary key (num_zona, nom_massa, nom_especie),
    constraint fk_captures_zona foreign key (num_zona, nom_massa) references zones(num_zona, nom_massa),
    constraint fk_captures_especie foreign key (nom_especie) references especies(nom_popular)
) engine=innodb;


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
