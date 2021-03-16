# Comandos Iniciais

## CREATE e USE

### Criação do Banco de Dados
~~~mysql
CREATE database-name;
~~~

### Seleção do Banco de Dados
~~~mysql
USE database-name;
~~~

### Criação de Tabelas
~~~mysql
CREATE TABLE table-name( 
    field-name1 type-field 
);
~~~

## DESC

### Exibe descrição (estrutura) da tabela
~~~mysql
DESC table-name;
~~~

## SELECT

### Estrutura Básica:
~~~mysql
SELECT columns FROM table-name;  
~~~

### WHERE
~~~mysql
SELECT columns FROM table-name WHERE logic-operation;
~~~

### BETWEEN
~~~mysql
SELECT columns FROM table-name WHERE column BETWEEN value1 AND value2;
~~~

### LIKE
% para ignorar qualquer valor
~~~mysql
SELECT columns FROM table-name WHERE column LIKE '%value%';
~~~

_ para ignorar 1 caractere
~~~mysql
SELECT columns FROM table-name WHERE column LIKE '_e%';
~~~

## UPDATE
Alterando valores
~~~mysql
UPDATE table SET colulmn = 'new_value' WHERE column = 'valor';
~~~

## DELETE 
Deletando registros
~~~mysql
DELETE FROM table-name WHERE column = 'value';
~~~

## DROP
Apagando tabela
~~~mysql
DROP TABLE table-name;
~~~

## FOREIGN KEY
~~~mysql
CREATE TABLE table1(
    ...
    column1 INT,
    FOREIGN KEY (column) REFERENCES table2(column2)
    ...
);
~~~