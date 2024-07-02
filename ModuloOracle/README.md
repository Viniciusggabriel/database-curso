# Oracle 11g: Resumo do Sistema de Gerenciamento de Banco de Dados Relacional

O Oracle 11g é um Sistema de Gerenciamento de Banco de Dados Relacional amplamente utilizado em ambientes corporativos devido à sua robustez e capacidade de lidar com grandes volumes de dados.

## Componentes Principais

### Datablocks

Datablocks são espaços físicos em disco usados pelo Oracle para armazenar dados de forma eficiente.

### Segmentos

Segmentos são objetos lógicos no Oracle, como tabelas, índices e partições, que ocupam espaço em um tablespace.

### Extents

Extents são unidades de alocação de armazenamento dentro de segmentos, alocadas dinamicamente conforme necessário.

## Otimização para Tipos de Operações

O Oracle 11g é otimizado para dois tipos principais de operações:

- **OLTP (Online Transaction Processing)**: Focado em operações transacionais de alta frequência.
- **OLAP (Online Analytical Processing)**: Voltado para consultas e análise de grandes volumes de dados.

## Estruturas de Armazenamento Físico

### Tablespaces

Tablespaces são unidades lógicas de armazenamento no Oracle, onde segmentos são armazenados.

### Datafiles

Datafiles são arquivos físicos que pertencem a um tablespace e armazenam os dados dos segmentos.

## Gerenciamento Avançado de Armazenamento

### Gerenciamento de Espaço

O Oracle 11g utiliza alocação dinâmica de extents para otimizar o uso de espaço em disco.

### Controle de Concorrência

Mecanismos robustos garantem a integridade dos dados em ambientes multiusuário.

### Recuperação de Falhas

Capacidade de recuperar dados em caso de falhas através de backups e logs de transações, que estão presentes no archive.

### Gerenciamento de Arquivos

CONTROLFILES, DATAFILES, SPFILE e PFILE são essenciais para configurar e administrar o Oracle 11g.

### Gerenciamento de LOGS e alertas

São arquivos TRACE, ou .trc que servem para monitorar o banco de dados, para alerta é a mesma lógica de arquivos porem automático.

### Gerenciamento de Usuários

O Oracle possui um arquivo com senhas criptografadas para o gerenciamento de usuário.

### Gerenciamento de backup

Compostos de DBFs, controlfiles, archivelogs e os arquivos de inicialização

## Tablespaces padrões dentro do oracle

- **System e Sysaux**: São duas tablespaces que armazenam toda parte importante para o funcionamento de banco e organização;
- **Undo**: É a responsável pela integridade do banco de dados, auxilia em uma leigalidade de transações consistente;
- **Temp**: É uma tablespace temporária, onde o banco de dados armazena dados temporários, como índices, tabelas temporárias, etc.

## Estrutura de memoria

### Memoria

O oracle pega 40% de memoria ram do servidor por padrão como valor mínimo e elá é dividia em compartilhada e dedicada:

- **Dedicada** é exclusiva para cada usuário dentro do banco de dados;
- **Compartilhada** é a que todos usam so mesmo tempo.

### SGA

É uma área de memória compartilhada por todos os usuários da base de dados. Tem como objetivo compartilhar o acesso para melhorar a performance de cada instancia SGA, e tem como objetivo evitar retrabalho.

### Shared pool

Uma serie de passos que o banco de dados segue para poder entregar da melhor forma os dados para o cliente e para o servidor, fazendo cache dos códigos SQL fornecidos recentemente e definindo no dicionario de cache.

### Data base buffer cache

Dentro do oracle tem esses passos cliente faz query? sim, pega dados do buffer cache caso não ele lê os blocos no HD no caso os datablocks e retorna para o usuário porem também salva em cache para caso outro usuário queira fazer a mesma query ele já tenha armazenado;

- Esse buffer vai definido pelo datablock no caso de 2K, 4K, 8K, 15K e 32k.
- O Database buffer cache mantém uma lista com os blocos mais utilizados e vai liberando espaço de acordo com os blocos menos utilizados sempre que necessário para acessar informações novas.

### Redolog

O redolog é uma forma de segurança para quando o banco de dados cair ele ter uma forma de recuperar os commits feitos.

- Redolog buffer é o local onde o redolog armazena os commits.

### Large pool

Dentro da PGA temos a large pool que serve para rotinas de backup e não ocupar a shared pool, sendo usada para armazenamento de query grandes que ocupam muito espaço.

### Java pool

Java pool serve para armazenar códigos java e JVM dentro do banco de dados ocupando um espaço dentro do banco;

### Streams pool

Streams pool é a área que armazena serviço de mensageira e replicação de dados.

### PGA

É alocada uma área de PGA por sessão, que auxilia os usuários com cláusulas ORDER BY ou DISTINCT, variáveis BIND ou VARIÁVEIS de sessão.

## Formas de configurar seu PGA e SGA

- **Manual**: Versões antigas Configurar parâmetro a parâmetro de cada uma das áreas

  - DATABASE_CACHE_SIZE
  - SHARED_POOL_SIZE
  - PGA_AGGREGATE_TARGET

- **AMM**: Versão 10G Automatic Memory Management São dois parâmetros que alocam dinamicamente o tamanho da suas áreas internas

  - SGA_TARGET
  - PGA_AGGREGATE_TARGET

- **ASMM**: Versão 11G para frente  Automatic Shared Memory Management Apenas uma parâmetro para ambos onde nenhuma das áreas tem tamanho fixo e tem configuração interna dinâmica
  - MEMORY_TARGET

## Processos 

- **PMON**: Responsável por monitorar o processo do banco de dados;
- **SMON**: Responsável por monitorar o processo do servidor;
- **DBWritern**: Responsável por escrever os dados no Buffer cache;
- **DBBC**: Responsável por ler os dados do Buffer cache e liberar memoria para novos commits;
- **LGWR**: Intermediário entro o REDOLOG BUFFER e os arquivos de REDOLOG;
- **CKPT**: Quem sinaliza ao DBW o momento de gravação do DBBC nos datafiles;
- **MMON**: Associado ao AWEiter. Captura as estatísticas do banco;
- **MMNL**: Grava as estatísticas do banco ASH e parte do AWR em disco;
- **RECO**: Recupera ou finaliza as falhas de transações.

# Docker

 Os dados para poder acessar o oracle no docker são 

 - Usuário: sys
 - Senha: A senha setada no compose
 - Atribuição: SYSDBA
 - Tipo de conexão: Básico

Ao executar o docker compose up -d faça isso para obter o nome do serviço

- `docker exec -it oracle-db-free bash`
- `sqlplus / as sysdba`
- `SHOW PARAMETER service_names`

E pegue o valor para o service name, para realizar a conexão ao BD