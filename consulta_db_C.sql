-- Trobar les zones per les quals es concedeixen permisos com a mínim en 3 dates
-- diferents i que permeten alguna captura amb una longitud per sota dels 20 centímetres.
-- Concretament es demana el número de la zona, el nom de la massa d’aigua, el
-- municipi on es troba localitzada la zona i el tipus de zona. 

select Z.num_zona, Z.nom_massa, Z.municipi, Z.tipus
from zones Z 
where (Z.num_zona, Z.nom_massa) in ( select C.num_zona, C.nom_massa
                    from captures C
                    where C.long_min < 20)
and (Z.num_zona, Z.nom_massa) in ( select P.num_zona, P.nom_massa
                    from permisos P
                    group by P.num_zona, P.nom_massa
                    having count(distinct P.data_vigencia) > 2);

