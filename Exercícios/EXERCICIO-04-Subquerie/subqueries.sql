create table vendedor_vendeu_menos(
	id_vendedor integer auto_increment primary key,
	nome_vendedor varchar(100),
	data_venda date,
	valor_venda integer
);
	
-- insert data
insert into vendedor_vendeu_menos (nome_vendedor,data_venda,valor_venda) values ("vincius","2000-01-02", 1000);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("vincius", "2000-02-02", 1000);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("gabriela", "2000-01-03", 800);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("ricardo", "2000-01-04", 1200);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("camila", "2000-03-05", 950);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("lucas", "2000-02-06", 1100);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("fernanda", "2000-01-07", 850);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("marcos", "2000-07-08", 950);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("juliana", "2000-02-09", 1050);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("pedro", "2000-04-10", 800);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("renata", "2000-01-11", 950);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("joão", "2000-09-12", 1200);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("carla", "2000-01-13", 850);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("mariana", "2000-01-14", 1100);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("rodrigo", "2000-03-15", 950);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("amanda", "2000-04-16", 1050);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("felipe", "2000-03-17", 800);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("larissa", "2000-01-18", 950);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("rafael", "2000-01-19", 1200);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("beatriz", "2000-01-20", 850);
insert into vendedor_vendeu_menos (nome_vendedor, data_venda, valor_venda) values ("gustavo", "2000-03-21", 1100);

-- exercicio pegar nome, valor de março
select nome_vendedor nv, valor_venda vv from vendedor_vendeu_menos vvm where month(data_venda) = "03";
-- pegar os valores de março
select nome_vendedor , valor_venda from vendedor_vendeu_menos
where month(data_venda) = "03"
-- valores minimos de março
select
	nome_vendedor, data_venda, valor_venda  
from
	vendedor_vendeu_menos
where 
	month(data_venda) = 3 
	and valor_venda = (select min(valor_venda) from vendedor_vendeu_menos);
-- maximo
select
	nome_vendedor, data_venda, valor_venda  
from
	vendedor_vendeu_menos
where 
	month(data_venda) = 3 
	and valor_venda > (select max(valor_venda) from vendedor_vendeu_menos where month(data_venda) = 3);
-- media
select
	nome_vendedor, data_venda, valor_venda  
from
	vendedor_vendeu_menos
where 
	month(data_venda) = 2
	and valor_venda > (select avg(valor_venda) from vendedor_vendeu_menos where month(data_venda) = 2);



	

