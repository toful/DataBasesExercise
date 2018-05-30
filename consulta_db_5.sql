
--Realitza una consulta que doni com a resultat totes les dades de totes les espècies que habiten només al riu Ara.

select *
from especies
where nom_popular in (  select nom_especie
                        from habitats
                        where massa_aigua = 'Riu Ebre'
                        and nom_especie not in (select nom_especie
                                                from habitats
                                                where massa_aigua != 'Riu Ebre'));