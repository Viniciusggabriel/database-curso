-- ! No SQLServer a senha do usuário não poder ter o nome do usuário e tem que ter numeros e caracteres especiais
CREATE LOGIN Vinicius   
    WITH PASSWORD = 'Gabriel1234!',
        DEFAULT_LANGUAGE=[Brazilian];
GO

CREATE USER Vinicius FOR LOGIN Vinicius;
GO

CREATE DATABASE ESTUDOS;

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