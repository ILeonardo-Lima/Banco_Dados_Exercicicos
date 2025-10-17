create database escola;

--Planilha/Tabela: Estudante
create table estudante(
	id serial primary key, --coluna de identificação
	nome varchar(100), --tamanho é variável
	matricula char(10), --tamanho é fixo
	curso varchar(50),
	login varchar(20),
	senha varchar(15),
	data_nascimento date --recebe datas no formato yyyy-MM-dd
);

--Planilha/Tabela: Docente
create table docente(
	id serial primary key,
	nome varchar(100),
	matricula char(7),
	unidade_curricular varchar(20),
	login varchar(20)
);

alter table estudante add column id_docente int;
--alter table estudante drop column id_docente;

alter table estudante
add foreign key (id_docente)
references docente(id); 

ALTER TABLE docente ADD COLUMN senha varchar(20);

insert into docente(nome, matricula, unidade_curricular, login, senha)
values('Débora', '13040-0', 'Banco de Dados', 'ddsouza', '123456'),
	  ('Carlos', '21345-8', 'React', 'carlos', '456231'),
	  ('Felippe', '45785-6', 'Redes', 'felippe', '789554'),
	  ('Roni', '12565-6', 'Lógica de Prog.', 'roni', '444455'),
	  ('Pedro', '22231-6', 'Infraestrutura', 'pedro', '001222');


insert into estudante(nome, matricula, curso, login, senha, data_nascimento, id_docente)
values('Amanda', '1236547896', 'Banco de Dados', 'amanda', '123', '1990-09-05', 1),
	  ('Bruna', '1254268425', 'Banco de Dados', 'bruna', '123', '1990-09-05', 1),
	  ('Carlos', '5562333025', 'Redes', 'carlos', '123', '1990-09-05', 2),
      ('Davi', '0012336512', 'Banco de Dados', 'davi', '123', '1990-09-05', 2),
	  ('Joice', '0014447528', 'Banco de Dados', 'joice', '123', '1990-09-05', 3),
	  ('Leonardo', '4568555896', 'Banco de Dados', 'leo', '123', '1990-09-05', 3),
	  ('Igor', '0012114111', 'Banco de Dados', 'igor', '123', '1990-09-05', 4),
	  ('Miguel', '3200215201', 'Banco de Dados', 'miguel', '123', '1990-09-05', 4),
	  ('Rafael', '5685785478', 'Banco de Dados', 'rafael', '123', '1990-09-05', 5),
	  ('Maria', '9996845855', 'Banco de Dados', 'maria', '123', '1990-09-05', 5);


--seleciona todas as colunas da tabela docente
select * from docente;

--seleciona somente a coluna nome da tabela docente
select nome from docente;

--seleciona as colunas nome e matrícula da tabela docente
select nome, matricula from docente;

--seleciona todas as colunas da tabela docente onde a unidade_curricula é igual a Banco
select * from docente where unidade_curricular = 'Banco';

--seleciona todas as colunas da tabela docente onde a unidade_curricula começa com R
select * from docente where unidade_curricular like 'R%';

--seleciona todas as colunas da tabela estudante onde a data de nascimento é igual a 1990-09-05
select * from estudante where data_nascimento = '1990-09-05';

--seleciona todas as colunas na tabela docente onde a unidade curricular termina 
--com a letra a
select * from docente where unidade_curricular like '%a';

--seleciona todas as colunas na tabela docente onde a unidade curricular tem a 
--letra a no meio do nome
select * from docente where unidade_curricular like '%a%';

--apelidando tabela docente com a letra d
select * from docente d where d.unidade_curricular like '%a%';

--seleciona o nome do estudante e o nome do docente
select
	d.nome as "Nome do Docente",
	e.nome as "Nome do Estudante"
from estudante e 
inner join docente d on d.id = e.id_docente;