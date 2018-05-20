--Trobar els funcionaris que no són pescadors i que no han posat cap multa a pescadors de Catalunya. Més concretament es demana 
--el número de la seguretat social, el nom dels funcionaris, i el sou que cobren aquests funcionaris.

select f.nss, p.nom, f.sou
from persones p, funcionaris f
where p.DNI = f.DNI
and p.DNI not in (  select DNI
                    from pescadors)
and p.DNI not in (  select m.funcionari
                    from multes m, pescadors p
                    where p.comunitat = 'Catalunya');

--Realitza una consulta que doni com a resultat totes aquelles espècies que habiten simultàniament a totes les masses d’aigua de 
--la comunitat. Més concretament es demana el nom científic i la longitud mitja en estat adult.

--select count(massa_aigua), nom_especie from habitats group by nom_especie;

--Trobar les zones per les quals es concedeixen permisos com a mínim en 3 dates diferents i que permeten alguna captura amb una 
--longitud per sota dels 20 centímetres. Concretament es demana el número de la zona, el nom de la massa d’aigua, el municipi on
-- es troba localitzada la zona i el tipus de zona.

select num_zona, nom_massa, municipi
from zones 
where num_zona in ( select num_zona 
                    from permisos 
                    group by num_zona, nom_massa 
                    having count(*) > 2)
and num_zona in (   select num_zona
                    from captures
                    where long_min<20);


--Trobar les zones sobre les quals no existeix cap vedat i que concedeixen el nombre de permisos més gran. Concretament es demana 
--el número de zona, el nom de la massa i la data de vigència d’aquests permisos.

select num_zona, nom_massa, data_vigencia
from permisos
where num_max >=  ALL ( select num_max
                        from permisos);

--Realitza una consulta que doni com a resultat totes les dades de totes les espècies que habiten només al riu Ara.

select *
from especies
where nom_popular in (  select nom_especie
                        from habitats
                        where massa_aigua = 'Riu');

--Trobar totes les multes imposades en zones que actualment no tenen cap assignació activa. Més concretament, es vol saber el nom 
--del funcionari que ha imposat la multa, el nom de l’infractor, el motiu pel qual s’ha imposat la multa i data d’imposició de la
--multa.

select funcionari, infractor, motiu, data_multa
from multes
where num_zona not in ( select num_zona
                        from assignacions
                        where data_fi != null);