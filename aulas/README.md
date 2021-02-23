# Comandos Iniciais

## CREATE e USE

### Criação do Banco de Dados:
> CREATE database-name;

### Seleção do Banco de Dados:
> USE database-name;

### Criação de Tabelas:
> CREATE TABLE table-name( 
> field-name1 type-field 
> );

## DESC

### Exibe descrição (estrutura) da tabela:
> DESC table-name;

## SELECT

### Estrutura Básica:  
> SELECT columns FROM table-name;  

### Cláusula WHERE:
> SELECT columns FROM table-name WHERE logic-operation;

### BETWEEN:
> SELECT columns FROM table-name WHERE column BETWEEN value1 AND value2;

### LIKE:
> SELECT columns FROM table-name WHERE colum LIKE '%value%';
