--DDL
CREATE DATABASE BancoDadosRPG 
GO
USE BancoDadosRPG
GO
CREATE TABLE Usuarios(
	IDUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Classes(
	IDClasse INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(50) UNIQUE NOT NULL,
	DescricaoClasse VARCHAR(255)
)
GO
CREATE TABLE Personagens(
	IDPersonagem INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(50) UNIQUE NOT NULL,
	IDClasse INT FOREIGN KEY REFERENCES Classes(IDClasse),
	IDUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IDUsuario)
)
GO
CREATE TABLE Habilidades(
	IDHabilidade INT PRIMARY KEY IDENTITY,
	NomeHabilidade VARCHAR(50) UNIQUE NOT NULL,
	DescricaoHabilidade VARCHAR(255)
)
GO
CREATE TABLE ClasseHabilidade(
	IDHabilidade INT FOREIGN KEY REFERENCES Habilidades(IDHabilidade),
	IDClasse INT FOREIGN KEY REFERENCES Classes(IDClasse)
)
--DML
INSERT INTO Usuarios VALUES ('Email@Email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro','Descrição do Bárbaro.')
INSERT INTO Habilidades(NomeHabilidade) VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, IDClasse, IDUsuario) VALUES ('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade(IDClasse, IDHabilidade) VALUES (1,1),(1,2)

INSERT INTO Usuarios VALUES ('Email@Email.com.br', '123456')
INSERT INTO Classes VALUES ('Monge','Descrição do Monge')
INSERT INTO Habilidades(NomeHabilidade) VALUES ('Recuperar Vida')
INSERT INTO Personagens (NomePersonagem, IDClasse, IDUsuario) VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade(IDClasse, IDHabilidade) VALUES (2,2),(2,3)

--DQL

SELECT * FROM Habilidades, Classes, Personagens, Usuarios

SELECT P.NomePersonagem, C.NomeClasse 'Classe', C.DescricaoClasse FROM Personagens P JOIN Classes C
ON P.IDClasse = C.IDClasse

