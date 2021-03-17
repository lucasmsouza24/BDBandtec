-- 1)
use revista;

-- acrescentando coluna
alter table revista add column fkeditora int;
-- acrescentando constraint
alter table revista add foreign key(fkeditora) references editora(idEditora);

-- mostrando 
select * from revista;
select * from editora;

update revista set fkeditora = 1002 where idrevista = 1;
update revista set fkeditora = 1000 where idrevista = 2;
update revista set fkeditora = 1001 where idrevista = 3;
update revista set fkeditora = 1002 where idrevista = 4;
update revista set fkeditora = 1000 where idrevista = 5;
update revista set fkeditora = 1001 where idrevista = 6;
update revista set fkeditora = 1002 where idrevista = 7;
update revista set fkeditora = 1002 where idrevista = 8;
update revista set fkeditora = 1000 where idrevista = 9;

select revista.*, editora.nomeeditora, editora.datafund from revista, editora where fkeditora = idEditora;