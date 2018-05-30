
--Trobar les zones sobre les quals no existeix cap vedat i que concedeixen el nombre de permisos més gran. Concretament es demana 
--el número de zona, el nom de la massa i la data de vigència d’aquests permisos.

select num_zona, nom_massa, data_vigencia
from permisos
where num_max >=  ALL ( select num_max
                        from permisos);
