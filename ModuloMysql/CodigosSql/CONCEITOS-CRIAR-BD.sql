C     RIANDO PRIMEIRO BD DO CURSO, PROJETO DE CADASTRO SIMPLES DE CLIENTE

--	Entidade = tabela
--	Campos = atributo
--	ctrl + o = Organiza o BRmodelo
-- DROP TABLE FUNCIONARIOS; DELETAR A TEBELLA

-- CLIENTE

-- NOME - VARCHAR(30)
-- CPF - NUMBER(11)
-- EMAIL - VARCHAR(30)
-- TELEFONE - VARCHAR(30)
-- ENDERECO - VARCHAR(100)
-- SEXO - CHAR(1) -- O uso do char é mais performático e sintático para um BD mais veloz

-- Processo de modelagem

-- FASE 01 E 02 FEITAS NO AD - ADMINISTRADOR DE DADOS
-- MODELAGEM CONCEITUAL - RASCUNHO
-- MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

-- FASE 03 DBA / AD
-- MODELAGEM FÍSICA - SCRIPTS DE BD

-- Iniciando a modelagem física

-- Criando o BD
CREATE DATABASE PROJETO;

-- Conectando ao BD
USE PROJETO;

-- Criando uma tabela
CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF VARCHAR(11), -- Não pega zeros à esquerda
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

-- Mostra as tabelas e ver tipos
SHOW TABLES;

DESC CLIENTE; -- Nome da tabela

-- Linha = Tupla ou registro

-- Sintaxe básica de inserção de colunas
INSERT INTO TABELA VALUES (
	'VINICIUS',
	NUMBER
)
 -- Formas de inserir os dados
INSERT INTO CLIENTE VALUES (
	'VINÍCIUS',
	'M',
	'VINICIUSGGABRIEL989@GMAIL.COM',
	'08549967106',
	'(62)992952214',
	'RUA ROSENVAL ALVES DOS SANTOS'
);

INSERT INTO CLIENTE (
	NOME,
	SEXO,
	ENDERECO,
	TELEFONE,
	CPF
) VALUES (
	'GABRIEL',
	'M',
	'RUA ROSENVAL ALVES DOS SANTOS',
	'(62)992952214',
	'0849967106'
);

INSERT INTO CLIENTE VALUES -- Insere dois itens do BD
(
	'VINÍCIUS12',
	'M',
	'VINICIUSGGABRIEL989@GMAIL.COM',
	'08549967106',
	'(62)992952214',
	'RUA ROSENVAL ALVES DOS SANTOS'
),
(
	'VINÍCIUS13',
	'M',
	'VINICIUSGGABRIEL989@GMAIL.COM',
	'08549967106',
	'(62)992952214',
	'RUA ROSENVAL ALVES DOS SANTOS'
);

-- Select é um comando que existe em todos os BD
-- Quando alguém te pede para ver um item basicamente é um Select

-- O Comando SHOW table é basicamente um select dentro do dicionário de dados, fazendo uma projeção

SELECT
	NOW();

-- Serve para projetar e trazer itens de uma tabela
SELECT
	NOME  AS CLIENTE,
	SEXO,
	EMAIL
FROM
	CLIENTE;

SELECT
	NOME,
	SEXO,
	EMAIL
FROM
	CLIENTE;

SELECT
	*
FROM
	CLIENTE;

-- Select = projeção já where = seleção

SELECT
	NOME     AS CLIENTE,
	ENDERECO
FROM
	CLIENTE
WHERE
	SEXO = 'M';

-- Por exemplo ele filtra nesse script independente dos itens do select

SELECT
	NOME     AS CLIENTE,
	SEXO,
	ENDERECO
FROM
	CLIENTE
WHERE
	ENDERECO LIKE '%SANTOS';

-- Trabalha com caracter coringa usasse o % para pegar qualquer coisa que termine em santos

-- Comando
SHOW DATABASES; -- Serve para ver os databases

-- Tabela verdade
-- Mesma ideia das portas OR e AND
-- O AND SERVE PARA ADICIONAR MAIS UMA CONDIÇÃO E O OR TAMBÉM
SELECT
	*
FROM
	LIVROS
