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