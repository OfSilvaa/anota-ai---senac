/* Criar banco de dados */
CREATE DATABASE IF NOT EXISTS db_anotacoes;
USE db_anotacoes;

/* Criar tabela de usuários */
CREATE TABLE tb_usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

/* Criar tabela de anotações */
/* Cada usuário pode ter até 3 anotações */
CREATE TABLE tb_anotacao (
    id_anotacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    texto TEXT NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
);

/* Exemplo de inserção de usuário */
INSERT INTO tb_usuario (nome, email) VALUES
('Ana Silva', 'ana@email.com');

/* Exemplo de inserção de 3 anotações para o usuário */
INSERT INTO tb_anotacao (id_usuario, texto) VALUES
(1, 'Anotação 1: Comprar leite'),
(1, 'Anotação 2: Reunião às 15h'),
(1, 'Anotação 3: Estudar SQL');

/* Consulta para listar anotações com nome do usuário */
SELECT u.nome, a.texto, a.data_criacao
FROM tb_anotacao a
JOIN tb_usuario u ON a.id_usuario = u.id_usuario
ORDER BY u.id_usuario, a.id_anotacao;