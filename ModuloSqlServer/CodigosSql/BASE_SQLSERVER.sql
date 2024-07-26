-- ! Colocando o banco de português
SET LANGUAGE Portuguese;

select *
from sys.syslanguages;

-- ! No SQLServer a senha do usuário não poder ter o nome do usuário e tem que ter numeros e caracteres especiais
CREATE LOGIN Vinicius   
    WITH PASSWORD = 'Gabriel1234!',
        DEFAULT_LANGUAGE=[Brazilian];
GO

CREATE USER Vinicius FOR LOGIN Vinicius;
GO

CREATE DATABASE ESTUDOS;
GO

SELECT *
FROM sys.database_principals;

-- ? Deletando usuário
DROP LOGIN Vinicius;
DROP USER Vinicius;

-- Criando banco de dados e verificando o delimitador GO essa clausula serve para dividri o seu payload quando o pacote for enviado para a execução dentro do banco de dados
CREATE DATABASE aula_sql_01 
GO

USE aula_sql_01;
GO

CREATE TABLE AULA_TESE_GO_01
(
    DS_NAME VARCHAR(30)
)
GO

-- ? Criando um grupo de arquivo para as tabelas, arquivos de FILE e de LOG
CREATE DATABASE MyDbPrimary;
GO

ALTER DATABASE MyDbPrimary 
  ADD FILEGROUP MyDB_FG1;
GO

-- ! Arquivo de FILE
ALTER DATABASE MyDbPrimary 
ADD FILE 
(
    NAME='MyDbPrimary-File',
    FILENAME='/var/opt/mssql/data/FileGroup.ndf',
    SIZE=5MB
) TO FILEGROUP MyDb_FG1;
GO

-- ! Arquivo de LOG
ALTER DATABASE MyDbPrimary 
ADD LOG FILE
(
    NAME='MyDbPrimary-LOG',
    FILENAME='/var/opt/mssql/data/FileGroup.ldf'
)
GO

SELECT *
FROM sys.filegroups;
SELECT *
FROM sys.master_files;

-- ? Criação de tabelas
USE ESTUDOS;
GO

CREATE TABLE ALUNO
(
    ID_ALUNO INT PRIMARY KEY IDENTITY(1,1),
    -- Significa de quanto ele vai começar e ir em diante
    DS_NOME VARCHAR(30) NOT NULL,
    DS_SEXO CHAR(1),
    DS_NASCIMENTO DATE NOT NULL,
    DS_EMAIL VARCHAR(30) UNIQUE NOT NULL
)
GO

-- Constraint que verifica a coluna
ALTER TABLE ALUNO  
ADD CONSTRAINT CK_SEXO CHECK (DS_SEXO IN('M', 'F'));
GO

-- ! Adicionando a constraint direto na tabela
CREATE TABLE ENDERECO
(
    ID_ENDERECO INT PRIMARY KEY IDENTITY(100,10),
    DS_BAIRRO VARCHAR(30),
    DS_UF CHAR(2) NOT NULL CHECK (DS_UF IN('RJ', 'SP', 'MG')),
    FK_ID_ALUNO INT UNIQUE
);
GO

ALTER TABLE ENDERECO 
ADD CONSTRAINT FK_ENDERECO_ALUNO FOREIGN KEY (FK_ID_ALUNO) REFERENCES ALUNO(ID_ALUNO);
GO

-- Inserindo
INSERT INTO ALUNO
    (DS_NOME,DS_SEXO,DS_NASCIMENTO,DS_EMAIL)
VALUES
    ('Vinicius', 'M', '2024/01/02', 'Vinicius@email.com'),
    ('Gabriel', 'M', '2002/12/04', 'Gabriel@email.com'),
    ('João', 'M', '2024/06/06', 'João@email.com'),
    ('Pedro', 'M', '2024/01/30', 'Pedro@email.com');
GO

INSERT INTO ENDERECO
    (DS_BAIRRO, DS_UF, FK_ID_ALUNO)
