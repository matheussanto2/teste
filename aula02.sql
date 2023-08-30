CREATE DATABASE banco;

create table cliente(
	idcliente integer not null,
	nome varchar(30) not null,
	logradouro varchar(30),
	bairro varchar(30),
	municipio varchar(30),
	uf char(2)
);

select * from cliente;

create table investimento(
	idInvestimento integer not null,
	nome varchar(30),
	saldo real
);

create table colaboradores(
	idcolaborador integer not null,
	nome varchar(30),
	cargo varchar(30)
);

	
create table conta(
	idConta integer not null,
	nome_agencia varchar(30) not null,
	saldo real
); 

create table agencia(
	idagencia integer not null,
	nome varchar(30)
);

alter table investimento add column renda_fixa varchar(30);

select * from investimento;

CREATE SCHEMA Danielle;
