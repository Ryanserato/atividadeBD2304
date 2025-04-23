CREATE DATABASE bd_videolocadora;

USE bd_videolocadora;

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100)
);

CREATE TABLE filme (
    idFilme INT PRIMARY KEY IDENTITY(1,1),
    titulo NVARCHAR(100) NOT NULL,
    genero NVARCHAR(50) NOT NULL,
    anoLancamento INT NOT NULL
);

CREATE TABLE locacao (
    idLocacao INT PRIMARY KEY IDENTITY(1,1),
    idCliente INT NOT NULL,
    idFilme INT NOT NULL,
    dataLocacao DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Locacao_Cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT FK_Locacao_Filme FOREIGN KEY (idFilme) REFERENCES filme(idFilme)
);

INSERT INTO cliente (nome, cidade) VALUES 
('Carlos Silva', 'São Paulo'),
('Ana Souza', 'Rio de Janeiro'),
('Marcos Lima', 'Belo Horizonte'),
('Fernanda Dias', 'São Paulo'),
('Gustavo Henrik', 'São Paulo'),
('Ryan Serato', 'São Paulo');

INSERT INTO filme (titulo, genero, anoLancamento) VALUES 
('Matrix', 'Ficção Científica', 1999),
('Titanic', 'Romance', 1997),
('Vingadores', 'Ação', 2012),
('Coringa', 'Drama', 2019),
('Homem-Aranha', 'Ação', 2002),
('Interestelar', 'Ficção Científica', 2014),
('A Origem', 'Suspense', 2010);

INSERT INTO locacao (idCliente, idFilme, dataLocacao, valor) VALUES
(1, 1, '2023-05-01', 5.00),
(1, 3, '2023-05-03', 6.00),
(2, 2, '2023-05-02', 4.50),
(2, 1, '2023-05-04', 5.00),
(3, 4, '2023-05-01', 6.50),
(4, 1, '2023-05-01', 5.00),
(4, 4, '2023-05-05', 6.50),
(5, 5, '2023-05-02', 4.00),
(5, 6, '2023-05-03', 6.50),
(6, 7, '2023-05-02', 5.00),
(6, 3, '2023-05-04', 6.00),
(6, 2, '2023-05-05', 4.50);

SELECT * FROM filme;

SELECT * FROM cliente WHERE cidade = 'São Paulo';

SELECT c.nome AS Cliente, f.titulo AS Filme, l.dataLocacao, l.valor
FROM locacao l
JOIN cliente c ON l.idCliente = c.idCliente
JOIN filme f ON l.idFilme = f.idFilme;

SELECT c.nome AS Cliente, COUNT(l.idLocacao) AS TotalLocacoes
FROM locacao l
JOIN cliente c ON l.idCliente = c.idCliente
GROUP BY c.nome;

SELECT * FROM filme
ORDER BY anoLancamento DESC;

SELECT c.nome AS Cliente, COUNT(l.idLocacao) AS TotalLocacoes
FROM locacao l
JOIN cliente c ON l.idCliente = c.idCliente
GROUP BY c.nome
HAVING COUNT(l.idLocacao) > 1;









