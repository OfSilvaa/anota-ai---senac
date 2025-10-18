/* Criar banco de dados */
CREATE DATABASE db_anota_ai;

-- utiliza o banco
USE db_anota_ai;

-- criar as tabelas em ordem das tabelas que não tem relação
CREATE TABLE tb_usuario(
	id_usuario 		INT PRIMARY KEY,
	nome_completo 	VARCHAR(255) NOT NULL,
	email			VARCHAR(255) NOT NULL UNIQUE,
	senha 			VARCHAR(100) NOT NULL,
	data_nasc		DATE NOT NULL
);


CREATE TABLE tb_anotacao(
	id_anotacao			INT AUTO_INCREMENT PRIMARY KEY
    ,descricao 			VARCHAR (500) NOT NULL
    ,data_criacao		DATE NOT NULL
    ,data_finalizacao 	DATE 	NULL
    ,id_usuario			INT		NULL
    
    ,FOREIGN KEY(id_usuario) REFERENCES tb_usuario(id_usuario)
    );
    
-- consulta as tabelas para ver se existe
SELECT * FROM tb_usuario;
select * from tb_anotacao;

-- inserir os dados na tabela
INSERT INTO tb_usuario(nome_completo, email, senha, data_nasc, id_usuario)
VALUES
    (
        'Joaquim da Silva',
        'joaquim@email.com',
        '123',
        '1992-07-02',
        1
    ),
    (
        'Maria Souza',
        'maria@email.com',
        '456',
        '1990-05-15',
        2
    );

    
INSERT INTO tb_anotacao(descricao, data_criacao, data_finalizacao, id_usuario)
VALUES
    (
        'Limpar o banheiro',
        '2025-10-10',
        '2025-10-10',
        1
    ),
    (
        'Cuidar da criança',
        '2025-10-10',
        NULL,
        2
    );

