CREATE DATABASE LIVRARIA USE LIVRARIA CREATE TABLE LIVROS (
	Nome_do_livro VARCHAR(25),
	Nome_do_autor VARCHAR(30),
	Sexo_do_autor VARCHAR(9),
	Numero_de_paginas CHAR(4),
	Nome_da_editora VARCHAR(20),
	Valor_do_livro FLOAT(6),
	Ano_de_publicacao INT(4),
	UF_da_editoria CHAR(2)
);
INSERT INTO LIVROS
--/ para float tem que se usar o . ao invés de ,
VALUES (
		'Cavaleiro Real',
		'Ana Claudia',
		'Feminino',
		'465',
		'Atlas',
		49.9,
		2009,
		'RJ'
	),
	(
		'SQL para leigos',
		'João Nunes',
		'Masculino',
		'450',
		'Addison',
		98,
		2018,
		'SP'
	),
	(
		'Receitas Caseiras',
		'Celia Tavares',
		'Feminino',
		'210',
		'Atlas',
		45,
		2008,
		'RJ'
	),
	(
		'Pessoas Efetivas',
		'Eduardo Santos',
		'Masculino',
		'390',
		'Beta',
		78.99,
		2018,
		'RJ'
	),
	(
		'Habitos Saudáveis',
		'Eduardo Santos',
		'Masculino',
		'630',
		'Beta',
		150.98,
		2019,
		'RJ'
	),
	(
		'A Casa Marrom',
		'Hermes Macedo',
		'Masculino',
		'250',
		'Bubba',
		60,
		2016,
		'MG'
	),
	(
		'Estacio Querido',
		'Geraldo Francisco',
		'Masculino',
		'310',
		'Insignia',
		100,
		2015,
		'ES'
	),
	(
		'Pra sempre amigas',
		'Leda Silva',
		'Feminino',
		'510',
		'Insignia',
		78.98,
		2011,
		'ES'
	),
	(
		'Copas Inesqueciveis',
		'Marco Alcantara',
		'Masculino',
		'200',
		'Larson',
		130.98,
		2018,
		'RS'
	),
	(
		'O poder da mente',
		'Clara Mafra',
		'Feminino',
		'120',
		'Continental',
		56.58,
		2017,
		'SP'
	);


/* #Trazer todos os dados; */
 SELECT * FROM LIVROS;

/* #Trazer o nome do livro e o nome da editora; */
SELECT Nome_do_livro, Nome_da_editora FROM LIVROS;

/* #Trazer o nome do livro e a UF dos livros publicas por autores do sexo maculino; */
SELECT Nome_do_livro, UF_da_editoria FROM LIVROS
WHERE Sexo_do_autor = 'Masculino';

/* #Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino; */
SELECT Nome_do_livro, Numero_de_paginas FROM LIVROS
WHERE Sexo_do_autor = 'Feminino';

/* #Trazer os valores dos livros das editorias de São Paulo; */
SELECT Valor_do_livro FROM LIVROS
WHERE UF_da_editoria = 'SP';

/* #Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Desafio); */
SELECT * FROM LIVROS

/* O AND SERVE PARA ADICIONAR MAIS UMA CONDIÇÃO E O OR TAMBÉM */
WHERE Sexo_do_autor = 'Masculino' AND (UF_da_editoria = 'SP' OR UF_da_editoria = 'RJ'); 
