# Comandos Iniciais

## CREATE e USE

### Criação do Banco de Dados
> CREATE database-name;

### Seleção do Banco de Dados
> USE database-name;

### Criação de Tabelas
> CREATE TABLE table-name( 
> field-name1 type-field 
> );

## DESC

### Exibe descrição (estrutura) da tabela
> DESC table-name;

## SELECT

### Estrutura Básica:  
> SELECT columns FROM table-name;  

### WHERE
> SELECT columns FROM table-name WHERE logic-operation;

### BETWEEN
> SELECT columns FROM table-name WHERE column BETWEEN value1 AND value2;

### LIKE
% para ignorar qualquer valor  
> SELECT columns FROM table-name WHERE column LIKE '%value%';

_ para ignorar 1 caractere
> SELECT columns FROM table-name WHERE column LIKE '_e%';

## UPDATE
Alterando valores
> UPDATE table SET colulmn = 'new_value' WHERE column = 'valor';

## DELETE 
Deletando registros
> DELETE FROM table-name WHERE column = 'value';

## DROP
Apagando tabela
> DROP TABLE table-name;
