
/*
Trobar totes les multes imposades en zones que actualment no tenen cap assignació activa. Més concretament, es vol saber el nom 
del funcionari que ha imposat la multa, el nom de l’infractor, el motiu pel qual s’ha imposat la multa i data d’imposició de la
multa.
*/

select funcionari, infractor, motiu, data_multa
from multes
where (num_zona, nom_massa) not in ( 
	select num_zona, nom_massa
    from assignacions);