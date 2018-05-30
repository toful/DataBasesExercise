--Procés de MODIFICACIÓ
--Realitza un augment del 5% en el sou dels funcionaris, però només d’aquells funcionaris pels quals existeixin més de dues 
--assignacions (vigents o no) a les diferents zones establertes per la comunitat:

start transaction;
update funcionaris
set sou = sou*1.05
where DNI in (  select funcionari
                from assignacions
                group by funcionari
                having count(*) > 2);
commit;

--Procés d’ESBORRAT
--Esborra totes les multes que corresponguin a pescadors que tinguin un nombre més petit o igual de multes que el pescador amb
-- DNI 98765435.

CREATE TEMPORARY TABLE IF NOT EXISTS temporal engine=innodb
as (select infractor
    from multes
    where infractor != '47253645-I'
    group by infractor
    having count(*) <= (select count(*)
                        from multes
                        where infractor = '47253645-I'));

delete from multes
where infractor in (select *
                    from temporal);
