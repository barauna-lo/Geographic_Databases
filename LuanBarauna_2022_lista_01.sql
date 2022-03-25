
-- CREATE TABLES para a questão 03 -- 

CREATE TABLE Bairros ( 
    BairroID   	INT   			NOT NULL,
    Nome  	    VARCHAR( 45 )  	NOT NULL,
    Limites   		POLYGON,
    CONSTRAINT BairroPK PRIMARY KEY (BairroID) 
);

CREATE TABLE Escola(
	EscolaID  INT NOT NULL,
	Nome VARCHAR(60),
	CNPJ VARCHAR(100),
	Cidade VARCHAR(45),
	Estado VARCHAR(2),
	CONSTRAINT EscolaPK PRIMARY KEY (EscolaID)
);

-- Quando Criei a tabela escola acabei esquecendo de explicitar que algumas variaveis não poderiam --
--  ser nulas. Dessa forma é necessario fazer a alteração das colunas. -- 

ALTER TABLE Escola ALTER COLUMN Nome SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN CNPJ SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN Cidade SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN Estado SET NOT NULL;


CREATE TABLE Curso(
	CursoID INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
	Ementa VARCHAR (500),
	Carga_horaria INT NOT NULL,
	Escola_Id INT NOT NULL,

    CONSTRAINT CursoPK PRIMARY KEY (CursoID), 
    
    CONSTRAINT CursoEscolaFK 	FOREIGN KEY (Escola_Id)
		REFERENCES Escola(EscolaID)
    	ON DELETE CASCADE 
    	ON UPDATE CASCADE
);


CREATE TABLE Aluno(
	AlunoID INT NOT NULL,
	CPF INT NOT NULL,
	RG VARCHAR(20),
	Nome VARCHAR(45),
	Endereco VARCHAR(100),
	Cidade VARCHAR(100),
	Estado VARCHAR(2),
	
	CONSTRAINT AlunoPK PRIMARY KEY(AlunoID),
);


CREATE TABLE Matricula(
	Aluno_Id INT NOT NULL, 
	Curso_Id INT NOT NULL ,
	Ano_matricula DATE NOT NULL,
	Nota DECIMAL(10),
	
	CONSTRAINT Ano_matriculaPK PRIMARY KEY(Ano_matricula),
	CONSTRAINT MatriculaAlunoPK FOREIGN  KEY(Cusor_id)
		REFERENCES Curso(CursoID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT MatriculaAluno FOREIGN KEY(Aluno_Id)
		REFERENCES Aluno(AlunoID)
		ON DELETE CASCADE
		ON UPDATE CASCADE 
);
-- CREATE TABLES para a questão 03 -- 

CREATE TABLE Bairros ( 
    BairroID   	INT   			NOT NULL,
    Nome  	    VARCHAR( 45 )  	NOT NULL,
    Limites     POLYGON,
    CONSTRAINT BairroPK PRIMARY KEY (BairroID) 
);

CREATE TABLE Escola(
	EscolaID  INT NOT NULL,
	Nome   VARCHAR(60),
	CNPJ   VARCHAR(100),
	Cidade VARCHAR(45),
	Estado VARCHAR(2),
	CONSTRAINT EscolaPK PRIMARY KEY (EscolaID)
);

-- Quando Criei a tabela escola acabei 
-- esquecendo de explicitar que algumas variáveis 
-- não poderiam  ser nulas. Dessa forma é necessário 
-- fazer a alteração das colunas.

ALTER TABLE Escola ALTER COLUMN Nome SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN CNPJ SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN Cidade SET NOT NULL;
ALTER TABLE Escola ALTER COLUMN Estado SET NOT NULL;


CREATE TABLE Curso(
	CursoID       INT NOT NULL,
	Nome          VARCHAR(45) NOT NULL,
	Ementa        VARCHAR (500),
	Carga_horaria INT NOT NULL,
	Escola_Id     INT NOT NULL,

    CONSTRAINT CursoPK PRIMARY KEY (CursoID), 
    
    CONSTRAINT CursoEscolaFK 	FOREIGN KEY (Escola_Id)
		REFERENCES Escola(EscolaID)
    	ON DELETE CASCADE 
    	ON UPDATE CASCADE
);


CREATE TABLE Aluno(
	AlunoID  INT NOT NULL,
	CPF      INT NOT NULL,
	RG       VARCHAR(20),
	Nome     VARCHAR(45),
	Endereco VARCHAR(100),
	Cidade   VARCHAR(100),
	Estado   VARCHAR(2),
	
	CONSTRAINT AlunoPK PRIMARY KEY(AlunoID),
);


CREATE TABLE Matricula(
	Aluno_Id      INT NOT NULL, 
	Curso_Id      INT NOT NULL ,
	Ano_matricula DATE NOT NULL,
	Nota          DECIMAL(10),
	
	CONSTRAINT Ano_matriculaPK PRIMARY KEY(Ano_matricula),
	CONSTRAINT MatriculaAlunoPK FOREIGN  KEY(Cusor_id)
		REFERENCES Curso(CursoID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT MatriculaAluno FOREIGN KEY(Aluno_Id)
		REFERENCES Aluno(AlunoID)
		ON DELETE CASCADE
		ON UPDATE CASCADE 
);
\end{lstlisting}