WHERE
	SEXO_DO_AUTOR = 'Masculino'
	AND (UF_DA_EDITORIA = 'SP'
	OR UF_DA_EDITORIA = 'RJ')
	AND NUMERO_DE_PAGINAS > 100;

-- Ver quantos registros por linha tem em uma tabela
SELECT
	COUNT(*) AS "REGISTROS"
FROM
	LIVROS;

-- Operadores
-- Group BY
SELECT
	SEXO_DO_AUTOR,
	COUNT(*)      AS "REGISTROS"
FROM
	LIVROS
GROUP BY
	SEXO_DO_AUTOR;

-- Filtrando valores nulos --
SELECT
	NOME,
	SEXO
FROM
	CLIENTE
WHERE
	SEXO = 'F';

-- Vai igualar a nulo
SELECT
	NOME,
	SEXO,
	ENDERECO
FROM
	CLIENTE
WHERE
	EMAIL = NULL;

-- Vai pegar os nulos
SELECT
	NOME,
	SEXO,
	ENDERECO
FROM
	CLIENTE
WHERE
	EMAIL IS NULL;

-- Vai pegar os que não são nulos
SELECT
	NOME,
	SEXO,
	ENDERECO
FROM
	CLIENTE
WHERE
	EMAIL IS NOT NULL;

-- Fazendo update em uma tabela com nulos --
SELECT
	NOME,
	SEXO,
	EMAIL
FROM
	CLIENTE;

-- Há um problema nesse código, ele troca TODOS os emails da tabela
-- Não importa o banco, cláusulas como WHERE vão ser o seu melhor amigo na hora de filtrar, fazer update e deletar
UPDATE CLIENTE
SET
	EMAIL = "joao.oliveira@gmail.com"
WHERE
	NOME LIKE 'João%';

-- Deletar dados da tabela --
DELETE FROM CLIENTE;

-- Ver o que vai ser deletado antes de fazer
SELECT
	*
FROM
	CLIENTE
WHERE
	NOME LIKE "Ana%";

SELECT
	COUNT(*) AS CLIENTE_COUNT
FROM
	CLIENTE;

-- DELETA O ITEM QUE SE PAREÇA COM Ana
DELETE FROM CLIENTE
WHERE
	NOME LIKE "Ana%";

-- Deleta nome lucas que tem o email teste@gmail.com
DELETE FROM CLIENTE
WHERE
	NOME LIKE 'Lucas'
	AND EMAIL = 'teste@gmail.com';

-- NOTE: Cursores em sql
create table vendedores (
	id_vendedor int primary key auto_increment,
	nome VARCHAR(50) not null,
	janeiro int,
	fevereiro int,
	março int
);

insert into vendedores (nome, janeiro, fevereiro, março) values ('João', 1000, 2000, 3000);
insert into vendedores (nome, janeiro, fevereiro, março) values ('Maria', 1000, 2000, 3000);
insert into vendedores (nome, janeiro, fevereiro, março) values ('Pedro', 1000, 2000, 3000);
insert into vendedores (nome, janeiro, fevereiro, março) values ('José', 1000, 2000, 3000);

create table vendedores_total (
	id_vendedor int primary key auto_increment,
	nome VARCHAR(50) not null,
	janeiro int,
	fevereiro int,
	março int,
	total int,
	media int
);


delimiter $

create procedure inserir_dados_vendedor() 
	begin
		-- Declaração de variáveis
		declare fim int default 0;
		declare v_nome varchar(50);
		declare v_jan, v_fev, v_mar, v_total, v_media int;

		-- Cursor para percorrer os registros da tabela vendedores
		declare registros cursor for 
			select nome, janeiro, fevereiro, março from vendedores;

		-- Handler para o fim do cursor
		declare continue handler for not found set fim = 1;

		open registros;

		-- Loop para processar cada registro
		repeat
			fetch registros into v_nome, v_jan, v_fev, v_mar;
			if not fim then 
				set v_total = v_jan + v_fev + v_mar;
				set v_media = v_total / 3;

				insert into vendedores_total (nome, janeiro, fevereiro, março, total, media) 
				values (v_nome, v_jan, v_fev, v_mar, v_total, v_media);
			end if;
		until fim end repeat;

		close registros;
	end 
	$

delimiter ;

call inserir_dados_vendedor();