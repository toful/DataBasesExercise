
-- Trobar les zones sobre les quals no existeix cap vedat i que concedeixen el nombre de permisos més gran. 
-- Concretament es demana el número de zona, el nom de la massa i la data de vigència d’aquests permisos.

select P.num_zona, P.nom_massa, P.data_vigencia
from permisos P 
where (P.num_zona, P.nom_massa) in ( select Z.num_zona, Z.nom_massa
					from zones Z
					where tipus <> 'vedat') 
and num_max >=  ALL ( select num_max
                        from permisos);


