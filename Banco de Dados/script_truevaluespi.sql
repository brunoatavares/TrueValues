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
dtHistorico int primary key auto_increment,
fkCadastro int,
foreign key (fkCadastro) references cadastro (idCadastro),
fkTitulo int,
foreign key (fkTitulo) references titulo (idTitulo)
)auto_increment=300;

select * from historico;
select * from genero;
select * from titulo;
select * from cadastro;

insert into genero (tipoGenero) values 
('Filme'),
('Série'),
('Documentário');

insert into titulo (nomeTitulo, fkGenero) values
('Paternidade',100),
('Treino para a Vida',100),
('O Dilema das Redes',100),
('Eu não sou seu negro',100),
('Pelé',102),
('Tropa de Elite',100),
('Breaking Bad',101);

insert into historico (fkCadastro, fkTitulo) values
(1,225),
(2,221),
(3,227),
(4,223),
(5,225),
(6,225),
(7,226),
(8,227),
(9,227),
(10,224);

-- Referênciando as chaves estrangeiras --
update cadastro set fkGenero = 100 where idCadastro in (2,4,7,10);
update cadastro set fkGenero = 101 where idCadastro in (3,8,9);
update cadastro set fkGenero = 102 where idCadastro in (1,5,6);

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
       from cadastro join historico on idCadastro = fkCadastro
                     join titulo on fkTitulo = idTitulo;
       
       
       