/* 
NOTE: Aprendendo dicionario de dados em oracle
*/

-- Demonstra os usuários dentro do banco de dados
SHOW USER;

SELECT
    DU.USERNAME,
    DU.PASSWORD
FROM
    DBA_USERS DU;

-- Resulta em 2
SELECT
    1 + 1 AS SOMA;

-- Pega direto do metada a arquitetura do sistema se é 64 bits ou 32 B023 -> 32Bits e B047 -> 64Bits
SELECT
    METADATA
FROM
    SYS.KOPM$;

-- Verifica se estou usando paralelismo no meu banco
SELECT
    PARALLEL
FROM
    V_$INSTANCE;

-- Busca a estrutura de memoria do banco de dados
SELECT
    V_SGA_DC.COMPONENT,
    V_SGA_DC.CURRENT_SIZE,
    V_SGA_DC.MIN_SIZE,
    V_SGA_DC.MAX_SIZE
FROM
    V_$SGA_DYNAMIC_COMPONENTS V_SGA_DC;

-- Busca o nome do banco
SELECT
    NAME
FROM
    V_$DATABASE;

-- Verifica os privilegios do usuário sistema
SELECT
    *
FROM
    USER_SYS_PRIVS;

-- Selectionando as tableas e tablespaces presentes dentro do banco baseado em cada usuário
SELECT
    UT.TABLE_NAME,
    UT.TABLESPACE_NAME
FROM
    USER_TABLES UT;

-- NOTE: Criando um usuário e dando permissões
-- Cria o usuário, ver~soa usada dentro do container todos usuários devem começar com c## e o identified by serve como senha
CREATE USER C##VINICIUS IDENTIFIED BY Vinicius1;

-- Adiciona o usuário ao tablespace USERS e TEMPORARY ao tablespace TEMP
ALTER USER C##VINICIUS DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;

-- Adiciona permissão de criar sessão ao usuário
GRANT CREATE SESSION TO C##VINICIUS;

-- Adiciona permissão de criar tabela ao usuário
GRANT CREATE TABLE TO C##VINICIUS;

-- Altera minha senha de usuário
ALTER USER C##VINICIUS IDENTIFIED BY VINICIUS;
-- NOTE: para ver mais https://www.devmedia.com.br/criando-usuarios-e-liberando-privilegios-e-atribuicoes-no-oracle/26414