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
