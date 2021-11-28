-- Criando o Banco de Dados 'truevaluespi' --
create database truevaluespi;

-- Selecionando o Banco de Dados --
use truevaluespi;

-- Criando as tabelas --

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

-- Criando a tabela titulo --
create table titulo (
idTitulo int primary key auto_increment,
nomeTitulo varchar (45),
fkGenero int,
foreign key (fkGenero) references genero (idGenero)
)auto_increment=200;

-- Criando a tabela historico --
create table historico (
dtHistorico datetime,
fkCadastro int,
foreign key (fkCadastro) references cadastro (idCadastro),
fkTitulo int,
foreign key (fkTitulo) references titulo (idTitulo)
)auto_increment=300;

select * from historico;
select * from genero;
select * from titulo;

select cadastro.nomeCadastro as 'Nome do Cliente',
       cadastro.genero as 'Gênero de Preferência',
       cadastro.email as 'Email'
       from cadastro;




select cadastro.nomeCadastro as 'Nome do Cliente',
       cadastro.genero as 'Gênero de Preferência',
       cadastro.email as 'Email',
       genero.tipoGenero as 'Gênero de Preferência'
       from cadastro join genero on fkGenero = idGenero;

select cadastro.nomeCadastro as 'Nome do Cliente',
       cadastro.genero as 'Gênero de Preferência',
       cadastro.email as 'Email',
       historico.dtHistorico as 'Data dos Cadastros',
       titulo.nomeTitulo as 'Títulos'
       from cadastro join historico on fkCadastro = idCadastro
                     join titulo on fkTitulo = idTitulo;
       
       
       