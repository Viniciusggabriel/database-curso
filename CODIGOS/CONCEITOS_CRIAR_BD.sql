 Criando primeiro BD do curso, projeto de cadastro simples de cliente
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
INSERT INTO TABELA VALUES ('VINICIUS', NUMBER)

-- Formas de inserir os dados 
INSERT INTO CLIENTE VALUES ('VINÍCIUS', 'M', 'VINICIUSGGABRIEL989@GMAIL.COM', '08549967106', '(62)992952214', 'RUA ROSENVAL ALVES DOS SANTOS');

INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES ('GABRIEL', 'M', 'RUA ROSENVAL ALVES DOS SANTOS', '(62)992952214', '0849967106');

INSERT INTO CLIENTE VALUES  -- Insere dois itens do BD
	('VINÍCIUS12', 'M', 'VINICIUSGGABRIEL989@GMAIL.COM', '08549967106', '(62)992952214', 'RUA ROSENVAL ALVES DOS SANTOS'),
	('VINÍCIUS13', 'M', 'VINICIUSGGABRIEL989@GMAIL.COM', '08549967106', '(62)992952214', 'RUA ROSENVAL ALVES DOS SANTOS');
	
-- Select é um comando que existe em todos os BD 
-- Quando alguém te pede para ver um item basicamente é um Select 
 
-- O Comando SHOW table é basicamente um select dentro do dicionário de dados, fazendo uma projeção

SELECT NOW(); -- Serve para projetar e trazer itens de uma tabela
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;
SELECT NOME, SEXO, EMAIL FROM CLIENTE;
SELECT  * FROM CLIENTE;

-- Select = projeção já where = seleção 

SELECT NOME AS CLIENTE, ENDERECO FROM CLIENTE
WHERE SEXO = 'M';  -- Por exemplo ele filtra nesse script independente dos itens do select

SELECT NOME AS CLIENTE, SEXO, ENDERECO FROM CLIENTE 
WHERE ENDERECO LIKE '%SANTOS';  -- Trabalha com caracter coringa usasse o % para pegar qualquer coisa que termine em santos 

-- Comando 
SHOW DATABASES; -- Serve para ver os databases

-- Tabela verdade
-- Mesma ideia das portas OR e AND
-- O AND SERVE PARA ADICIONAR MAIS UMA CONDIÇÃO E O OR TAMBÉM 
SELECT * FROM LIVROS
WHERE Sexo_do_autor = 'Masculino' AND (UF_da_editoria = 'SP' OR UF_da_editoria = 'RJ') AND Numero_de_paginas  > 100; 

-- Ver quantos registros por linha tem em uma tabela
SELECT COUNT(*) AS "REGISTROS" FROM LIVROS;

-- Operadores
-- Group BY
SELECT  Sexo_do_autor, COUNT(*) AS "REGISTROS" FROM LIVROS GROUP BY Sexo_do_autor;

-- Filtrando valores nulos --
SELECT nome, sexo FROM cliente
WHERE sexo = 'F';

-- Vai igualar a nulo
SELECT nome, sexo, endereco FROM cliente
WHERE email =  NULL;

-- Vai pegar os nulos
SELECT nome, sexo, endereco FROM cliente
WHERE email IS  NULL;

-- Vai pegar os que não são nulos
SELECT nome, sexo, endereco FROM cliente
WHERE email IS NOT  NULL;

-- Fazendo update em uma tabela com nulos --
SELECT nome, sexo, email FROM cliente;

-- Há um problema nesse código, ele troca TODOS os emails da tabela
-- Não importa o banco, cláusulas como WHERE vão ser o seu melhor amigo na hora de filtrar, fazer update e deletar
UPDATE cliente 
SET email = "joao.oliveira@gmail.com"
WHERE nome LIKE 'João%';

-- Deletar dados da tabela --
DELETE FROM cliente;

 -- Ver o que vai ser deletado antes de fazer
 SELECT * FROM cliente WHERE nome LIKE "Ana%" ;
SELECT COUNT(*) AS CLIENTE_COUNT FROM CLIENTE;

-- DELETA O ITEM QUE SE PAREÇA COM Ana
DELETE FROM cliente
WHERE nome LIKE "Ana%";

-- Deleta nome lucas que tem o email teste@gmail.com
DELETE FROM cliente
WHERE nome LIKE 'Lucas' AND email = 'teste@gmail.com'; 