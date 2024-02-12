-- 1 -- Campos vetorizados eles se tornão outra tabela

-- [AZUL, ROSA, VERMELHO] -> CORES  
-- Tem de ser da mesma familia 

-- 2 -- Todo campo multivalorado se tornara outra tabela

-- A diferença de um vetor para uma multivaloravel é a natureza dos dados

-- 3 -- Toda tabela necessecita de um campo que tenha uma chave primaria ou seja um valor que define que um registro é unico
-- Por exemplo o CPF, porem usar o CPF você fica dependente de uma outra força 
-- Existe dois tipos de chave
	-- Artificial = Chaves como IDENTIFIE
	-- Natural = Chaves que pertencem ao cliente como o CPF
	
	
-- Sempre para criar essa base de chaves é de acordo com as regras de negócio	
	-- Chave estrangeira é a chave primaria de uma tabela e vai até outra tabela para fazer referencia em entre um registro e outro 
	-- Essa chave vai para a tabela mais fraca do BD quando o relacionamento é (1,1)
	-- Em relacionamento (1,N)  a chave vai para o lado N