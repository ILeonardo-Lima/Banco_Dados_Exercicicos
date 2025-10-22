--Loja de roupas
CREATE DATABASE LOJA;

create table produto(
	id serial primary key,
	nome varchar(30),
	preco numeric(5,2),
	quantidade int,
	cor varchar(20),
	tamanho varchar(3)
);

create table categoria(
	id serial primary key,
	nome varchar(30)
);


--Crie a coluna id_categoria como foreign key na tabela produto
alter table PRODUTO add column ID_CATEGORIA INT;
alter table PRODUTO add foreign key (ID_CATEGORIA) references CATEGORIA(ID);


create table cliente(
	id serial primary key,
	nome varchar(100),
	email varchar(50),
	telefone varchar(14)
);

create table atendente(
	id serial primary key,
	nome varchar(100),
	cpf char(11)
);

create table venda(
	id serial primary key,
	data_hora timestamp,
	forma_pagamento varchar(10)
);

--Crie a coluna id_produto como foreign key na tabela venda
ALTER TABLE VENDA add column ID_PRODUTO INT;
alter table VENDA add foreign key (ID_PRODUTO) references PRODUTO(ID);

--Crie a coluna id_atendente como foreign key na tabela venda
ALTER TABLE VENDA add column ID_ATENDENTE INT;
alter table VENDA add foreign key (ID_ATENDENTE) references ATENDENTE(ID);

--Crie a coluna id_cliente como foreign key na tabela venda
alter table VENDA add column ID_CLIENTE INT;
alter table VENDA add foreign key (ID_CLIENTE) references CLIENTE(ID);

INSERT into CATEGORIA (NOME)
values ('INVERNO'),
       ('VERÃO'),
       ('UNISEX'),
       ('MASCULINO'),
       ('FEMININO');


INSERT INTO produto (nome, preco, quantidade, cor, tamanho, id_categoria)
VALUES ('Camisa', 59.90, 5, 'branco', 'P', 1),
('Calça', 99.90, 100, 'preto', 'M', 5),
('Tênis', 199.90, 80, 'azul', '37', 2),
('Boné', 39.90, 10, 'vermelho', 'PP', 3),
('Relógio', 299.90, 2, 'dourado', 'G', 4);
     

insert into CLIENTE (NOME, EMAIL, TELEFONE)
values ('PEDRO', 'PEDRO@GMAIL.COM', '(24)99294-8757'),
       ('JÚLIA', 'JULIA@GMAIL.COM', '(22)2222-8030'),
       ('YUDI', 'YUDI@OUTLOOK.COM.BR', '(21)4002-8922'),
       ('JÉSSICA', 'JE2006@GMAIL.COM', '(22)99294-0938'),
       ('MAYCOM', 'MAIK@GMAIL.COM', '(24)99295-0900');

insert into ATENDENTE (NOME, CPF)
values ('Lucas', '12345678909'),
       ('Mariana', '98765432100'),
       ('Bruno', '32178965470'),
       ('Ana', '85274196344'),
       ('Rafael', '74185296320');

INSERT INTO venda (data_hora, forma_pagamento, id_produto, id_atendente, id_cliente)
VALUES 
('2025-10-22 08:15:00', 'PIX', 1, 5, 2),
('2025-10-21 14:30:00', 'CRÉDITO', 2, 3, 4),
('2025-10-20 19:45:00', 'DÉBITO', 3, 1, 5),
('2025-10-19 12:00:00', 'DINHEIRO', 4, 3, 1),
('2025-10-18 09:10:00', 'PIX', 5, 2, 4);

-- 1. Listar todos os produtos
SELECT * FROM produto;

-- 2. Listar todos os clientes
SELECT * FROM cliente;

-- 3. Mostrar apenas os nomes e preços dos produtos
SELECT nome, preco FROM produto;

-- 4. Mostrar nome e CPF dos atendentes
SELECT nome, cpf FROM atendente;

-- 5. Mostrar data e forma de pagamento das vendas
SELECT data_hora, forma_pagamento FROM venda;

--------------------------------------------------------

-- 1. Produtos com preço maior que 100
select * from PRODUTO where PRECO > 100;

