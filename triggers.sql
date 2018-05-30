delimiter //

create trigger restriccio_captura
before insert on captures
for each row
begin
    if ( 0 != ( select count(*)
                from especies s
                where new.nom_especie = s.nom_popular 
                AND new.long_min > s.long_mitja) )
    then
        signal SQLSTATE '45000'SET MESSAGE_TEXT = 'Longitud minima de la captura superior a la mitja de la espècie';
    end if;
end //

delimiter ;