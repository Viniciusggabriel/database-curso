# CursoUdemy_BancoDeDados

Curso de Banco de dados com mySql, Oracle, t-sql e plSql

## 1 -- Campos vetorizados eles se tornam outra tabela -- [AZUL, ROSA, VERMELHO] -> CORES -- Tem de ser da mesma familia

## 2 -- Todo campo multivalorado se tornara outra tabela -- A diferença de um vetor para uma multivalora vel é a natureza dos dados

## 3 -- Toda tabela necessita de um campo que tenha uma chave primaria ou seja um valor que define que um registro é único

-- Por exemplo o CPF, porem usar o CPF você fica dependente de uma outra força -- Existe dois tipos de chave -- Artificial = Chaves como IDENTIFIED -- Natural = Chaves que pertencem ao cliente como o CPF -- Sempre para criar essa base de chaves é de acordo com as regras de negócio -- Chave estrangeira é a chave primaria de uma tabela e vai até outra tabela para fazer referencia em entre um registro e outro -- Essa chave vai para a tabela mais fraca do BD quando o relacionamento é (1,1) -- Em relacionamento (1,N) a chave vai para o lado N

## 4 -- DMl, DDL, DCL, TCL

- DML = Data manipulation language  
  -- É basicamente a manipulação do banco de dados, como select, update e delete
- DDL = Data definition language  
  -- É a definição do banco de dados, por exemplo quando se cria uma tabela e você define os valores par as colunas  
  -- ALTER TABLE `ALTER TABLE PRODUTO CHANGE PRECO VALOR_UNITARIO INT NOT NULL`
- DCL = Data control language
- TCL = Transaction control language

## Sistema desenvolvido no modelo MVC

    1. Desenvolvido na base:
       - Model = Banco de dados
       - View = Front-end
       - Controller = Back-end

    2. Em um modelo MVC a regra de negócio fica dentro do back end ou no banco de dados, assim ficando separado o servidor de aplicação do de banco de dados
        - Usando procedure para programar as query do DB
        - Se colocar a regra de negócio dentro do BD fica complicado mudar a regra de negocio, os dados são fácil de mudar pois usam o SQL como padrão, porem em concorrência a isso você perde processamento dentro do BD
        - Quando tem a RN dentro do banco fica relativamente mais seguro devido a dar erro somente na procedure

## Programação dentro do banco de dados

    1. Dentro do escopo de banco de dados existe a programação de banco de dados, que conecta direto do view para o banco de dados, porem serve somente para pequenas validações, a partir do momento que se trata com grandes conjuntos de dados essa arquitetura se torna perigosa