-- 2. Clientes com telefone de DDD 22
select * from CLIENTE where TELEFONE like '(22)%';

-- 3. Vendas feitas com PIX
select * from VENDA where FORMA_PAGAMENTO = 'PIX';

-- 4. Atendentes com nome começando com 'M'
select * from ATENDENTE where NOME like 'M%';

-- 5. Produtos de cor preta
select * from PRODUTO where COR = 'PRETO';

--------------------------------------------------------

-- 1. Listar produtos ordenados por preço decrescente
select * from PRODUTO order by PRECO desc;

-- 2. Listar clientes por ordem alfabética
select * from CLIENTE order by NOME asc;      

-- 3. Listar vendas da mais recente para a mais antiga
select * from VENDA order by DATA_HORA asc;

--------------------------------------------------------

-- 1. Produtos com preço > 100 **e** quantidade < 10
select * from PRODUTO where PRECO > 100 and QUANTIDADE < 10;

-- 2. Clientes com nome Pedro **ou** Maycom
select * from CLIENTE where NOME = 'PEDRO' or NOME = 'MAYCOM';

-- 3. Vendas feitas com PIX **ou** CRÉDITO
select * from VENDA where FORMA_PAGAMENTO = 'PIX' or FORMA_PAGAMENTO = 'CRÉDITO'

--------------------------------------------------------

-- 1. Produtos que terminam com 'A'
SELECT * FROM produto WHERE nome LIKE '%A';

-- 2. Clientes com email do Gmail
SELECT * FROM cliente WHERE email LIKE '%@OUTLOOK.COM%';

-- 3. Atendentes com nome contendo 'an'
SELECT * FROM atendente WHERE nome LIKE '%an%';

-- 4. Produtos com cor que começa com 'B'
SELECT * FROM produto WHERE cor LIKE 'B%';

-- 5. Telefone que termina com '00'
SELECT * FROM cliente WHERE telefone LIKE '%00';

--------------------------------------------------------

-- 1. Vendas com nome do cliente
SELECT v.id, v.data_hora, c.nome AS cliente
FROM venda v
INNER JOIN cliente c ON v.id_cliente = c.id;

-- 2. Vendas com nome do atendente
SELECT v.id, v.data_hora, a.nome AS atendente
FROM venda v
INNER JOIN atendente a ON v.id_atendente = a.id;

-- 3. Vendas com data/hora, forma de pagamento e o nome do produto vendido
SELECT 
    v.id AS id_venda,
    v.data_hora,
    v.forma_pagamento,
    p.nome AS produto
FROM venda v
INNER JOIN produto p ON v.id_produto = p.id;

-- 4. Produtos com seu preço e categoria
SELECT 
    p.id AS id_produto,
    p.nome AS produto,
    p.preco,
    c.nome AS categoria
FROM produto p
INNER JOIN categoria c ON p.id_categoria = c.id;

-- 5. Vendas com nome do cliente, atendente e produto
SELECT 
    v.id AS id_venda,
    v.data_hora,
    v.forma_pagamento,
    c.nome AS cliente,
    a.nome AS atendente,
    p.nome AS produto
FROM venda v
INNER JOIN cliente c ON v.id_cliente = c.id
INNER JOIN atendente a ON v.id_atendente = a.id
INNER JOIN produto p ON v.id_produto = p.id;

--------------------------------------------------------

-- View 1: Vendas com o nome produto
create view VENDAS_NOME_PRODUTO as
select NOME
from PRODUTO
where cor = 'preto';

-- View 2: Produtos com sua categoria
create view CATETG_PROD as
select NOME
from CATEGORIA
where NOME = 'VERÃO';

-- View 3: Vendas com nome do cliente, atendente e produto
create view VENDAS as 
select  c.nome cliente, a.nome atendente, p.nome produto
from venda v
JOIN cliente c ON v.id_cliente = c.id
JOIN atendente a ON v.id_atendente = a.id
JOIN produto p ON v.id_produto = p.id;

-- View 4: Clientes com e-mail do outlook
create view email_out as
select email
from cliente
where email like '%OUTLOOK%';

-- View 5: Produtos com preço acima de 100
create view maior_prod as
select preco
from produto 
where preco > 100;










