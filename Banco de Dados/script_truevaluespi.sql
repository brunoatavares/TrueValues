-- Criando o Banco de Dados 'truevaluespi' --
create database truevaluespi;

-- Selecionando o Banco de Dados --
use truevaluespi;

-- Criando as tabelas --
select * from cadastro;
-- Criando a tabela cadastro --
create table cadastro (
idCadastro int primary key auto_increment,
nomeCadastro varchar (45),
genero varchar (45) 
check ( genero = 'Série' or genero = 'Filme' or genero = 'Documentario'),
email varchar (45) unique,
senha varchar (10),
fkGenero int,
foreign key (fkGenero) references genero (idGenero)
);

-- Criando a tabela gênero --
create table genero (
idGenero int primary key auto_increment,
tipoGenero varchar (45)
)auto_increment=100;

-- Criando a tabela filmes --
create table filmes (
idFilmes int primary key auto_increment,
nomeFilme varchar (45),
fkGenero int,
foreign key (fkGenero) references genero (idGenero)
)auto_increment=200;

-- Criando a tabela historico --
create table historico (
dtHistorico datetime,
fkCadastro int,
foreign key (fkCadastro) references cadastro (idCadastro),
fkFilmes int,
foreign key (fkFilmes) references filmes (idfilmes)
)auto_increment=300;

select cadastro.nomeCadastro as 'Nome do Cliente',
       cadastro.genero as 'Gênero de Preferência',
       cadastro.email as 'Email',
       