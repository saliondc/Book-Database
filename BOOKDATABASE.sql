CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE TabUsuario (
    ID_usuario INT PRIMARY KEY,
    Nome_Usuario VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL UNIQUE,
    Senha VARCHAR(20) NOT NULL,
    Data_Nascimento DATE
);

CREATE TABLE TabBloqueado (
    ID_usuario_bloqueador INT,
    ID_usuario_bloqueado INT,
    PRIMARY KEY (ID_usuario_bloqueador, ID_usuario_bloqueado),
    FOREIGN KEY (ID_usuario_bloqueador) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_usuario_bloqueado) REFERENCES Usuario(ID_usuario)
);

CREATE TABLE TabAmigo (
    Usuario1 INT,
    Usuario2 INT,
    PRIMARY KEY (Usuario1, Usuario2),
    FOREIGN KEY (Usuario1) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (Usuario2) REFERENCES Usuario(ID_usuario),
    CHECK (ID_Usuario1 < ID_Usuario2)
);

CREATE TABLE TabGrupo (
    ID_grupo INT PRIMARY KEY,
    Nome VARCHAR(40) NOT NULL,
    Descricao TEXT
);

CREATE TABLE TabUsuario_Grupo (
    ID_usuario INT,
    ID_grupo INT,
    PRIMARY KEY (ID_usuario, ID_grupo),
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_grupo) REFERENCES Grupo(ID_grupo)
);

CREATE TABLE TabAmigo (
    Usuario1 INT,
    Usuario2 INT,
    PRIMARY KEY (Usuario1, Usuario2),
    FOREIGN KEY (Usuario1) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (Usuario2) REFERENCES Usuario(ID_usuario),
    CHECK (ID_Usuario1 < ID_Usuario2)
);

CREATE TABLE TabLivro (
    ID_livro INT PRIMARY KEY,
    Nome_Livro VARCHAR(30) NOT NULL,
    Ano_Lancamento DATE,
    Sinopse TEXT,
    Autor VARCHAR(30)
);

CREATE TABLE TabGenero (
    ID_genero INT PRIMARY KEY,
    Nome_Genero VARCHAR(20) NOT NULL,
    Descricao TEXT
);

CREATE TABLE TabLivro_Genero (
    ID_Livro INT,
    ID_Genero INT,
    PRIMARY KEY (ID_Livro, ID_Genero),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_LIVR),
    FOREIGN KEY (ID_Genero) REFERENCES Genero(ID_genero)
);

CREATE TABLE TabAvaliacao (
    ID_Avaliacao INT PRIMARY KEY,
    ID_usuario INT,
    ID_LIVR INT,
    Nota INT,
    Comentario TEXT,
    Data_Avaliacao DATE,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_LIVR) REFERENCES Livro(ID_LIVR)
);

CREATE TABLE TabLista (
    ID_lista INT PRIMARY KEY,
    ID_usuario INT,
    Nome_Lista VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Data_Adicao DATE,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario)
);

CREATE TABLE TabLivros_Lista (
    ID_livro INT,
    ID_lista INT,
    PRIMARY KEY (ID_LIVR, ID_LIST),
    FOREIGN KEY (ID_LIVR) REFERENCES Livro(ID_LIVR),
    FOREIGN KEY (ID_LIST) REFERENCES Lista(ID_LIST)
);
