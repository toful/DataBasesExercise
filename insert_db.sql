
insert into masses_aigua(nom_massa) values ('Riu Ebre');
insert into masses_aigua(nom_massa) values ('Pantà de Siurana');
insert into masses_aigua(nom_massa) values ('Mar Mediterrani');

insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (1, 'Riu Ebre', 'Campredó', 'Tortosa', 'Amposta', 'vedat');
insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (2, 'Riu Ebre', 'Tortosa', 'Xerta', 'Campredó', 'lliure');
insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (3, 'Riu Ebre', 'Amposta', 'Campredó', 'Sant Jaume', 'controlada');
insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (1, 'Pantà de Siurana', 'Campredó', 'Tortosa', 'Amposta', 'lliure');
insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (2, 'Pantà de Siurana', 'Tortosa', 'Xerta', 'Campredó', 'controlada');
insert into zones(num_zona, nom_massa, municipi, limit_superior, limit_inferior, tipus_zona) values (1, 'Mar Mediterrani', 'La Cava', 'Sant Carles de la Ràpita', 'La Ampolla', 'lliure');

insert into especies(nom_popular, nom_cientific, long_mitja) values ('PESCADILLA', 'Merluccius merluccius', 20);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('SALMONETE', 'Mullus barbatus', 23);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('LENGUADO', 'Solea vulgaris', 27);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('RODABALLO', 'Scophthalmus maximus', 18);
insert into especies(nom_popular, nom_cientific, long_mitja) values ('SARDINA', 'Sardina pilchardus', 36);

insert into persones(DNI, nom) values ('47473645-Q', 'Aitor Menta');
insert into persones(DNI, nom) values ('47473634-F', 'Tomas Turbado');
insert into persones(DNI, nom) values ('47343645-G', 'Elena Nito');
insert into persones(DNI, nom) values ('47473645-H', 'Lola Mento');
insert into persones(DNI, nom) values ('47253645-I', 'Helen Chufe');
insert into persones(DNI, nom) values ('47479845-X', 'Jorge Nitales');

insert into funcionaris(DNI, nss, sou) values ('47473645-Q', 'num_seg_social_1', 34);
insert into funcionaris(DNI, nss, sou) values ('47473634-F', 'num_seg_social_2', 34);
insert into funcionaris(DNI, nss, sou) values ('47343645-G', 'num_seg_social_3', 34);

insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47473645-H', 'Carrer A', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47253645-I', 'Carrer B', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47479845-X', 'Carrer C', 'Campredó', 'Catalunya');
insert into pescadors(DNI, carrer, ciutat, comunitat) values ('47343645-G', 'Carrer D', 'Saragoza', 'Aragó');

insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 1, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 1, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 1, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 1, 'RODABALLO', 38);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 2, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 2, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 3, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 3, 'RODABALLO', 38);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Riu Ebre', 3, 'PESCADILLA', 30);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà de Siurana', 1, 'SALMONETE', 40);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà de Siurana', 1, 'LENGUADO', 34);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Pantà de Siurana', 2, 'RODABALLO', 38);
insert into habitats(massa_aigua, num_zona, nom_especie, index_poblacio) values ('Mar Mediterrani', 1, 'LENGUADO', 340);

insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473645-Q', '2018-05-28','Riu Ebre', 1);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473645-Q', '2018-05-28','Pantà de Siurana', 1);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473645-Q', '2018-05-28','Riu Ebre', 2);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473634-F', '2018-05-28','Riu Ebre', 3);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47473634-F', '2018-05-28','Pantà de Siurana', 1);
insert into assignacions(funcionari, data_inici, nom_massa, num_zona) values ('47343645-G', '2018-05-28','Pantà de Siurana', 2);

insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu Ebre', 1, '2018-08-28', 6);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu Ebre', 1, '2018-08-29', 6);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu Ebre', 1, '2018-08-30', 6);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu Ebre', 2, '2018-08-28', 8);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Riu Ebre', 3, '2018-08-28', 7);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Pantà de Siurana', 1, '2018-08-28', 10);
insert into permisos(nom_massa, num_zona, data_vigencia, num_max) values ('Pantà de Siurana', 2, '2018-08-28', 2);

insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 1, 'PESCADILLA', 6, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 1, 'SALMONETE', 7, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 1, 'LENGUADO', 8, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 1, 'RODABALLO', 9, 7.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 2, 'PESCADILLA', 6, 8.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 2, 'SALMONETE', 10, 9.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 3, 'LENGUADO', 6, 52.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 3, 'LENGUADO', 6, 2.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 3, 'RODABALLO', 16, 15.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 3, 'PESCADILLA', 7, 45.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Riu Ebre', 3, 'PESCADILLA', 7, 5.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Pantà de Siurana', 1, 'SALMONETE', 8, 7.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Pantà de Siurana', 1, 'LENGUADO', 3, 9.6);
insert into captures(nom_massa, num_zona, nom_especie, num_max, long_min) values ('Pantà de Siurana', 2, 'RODABALLO', 12, 2.6);

insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47473645-H','2018-06-17','Pantà de Siurana', 2, 'És un careto', 2.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47253645-I','2018-06-17','Pantà de Siurana', 2, 'Massa canyes', 23.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47473645-Q','47479845-X','2018-06-17','Pantà de Siurana', 2, 'Tràfic de cucs', 12.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47343645-G','47253645-I','2018-06-17','Pantà de Siurana', 2, 'Pesca en C4', 28.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47343645-G','47473645-H','2018-06-17','Pantà de Siurana', 2, 'Mal dia', 25.6);
insert into multes(funcionari, infractor, data_multa, nom_massa, num_zona, motiu, import) values ('47343645-G','47473645-H','2018-06-18','Pantà de Siurana', 2, 'Pesca amb TNT', 25.6);