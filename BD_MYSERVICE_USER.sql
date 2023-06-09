CREATE DATABASE MyService_Database;
USE MyService_Database;

-- Usuarios do sistema --
CREATE TABLE Usuario(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100),
    SOBRENOME VARCHAR(100),
    EMAIL VARCHAR(255),
    SENHA VARCHAR(255)
);

CREATE TABLE Trabalhador(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR (255),
    SOBRENOME VARCHAR (255),
    CPF VARCHAR(11),
    EMAIL VARCHAR(255),
    SENHA VARCHAR(255)
);

CREATE TABLE Empresa(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    EMPRESA VARCHAR(255),
    CNPJ VARCHAR(20),
    EMAIL VARCHAR(255),
    SENHA VARCHAR(255)
);

-- Serviços / Usuarios --
CREATE TABLE Produto_T(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(300),
    PRECO FLOAT,
    ID_TRABALHADOR INT NOT NULL,
    ID_AVALIACAO INT,
    
    LIKES INT,
    
    FOREIGN KEY (ID_TRABALHADOR) REFERENCES Trabalhador(ID),
    FOREIGN KEY (ID_AVALIACAO) REFERENCES AvaliacaoProduto_T(ID) 
);

SELECT Produto_T.ID, Produto_T.NOME, Produto_T.DESCRICAO, Produto_T.PRECO, Trabalhador.NOME, Trabalhador.EMAIL FROM Produto_T INNER JOIN Trabalhador ON Produto_T.ID_TRABALHADOR = Trabalhador.ID = 1;

CREATE TABLE Produto_E(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(300),
    PRECO FLOAT,
    ID_EMPRESA INT NOT NULL,
    ID_AVALIACAO INT NOT NULL,
    
    LIKES INT,
    
    FOREIGN KEY (ID_EMPRESA) REFERENCES Empresa(ID),
    FOREIGN KEY (ID_AVALIACAO) REFERENCES AvaliacaoProduto_E(ID)
);

CREATE TABLE Servico_T(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(300),
    PRECO FLOAT,
    ID_TRABALHADOR INT NOT NULL,
    ID_AVALIACAO INT NOT NULL,
    
    LIKES INT,
    
    FOREIGN KEY (ID_TRABALHADOR) REFERENCES Trabalhador(ID),
    FOREIGN KEY (ID_AVALIACAO) REFERENCES AvaliacaoServico_T(ID)
);

CREATE TABLE Servico_E(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    DESCRICAO VARCHAR(300),
    PRECO FLOAT,
    ID_EMPRESA INT NOT NULL,
    ID_AVALIACAO INT NOT NULL,
    
    LIKES INT,
    
    FOREIGN KEY (ID_EMPRESA) REFERENCES Empresa(ID),
    FOREIGN KEY (ID_AVALIACAO) REFERENCES AvaliacaoServico_E(ID)
);

-- Avaliação dos usuarios --
CREATE TABLE AvaliacaoProduto_T(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COMENTARIO LONGTEXT
);

CREATE TABLE AvaliacaoProduto_E(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COMENTARIO LONGTEXT
);

CREATE TABLE AvaliacaoServico_T(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COMENTARIO LONGTEXT
);

CREATE TABLE AvaliacaoServico_E(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COMENTARIO LONGTEXT
);

-- Categorias --
CREATE TABLE CategoriaServico(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CATEGORIA VARCHAR(100),
    
    -- Sistema de Curtida --
    LIKES INT
);


CREATE TABLE CategoriaProduto(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CATEGORIA VARCHAR(100),
    
    -- Sistema de Curtida --
    LIKES INT
);
select * from Usuario;

INSERT INTO CategoriaServico(CATEGORIA) VALUES 
("Pintor"), ("Eletricista"), ("Encanador"), ("Pedreiro"), ("Hotelaria"), ("Turismo"), ("Design"), ("Fotógrafo"), ("Musico"),("Professor") ;