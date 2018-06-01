
-- Trobar les zones sobre les quals no existeix cap vedat i que concedeixen el nombre de permisos més gran. 
-- Concretament es demana el número de zona, el nom de la massa i la data de vigència d’aquests permisos.
select num_zona, nom_massa, data_vigencia
from permisos 
where num_zona, nom_massa in ( select z.num_zona, z.nom_massa
						from zones z
						where tipus <> 'vedat' 
						and (	
								select sum(p.num_max)
								from permisos p 
								where z.num_zona=p.num_zona and z.nom_massa=p.nom_massa));
/*
select num_zona, nom_massa
from zones Z
where tipus <> 'vedat' and 

select P.num_zona, P.nom_massa, P.data_vigencia
from permisos P
where P.num_zona, P.nom_massa in ( select Z.num_zona, Z.nom_massa
							   from zones Z
							   where tipus <> 'vedat')


																												
and num_max >=  ALL ( select num_max
                        from permisos);

 
select P.num_zona, P.nom_massa, P.data_vigencia from permisos P where P.num_zona, P.nom_massa in ( select Z.num_zona, Z.nom_massa from zones Z where tipus <> 'vedat' ) and num_max >=  ALL ( select num_max from permisos);;

bueno aqui el que vull fer es mostrar els num_zona, nom_massa, data_vigencia d'un permis tal que el seu
nom_zona i nom_massa (identificadors d'una zona i per tant la zona a la qque correspon el permis) no identifiqui
cap zona de tipus 'vedat'. pero no puc seleccionar els dos camps alhora i he deixat nomes 
and num_zona, nom_massa from zones where tipus <> 'vedat' );
 O sigui ja per començar hauria d'aplicar les restriccions una darrera de l'altra i no fer la interseccio ja que sino
 podria tornar un set buit degut a que estic buscant un permis que tingui num max de permisos d'entre tots els permisos 

 pero segueixo sense poder 
and num_zona, nom_massa in ( 
	select num_zona, nom_massa
	from zones
	where tipus <> 'vedat'
);*/