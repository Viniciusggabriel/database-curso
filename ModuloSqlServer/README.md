# SQLServer 

## Criação de usuário
Para criar um usuário dentro do SQLServer é necessário uma senha robusta que não tenha o nome do usuário, tenha numero e tenha caracteres especiais

## Bancos padrões de sistema
- Master: Serve como o dicionario dentro do banco de dados, que salva as informações de bancos criados;
- Model: Serve como modelo para a criação de outros bancos de dados;
- Msdb: Serve para ETL como forma de armazenar dados da microsoft;
- Tempdb: Serve como banco temporário.

## Arquivos em SQLServer
- MDF: Master Data File;
- LDF: Log Data File.

## Arquitetura
- O SQLServe é um banco que funciona por meio de transações e atomicidade, quando o banco tem uma query ele salva ela nos logs para que possa ser cacheado
- Dentro desse banco é possivel particionar os dados de forma fisica, algo como particionar um HD para cada departamento salvar suas tabelas, seguindo os grupos de arquivos temos um pandrão que é o primary
    - Primary: Contém informações de inicialização do banco de dados e aponta para os outros arquivos no banco de dados. Todo banco de dados possui um arquivo de dados primário. A extensão de nome de arquivo indicada para arquivos de dados primários é .mdf.
    - Secondary: Arquivos de dados opcionais definidos pelo usuário. Os dados podem ser distribuídos em vários discos, colocando cada arquivo em uma unidade de disco diferente. A extensão de nome de arquivo indicada para arquivos de dados secundários é .ndf.
    - Transations Logs: O log contém informações usadas para recuperar o banco de dados. Deve haver, no mínimo, um arquivo de log para cada banco de dados. A extensão de nome de arquivo indicada para arquivos de transação é .ldf.