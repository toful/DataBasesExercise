--Procés de MODIFICACIÓ
--Realitza un augment del 5% en el sou dels funcionaris, però només d’aquells funcionaris pels quals existeixin més de dues 
--assignacions (vigents o no) a les diferents zones establertes per la comunitat:

update funcionaris
set sou = sou + sou*0.05
where DNI in (  select funcionari
                from assignacions
                group by funcionari
                having count(*) > 2);

--Procés d’ESBORRAT
--Esborra totes les multes que corresponguin a pescadors que tinguin un nombre més petit o igual de multes que el pescador amb
-- DNI 98765435.

delete from multes
where infractor in (select infractor
                    from multes
                    group by infractor
                    having count(*) <= (select count(*)
                                        from multes
                                        where infractor = '47473645-Q'));