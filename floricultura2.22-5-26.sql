use floricultura2;
select*from floricultura2.comanda;
insert into comanda(qtd_produto,preco_produto,id_encomenda,id_produto)
values (3,(select preco_unitario from produto where nome='tulipa rosa'),1,5);

create view entregas as
with telefone_celular(cpf,numero) as
(select cpf,concat(ddd,numero) from telefone where descricao='celular')
select cliente.nome,numero,concat(logradouro,bairro,cidade,estado),
(select sum(qtd_produto)from comanda  where comanda.id_encomenda=encomenda.id_encomenda group by id_encomenda) as total_produto,
(select sum(preco_produto)from comanda group by id_encomenda) as total_preco,
data_encomenda,status_encomenda
from cliente natural join telefone_celular natural join endereco natural join comanda natural join encomenda;
select*from encomenda;
update encomenda set status_encomenda='Entregue' where id_encomenda=2;

create table pessoa(
	cod_teste int auto_increment primary key,
    cpf char(11),
	nome varchar(45) not null,
    sexo char(2) not null,
    unique(cpf),
    check(sexo in('m','f','nb','nd'))
);
insert into pessoa (cpf,nome,sexo) values('11122233345','maria','f');
insert into pessoa (cpf,nome,sexo) values('11122233345','joão');

create table flores as (select*from produto where tipo='flor');
select*from flores;
update produto set qtd=50 where id_produto=1;