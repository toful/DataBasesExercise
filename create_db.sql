
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
    num_zona int(5) zerofill not null auto_increment,
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
    nom_cientific varchar(20) not null,
    long_mitja int(5),
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
insert into persones(DNI, nom) values ('47479845-X', 'Jorge Niatles');

create table funcionaris (
    DNI varchar(10) not null,
    nss varchar(20) not null,
    sou int(5) not null,
    constraint pk_funcionaris primary key (DNI),
    constraint fk_persones_funcionaris foreign key (DNI) references persones(DNI)
) engine=innodb;

insert into funcionaris(DNI, nss, sou) values ('47473645-Q', 'nose', 34);
insert into funcionaris(DNI, nss, sou) values ('47473634-F', 'nose', 34);
insert into funcionaris(DNI, nss, sou) values ('47343645-G', 'nose', 34);

create table pescadors (
    DNI varchar(10) not null,
    carrer varchar(20) not null,
    ciutat varchar(20) not null,
    comunitat varchar(20) not null,
    constraint pk_pescadors primary key (DNI),
    constraint fk_persones_pescadors foreign key (DNI) references persones(DNI)
) engine=innodb;

insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47473645-H', 'Carrer A', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47253645-I', 'Carrer B', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47479845-X', 'Carrer C', 'Campredó', 'Catalunya');

