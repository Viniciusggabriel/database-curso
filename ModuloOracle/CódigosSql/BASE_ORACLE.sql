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

-- NOTE: Criar e verificar o nome das tablespace e dos nomes dos arquivos
CREATE TABLESPACE TABLESPACE_TESTE
    DATAFILE '/opt/oracle/oradata/FREE/tablespace_teste_data.dbf' SIZE 100m
    AUTOEXTEND ON NEXT 100M MAXSIZE 4096M;

SELECT
    DDF.TABLESPACE_NAME,
    DDF.FILE_NAME,
    ((DDF.BYTES/ 1024)/1024) -- Tamnaho em MB
FROM
    DBA_DATA_FILES DDF;

-- NOTE: Criando sequence
-- Uma sequence no Oracle é um objeto de banco de dados que gera uma sequência de números únicos e incrementais. Ela é amplamente utilizada para gerar valores de chave primária para tabelas, garantindo a unicidade e a integridade dos dados. Diferentemente de outros sistemas de gerenciamento de banco de dados, no Oracle, uma sequence pode ser compartilhada por várias tabelas em todo o banco de dados, tornando-a uma solução mais flexível e escalável para a geração de valores únicos.

-- Começa em 100 e incrementa de 10 em 10
CREATE SEQUENCE SQ_GERAL START WITH 100 INCREMENT BY 10;

-- Tabela para referencia
CREATE TABLE FUNCIONARIOS (
    ID_FUNCIONARIO INT PRIMARY KEY,
    DS_NOME_FUNCIONARIO VARCHAR2(30) -- A diferença do varchar para o varchar2 é que um é só até 255 já o outro ate 4000
) TABLESPACE TABLESPACE_TESTE;

-- Inserindo os dados e verificando se os dados da sequence estão corretos
INSERT INTO FUNCIONARIOS (
    ID_FUNCIONARIO,
    DS_NOME_FUNCIONARIO
) VALUES (
    SQ_GERAL.NEXTVAL,
    'Vinícius'
);

INSERT INTO FUNCIONARIOS (
    ID_FUNCIONARIO,
    DS_NOME_FUNCIONARIO
) VALUES (
    SQ_GERAL.NEXTVAL,
    'Vinícius1'
);

SELECT
    *
FROM
    FUNCIONARIOS;

-- NOTE: Desativando uma tablespace e trocando ponteiro da tablespace
ALTER TABLESPACE TABLESPACE_TESTE OFFLINE;

-- cp opt/oracle/oradata/FREE/tablespace_teste_data.dbf tmp/tablespace_teste_data.dbf comando para teste 
ALTER TABLESPACE tablespace_teste RENAME DATAFILE '/opt/oracle/oradata/FREE/tablespace_teste_data.dbf' TO '/tmp/tablespace_teste_data.dbf'
;