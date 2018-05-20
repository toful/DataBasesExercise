--Crea una vista que contingui totes aquelles persones que són simultàniament funcionaris i pescadors. Concretament es 
--vol guardar el seu DNI, nom i ciutat de residència.

create view funcionaris_pescadors (DNI, nom, ciutat)
as (select p.DNI, p.nom, pe.ciutat
    from persones p, pescadors pe
    where p.DNI = pe.DNI
    and pe.DNI in ( select DNI
                    from funcionaris));

--Crea una vista amb aquelles espècies que tenen una longitud promig per sobre dels 20 centímetres en estat adult. Concretament 
--es vol guardar el seu nom popular, el seu nom científic, i la seva longitud mitjana en estat adult.

create view especies_minima (nom_popular, nom_cientific, long_mitja)
as (select nom_popular, nom_cientific, long_mitja
    from especies
    where long_mitja > 20);