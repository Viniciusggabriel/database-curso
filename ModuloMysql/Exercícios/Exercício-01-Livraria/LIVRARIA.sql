CREATE DATABASE LIVRARIA;

USE LIVRARIA; CREATE TABLE LIVROS (

NOME_DO_LIVRO VARCHAR(25),
NOME_DO_AUTOR VARCHAR(30),
SEXO_DO_AUTOR VARCHAR(9),
NUMERO_DE_PAGINAS CHAR(4),
NOME_DA_EDITORA VARCHAR(20),
VALOR_DO_LIVRO FLOAT(6),
ANO_DE_PUBLICACAO INT(4),
UF_DA_EDITORIA CHAR(2)
);

INSERT INTO LIVROS VALUES (
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
SELECT
	*
FROM
	LIVROS;

/* #Trazer o nome do livro e o nome da editora; */
SELECT
	NOME_DO_LIVRO,
	NOME_DA_EDITORA
FROM
	LIVROS;

/* #Trazer o nome do livro e a UF dos livros publicas por autores do sexo maculino; */
SELECT
	NOME_DO_LIVRO,
	UF_DA_EDITORIA
FROM
	LIVROS
WHERE
	SEXO_DO_AUTOR = 'Masculino';

/* #Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino; */
SELECT
	NOME_DO_LIVRO,
	NUMERO_DE_PAGINAS
FROM
	LIVROS
WHERE
	SEXO_DO_AUTOR = 'Feminino';

/* SELECT 
    Valor_do_livro
FROM
    LIVROS
WHERE
    UF_da_editoria = 'SP'#Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Desafio); */
SELECT
	*
FROM
	LIVROS
 /* O AND SERVE PARA ADICIONAR MAIS UMA CONDIÇÃO E O OR TAMBÉM */
WHERE
	SEXO_DO_AUTOR = 'Masculino'
	AND (UF_DA_EDITORIA = 'SP'
	OR UF_DA_EDITORIA = 'RJ');