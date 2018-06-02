-- Procés de MODIFICACIÓ
-- Realitza un augment del 5% en el sou dels funcionaris, però només d’aquells funcionaris pels quals existeixin més de dues 
-- assignacions (vigents o no) a les diferents zones establertes per la comunitat:

start transaction;
update funcionaris
set sou = sou*1.05
where DNI in (  select funcionari
                from assignacions
                group by funcionari
                having count(*) > 2);
commit;


