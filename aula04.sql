CREATE DATABASE bd_aula04;

CREATE DOMAIN chk_categoria text check (value = 'DRAMA' or value = 'COMEDIA');

CREATE DOMAIN chk_status text check (value = 'DISPONIVEL' or value = 'ALUGADO');

CREATE TABLE tbl_cliente (
	codigo_cliente integer PRIMARY KEY,
	nome varchar(30) NOT NULL,
	cidade varchar(30),
	endereço varchar(30)
);

CREATE TABLE tbl_titulo (
	codigo_titulo integer PRIMARY KEY,
	titulo varchar(30) NOT NULL,
	descricao varchar(100),
	categoria chk_categoria
);

CREATE TABLE tbl_livros (
	codigo_livro integer PRIMARY KEY,
	codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo),
	status chk_status DEFAULT 'DISPONIVEL'	
);

CREATE TABLE tbl_emprestimo (
	numero_emprestimo integer PRIMARY KEY,
	codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente),
	codigo_livro integer REFERENCES tbl_livros(codigo_livro)
);              


-- Inserindo dados na tabela tbl_cliente:

SELECT * from tbl_cliente;

INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereço)
VALUES (001, 'João da Silva', 'São Paulo', 'Rua das Flores, 123'), (002, 'Maria Santos', 'Rio de Janeiro', 'Avenida das Palmeiras, 456'), (003, 'Carlos Pereira', 'Belo Horizonte', 'Travessa das Estrelas, 789'), (004, 'Ana Oliveira', 'Salvador', 'Praça da Liberdade, 101'), (005, 'Pedro Almeida', 'Brasília', 'Quadra dos Sonhos, 222');

-- Inserindo dados na tabela tbl_titulo:

select * from tbl_titulo;

INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES (101, 'O Mistério do Enigma', 'Um thriller emocionante.', 'DRAMA'), (102, 'A Jornada Perdida', 'Uma aventura épica.', 'COMEDIA'), (103, 'Amor nas Estrelas', 'Um romance celestial.', 'DRAMA'), (104, 'Crime na Metrópole', 'Um Mistério Urbano.', 'DRAMA'), (105, 'A Magia Esquecida', 'Uma fantasia encantadora.', 'COMEDIA');

-- Inserindo dados na tabela tbl_livros:

SELECT * from tbl_livros;

INSERT INTO tbl_livros (codigo_livro, codigo_titulo, status)
VALUES (001, 101, 'DISPONIVEL'), (002, 102, 'ALUGADO'), (003, 103, 'DISPONIVEL'), (004, 104, 'ALUGADO'), (005, 105, 'DISPONIVEL');

-- Inserindo dados na tabela tbl_emprestimo:

SELECT * from tbl_emprestimo;

INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES (001, 001, 001), (002, 002, 003), (003, 003, 005), (004, 004, 002), (005, 005, 004);

-- Selecionar todos os clientes:

SELECT * from tbl_cliente;

-- Selecionar os clientes que moram em São Paulo:

SELECT codigo_cliente, nome, cidade from tbl_cliente WHERE cidade = 'São Paulo';

-- Selecionar os clientes onde o código é maior que 3:

SELECT codigo_cliente, nome from tbl_cliente WHERE codigo_cliente > 3;

-- Selecionar todos os títulos:

SELECT * from tbl_titulo;

-- Crie uma tabela chamada tbl_cliente2 com uma coluna integer chamada código

CREATE TABLE tbl_cliente2 (
	codigo integer PRIMARY KEY                                        
);

-- Copie todos dos códigos da tbl_cliente para essa nova tabela usando o SQL Insert:

INSERT INTO tbl_cliente2 SELECT codigo_cliente FROM tbl_cliente;
