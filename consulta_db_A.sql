-- Trobar els funcionaris que no són pescadors i que no han posat cap multa a pescadors de Catalunya. Més concretament es demana 
-- el número de la seguretat social, el nom dels funcionaris, i el sou que cobren aquests funcionaris.

select f.nss, p.nom, f.sou
from persones p, funcionaris f
where p.DNI = f.DNI
and p.DNI not in (  select DNI
                    from pescadors)
and p.DNI not in (  select m.funcionari
                    from multes m, pescadors p
                    where m.infractor = p.DNI
                    and p.comunitat = 'Catalunya');