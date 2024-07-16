-- ! No SQLServer a senha do usuário não poder ter o nome do usuário e tem que ter numeros e caracteres especiais
CREATE LOGIN Vinicius   
    WITH PASSWORD = 'Gabriel1234!',
        DEFAULT_LANGUAGE=[Brazilian];

CREATE USER Vinicius FOR LOGIN Vinicius;

SELECT *
FROM sys.database_principals;

-- ? Deletando usuário
DROP LOGIN Vinicius;
DROP USER Vinicius;

-- Criando banco de dados e verificando o delimitador GO essa clausula serve para dividri o seu payload quando o pacote for enviado para a execução dentro do banco de dados
CREATE DATABASE aula_sql_01 
GO

USE aula_sql_01 
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

SELECT * FROM sys.filegroups;
SELECT * FROM sys.master_files;