VALUES
    ('BAIRRO01', 'RJ', 7),
    ('BAIRRO03', 'SP', 8),
    ('BAIRRO04', 'MG', 9),
    ('BAIRRO02', 'RJ', 10);
GO

-- Verificando
SELECT AL.ID_ALUNO, AL.DS_NOME, AL.DS_SEXO, AL.DS_NASCIMENTO, AL.DS_EMAIL, ED.DS_BAIRRO, ED.DS_UF
FROM ALUNO AL INNER JOIN ENDERECO ED ON ID_ALUNO = FK_ID_ALUNO;
GO

-- ! Os comandos de dicionario tipo SHOW TABLE, SHOW DATABASE são procedures

-- DESC TABLE
SP_COLUMNS ALUNO
GO

-- Pegar data atual
SELECT GETDATE()
GO

-- ! Testando constrainsts 
INSERT INTO ALUNO
    (DS_NOME,DS_SEXO,DS_NASCIMENTO,DS_EMAIL)
VALUES
    ('Larissa', 'F', '1997/08/08', 'Larissa@email.com')
GO

INSERT INTO ENDERECO
    (DS_BAIRRO, DS_UF, FK_ID_ALUNO)
VALUES
    ('BAIRRO06', 'GO', 11)
GO

-- Datas em sql server, retorna quantos anos a pessoa tem, o primeiro parametro do DATEDIFF serve para ver qual valor será capturado, segundo é o de onde vai vim e o terciero é a lógica
SELECT AL.DS_NOME AS NOME, (DATEDIFF(DAY, AL.DS_NASCIMENTO, GETDATE())/365) AS IDADE
FROM ALUNO AL;
GO

-- DATENAME trás o dia com nome
SELECT AL.DS_NOME AS NOME, DATENAME(WEEKDAY, AL.DS_NASCIMENTO) AS NOME_DATA
FROM ALUNO
AL;
GO

-- ! Conversão de dados em SQL server
SELECT CAST('1' AS INT) + CAST('1' AS INT);
GO

-- CHARINDEX ele busca a palava em cada registro, no caso vai ver onde tem A em cada registro, se passar um terceiro parametro ele pula caracteres 
SELECT AL.DS_NOME AS NOME, CHARINDEX('A', AL.DS_NOME) AS 'INDEX'
FROM ALUNO AL;

-- ! Bulk Insert atrasves de um arquivo no caso o CONTAS.txt
USE ESTUDOS
GO

CREATE TABLE LANCAMENTO_CONTABIL
(
    CONTA INT,
    VALOR INT,
    DEB_CRED CHAR(1)
);
GO

-- cd tmp; touch CONTAS.txt; cat > CONTAS.txt; ctrl + d
-- Comandos para inserir arquivos dentro do container, essa foram de insert em um container é inultil

BULK INSERT LANCAMENTO_CONTABIL
FROM '\tmp\CONTAS.txt' WITH (
    FIRSTROW  = 2,
    DATAFILETYPE = 'char',
    FIELDTERMINATOR = '\t', -- \t é delimitador tab
    ROWTERMINATOR = '\n'
)
GO

-- !!!! \t e \n é como a tabela asc interpreta comandos tipo tab e \n


-- Exercicio

SELECT LC.CONTA, LC.VALOR, CHARINDEX('D', LC.DEB_CRED) AS DEBITO , CHARINDEX('C', LC.DEB_CRED) AS CREDITO, CHARINDEX('D', LC.DEB_CRED) * 2 -1 AS MULTIPLICADOR
FROM LANCAMENTO_CONTABIL LC;
GO

SELECT LC.CONTA, LC.VALOR, LC.DEB_CRED
FROM LANCAMENTO_CONTABIL LC
WHERE LC.CONTA = 4;
GO

SELECT LC.CONTA, SUM(LC.VALOR * (CHARINDEX('D', LC.DEB_CRED) * 2 -1 )) AS SALDO, 'C' AS MODEL
FROM LANCAMENTO_CONTABIL LC
WHERE LC.CONTA = 1 AND LC.DEB_CRED = 'C'
GROUP BY LC.CONTA;
GO