
-- Trobar les zones sobre les quals no existeix cap vedat i que concedeixen el nombre de permisos més gran. 
-- Concretament es demana el número de zona, el nom de la massa i la data de vigència d’aquests permisos.

/*
bueno aqui el que vull fer es mostrar els num_zona, nom_massa, data_vigencia d'un permis tal que el seu
nom_zona i nom_massa (identificadors d'una zona i per tant la zona a la qque correspon el permis) no identifiqui
cap zona de tipus 'vedat'. De moment aixo a ho he aconseguit.

Pero el que em falta fer es seleccionar la zona que mes permisos té, es a dir, he de seleccionar la zona 
a la que li correspon el maxim valor de la suma agregada de tots els camps num_max dels permisos d'aquella zona.
Per tant el que s'ha de fer es agrupar els permisos  per cada zona (utilitzant num_zona i nom_massa), sumar els 
camps num_max per cada "grupet" i quedarnos amb nom_zona i nom_massa per al grupet amb valor maxim d'aquesta suma
*/

select P.num_zona, P.nom_massa, P.data_vigencia
from permisos P 
where (P.num_zona, P.nom_massa) in ( 
	select Z.num_zona, Z.nom_massa
	from zones Z
	where tipus <> 'vedat' 
	and (Z.num_zona, Z.nom_massa) in (
		select Ps.num_zona, Ps.nom_massa
		from permisos Ps 
		group by Ps.num_zona, Ps.nom_massa
		having max(
				select sum(Pr.num_max)
            	from permisos Pr 
            	group by Pr.num_zona, Pr.nom_massa)));


