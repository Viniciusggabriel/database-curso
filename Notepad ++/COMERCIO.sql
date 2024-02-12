-- OBS: endereço obrigatorio, cadastro de somente um

DROP TABLE CLIENTE; -- Comando para apagar tabela

CREATE DATABASE COMERCIO;
USE COMERCIO;
CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, -- AUTO ENCREMENTA ESSE VALOR, VARIA DE CADA BANCO
	NOME VARCHAR(40) NOT NULL, -- NÃO PODE SER NULO, OU SEJA OBRIGATORIO
	SEXO ENUM("M", "F") NOT NULL,  -- ENUM ATÉ O MOMENTO DO CURSO SÓ EXISTE NO MYSQL
	EMAIL VARCHAR(50) UNIQUE, -- UNIQUE SERVE PARA APARECER SÓ UMA VEZ
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
    IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(40) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    IDCLIENTE INT UNIQUE,
    FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM("RES", "COM", "CEL") NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	IDCLIENTE INT,
	FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)  -- Cira o campo e linka ele com a outra tabela
);

-- Dentro do mySql para que o banco cuide da chave primaria tem que ser declarado com null

	--Introduzindo no cliente
	-- Nullo no primeiro campo para chave primaria funciona no mySql, mas outros talvez não

INSERT INTO CLIENTE VALUES (NULL,"Vinícius Gabriel", "M", "viniciusggabrielpl@gmail.com", "085.499.671-06");
INSERT INTO CLIENTE VALUES (NULL, "João Silva", "M", "joaosilva@email.com", "123.456.789-10");
INSERT INTO CLIENTE VALUES (NULL, "Maria Oliveira", "F", "mariaoliveira@email.com", "987.654.321-00");
INSERT INTO CLIENTE VALUES (NULL, "Pedro Santos", "M", "pedrosantos@email.com", "456.789.123-20");
INSERT INTO CLIENTE VALUES (NULL, "Ana Souza", "F", "anasouza@email.com", "789.123.456-30");
INSERT INTO CLIENTE VALUES (NULL, "Lucas Pereira", "M", "lucaspereira@email.com", "321.654.987-40");
INSERT INTO CLIENTE VALUES (NULL, "Juliana Lima", "F", "julianalima@email.com", "654.987.321-50");
INSERT INTO CLIENTE VALUES (NULL, "Fernando Costa", "M", "fernandocosta@email.com", "147.258.369-60");
INSERT INTO CLIENTE VALUES (NULL, "Carla Rodrigues", "F", "carlarodrigues@email.com", "258.369.147-70");
INSERT INTO CLIENTE VALUES (NULL, "Rafaela Martins", "F", "rafaelamartins@email.com", "369.147.258-80");
INSERT INTO CLIENTE VALUES (NULL, "Diego Oliveira", "M", "diegooliveira@email.com", "741.852.963-90");


	--Introduzindo no endereço

DESC ENDERECO;

INSERT INTO ENDERECO VALUES (NULL, "Rua Rosenval Alves dos Santos", "Monte Carlos", "Goiânia", "GO", 1);
INSERT INTO ENDERECO VALUES (NULL, "Rua das Flores", "Jardim Primavera", "São Paulo", "SP", 2);
INSERT INTO ENDERECO VALUES (NULL, "Avenida dos Pássaros", "Bairro Novo", "Salvador", "BA", 3);
INSERT INTO ENDERECO VALUES (NULL, "Rua das Palmeiras", "Centro", "Porto Alegre", "RS", 4);
INSERT INTO ENDERECO VALUES (NULL, "Avenida das Acácias", "Jardim Botânico", "Curitiba", "PR", 5);
INSERT INTO ENDERECO VALUES (NULL, "Rua dos Ipês", "Vila Verde", "Fortaleza", "CE", 6);
INSERT INTO ENDERECO VALUES (NULL, "Avenida das Mangueiras", "Cidade Nova", "Manaus", "AM", 7);
INSERT INTO ENDERECO VALUES (NULL, "Rua dos Flamboyants", "Lagoa Azul", "Natal", "RN", 8);
INSERT INTO ENDERECO VALUES (NULL, "Avenida das Orquídeas", "Floresta Encantada", "Brasília", "DF", 9);
INSERT INTO ENDERECO VALUES (NULL, "Rua das Bromélias", "Jardim Tropical", "Belém", "PA", 10);
INSERT INTO ENDERECO VALUES (NULL, "Avenida das Violetas", "Vale das Flores", "Recife", "PE", 11);

	-- Introduzindo no telefone

DESC TELEFONE;

INSERT INTO TELEFONE VALUES (NULL, "CEL", "992952214", 1);
INSERT INTO TELEFONE VALUES (NULL, "COM", "123456789", 2);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "987654321", 3);
INSERT INTO TELEFONE VALUES (NULL, "COM", "555555555", 4);
INSERT INTO TELEFONE VALUES (NULL, "RES", "666666666", 5);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "777777777", 6);
INSERT INTO TELEFONE VALUES (NULL, "RES", "888888888", 7);
INSERT INTO TELEFONE VALUES (NULL, "COM", "999999999", 8);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "111111111", 9);
INSERT INTO TELEFONE VALUES (NULL, "RES", "222222222", 10);
INSERT INTO TELEFONE VALUES (NULL, "COM", "333333333", 11);

	-- Colocando numeros para o mesmo ID

INSERT INTO TELEFONE VALUES (NULL, "CEL", "999888777", 3);
INSERT INTO TELEFONE VALUES (NULL, "RES", "", 3);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "666777888", 6);
INSERT INTO TELEFONE VALUES (NULL, "RES", "444555666", 6);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "123456789", 1);
INSERT INTO TELEFONE VALUES (NULL, "RES", "", 1);
INSERT INTO TELEFONE VALUES (NULL, "CEL", "987654321", 4);
INSERT INTO TELEFONE VALUES (NULL, "RES", "123456789", 4);

DELETE FROM TELEFONE 
WHERE NUMERO LIKE ("987654321");