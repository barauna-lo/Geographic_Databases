	-- Lista 2 - Banco de dados - 22/03
	-- Retorne os comandos em SQL do laboratório.
	-- 1 e 2. Criação das tabelas

CREATE TABLE Instrutor (
	InstrutorID INT NOT NULL, 
	CPF         INT NOT NULL UNIQUE, 
	Nome        VARCHAR( 30 ) NOT NULL, 
	Endereco    VARCHAR( 60 ), 
	
	CONSTRAINT InstrutorPK PRIMARY KEY (InstrutorID)
);

CREATE TABLE Aluno (
	 AlunoID  INT NOT NULL,
	 CPF      INT NOT NULL UNIQUE,
	 Nome     VARCHAR( 30 ) NOT NULL,
	 Endereco VARCHAR( 60 ),
	 
	 CONSTRAINT AlunoPK PRIMARY KEY (AlunoID)
 );

CREATE TABLE Escola(
	 EscolaID INT NOT NULL,
	 CNPJ     INT NOT NULL UNIQUE,
	 Nome     VARCHAR( 30 ) NOT NULL,
	 Endereco VARCHAR( 60 ),
				
	 CONSTRAINT EscolaPK PRIMARY KEY (EscolaID)
);

CREATE TABLE Curso(
	 CursoID       INT NOT NULL,
	 Nome          VARCHAR( 30 ) NOT NULL,
	 Carga_horaria INT NOT NULL,
	 Ementa        VARCHAR( 500 ),
	 EscolaID      INT NOT NULL,
				
	CONSTRAINT CursoPK PRIMARY KEY (CursoID),
				
	CONSTRAINT CursoEscolaFK FOREIGN KEY (EscolaID) 
							 REFERENCES Escola(EscolaID) 
							 ON DELETE CASCADE
							 ON UPDATE CASCADE
);

CREATE TABLE Turma (
	 TurmaID      INT NOT NULL,
	 Data_inicio  DATE NOT NULL,
	 Data_termino DATE NOT NULL,
	 CursoID      INT NOT NULL,
	 InstrutorID  INT NOT NULL,
				
	 CONSTRAINT TurmaFK PRIMARY KEY (TurmaID),
	 
	 CONSTRAINT TurmaCursoFK FOREIGN KEY (CursoID) 
							 REFERENCES Curso(CursoID) 
							 ON DELETE CASCADE
							 ON UPDATE CASCADE, 

	CONSTRAINT TurmaInstrutorFK FOREIGN KEY (InstrutorID) 
								REFERENCES Instrutor(InstrutorID)
								ON DELETE CASCADE
								ON UPDATE CASCADE
);

CREATE TABLE Matricula (
	 TurmaID    INT NOT NULL,
	 AlunoID    INT NOT NULL,
	 Nota_final NUMERIC(4,2),
	 Presenca   INT NOT NULL,
				
	 CONSTRAINT MatriculaPK PRIMARY KEY (TurmaID, AlunoID),
	 
	 CONSTRAINT MatriculaCursoFK FOREIGN KEY (TurmaID) 
								 REFERENCES Turma(TurmaID) 
								 ON DELETE CASCADE
								 ON UPDATE CASCADE
);



-- 3. Use os comandos SQL para inserir dados na tabela Instrutor

INSERT INTO Instrutor VALUES (1, 11111, 'Rodrigo Carvalho', 'Rua Alfa, num 50, Centro');

INSERT INTO Instrutor VALUES (2, 22222, 'Jacqueline França', 'Rua Sete de Setembro, num 620, Alvorada');

INSERT INTO Instrutor VALUES (3, 33333, 'Leandro Siqueira', 'Rua Nelson Davila, num 120, Centro');
-- Esse erro ja foi corrigido
INSERT INTO Instrutor VALUES (4, 44444, 'Diego Faria', 'Rua Siqueira Campos, num 80, Jd Apolo');

--ERROR:  duplicate key value violates unique constraint "instrutor_cpf_key"
--DETAIL:  Key (cpf)=(33333) already exists.
--SQL state: 23505

UPDATE Instrutor CPF 
SET CPF = 44444
WHERE InstrutorID IN (4);

--Visualizar a tabela
SELECT * FROM Instrutor

-- 4. Use os comandos SQL para inserir dados na tabela Aluno

INSERT INTO Aluno VALUES (1, 12222, 'Jose Vitor Ferreira Fernandes Gomes Dias', 'Rua Alfa, num 100, Centro');

INSERT INTO Aluno VALUES (2, 32222, 'Rodrigo Gomes Dias', 'Rua Sete de Setembro, num 200, Alvorada');

INSERT INTO Aluno VALUES (3, 42222, 'Daniel Ribeiro Alvarenga', 'Rua Nelson Davila, num 150, Centro');

INSERT INTO Aluno VALUES (4, 52222, 'Gustavo Ferreira', 'Rua Lumem, num 140, Jd Apolo');

INSERT INTO Aluno VALUES (5, 62222, 'Marcelo Reis Fernandes', 'Rua Siqueira Campos, num 80, Jd Apolo');

INSERT INTO Aluno VALUES (6, 72222, 'Renata Fernandes Carvalho', 'Rua Sete de Setembro, num 620, Alvorada');

INSERT INTO Aluno VALUES (7, 82222, 'Debora Ribeiro Reis', 'Rua Lumem, num 140, Jd Apolo');

INSERT INTO Aluno VALUES (8, 92222, 'Daniela Reis Barbosa', 'Rua Nelson Davila, num 120, Centro');

INSERT INTO Aluno VALUES (9, 13333, 'Luciane Cardoso', 'Rua Siqueira Campos, num 80, Jd Apolo');

INSERT INTO Aluno VALUES (10, 91919, 'Claudio Cardoso', 'Rua Lumem, num 140, Jd Apolo');

INSERT INTO Aluno VALUES (11, 81818, 'Marina Reis Alvarenga', 'Rua Sete de Setembro, num 620, Alvorada');

INSERT INTO Aluno VALUES (12, 71717, 'Sabrina Carvalho', 'Rua Nelson Davila, num 120, Centro');

INSERT INTO Aluno VALUES (13, 61616, 'Julio Cesar Dias', 'Rua Siqueira Campos, num 80, Jd Apolo');

INSERT INTO Aluno VALUES (14, 51515, 'Regiane Limeira', 'Rua Sete de Setembro, num 620, Alvorada');

INSERT INTO Aluno VALUES (15, 41414, 'Augusto Dias Gomes', 'Rua Nelson Davila, num 120, Centro');

--ERROR:  value too long for type character varying(30)
--SQL state: 22001

ALTER TABLE Aluno ALTER COLUMN Nome Type VARCHAR (80);

SELECT * FROM Aluno

-- 5. Use os comandos SQL para inserir dados na tabela Escola, Curso, Turma e Matricula

--Curso--

INSERT INTO Escola VALUES (1, 11111, 'InfoSys', 'Rua Nelson Davila, num 400, Centro');

INSERT INTO Escola VALUES (2, 22222, 'Inova', 'Rua Sete de Setembro, num 800, Alvorada');

INSERT INTO Escola VALUES (3, 33333, 'CodSys', 'Rua Alfa, num 1030, Apolo');

INSERT INTO Curso VALUES  (1, 'Linux - Introduction', 120, '', 1);

INSERT INTO Curso VALUES  (2, 'Linux - Advanced', 120, '', 1);

INSERT INTO Curso VALUES  (3, 'Windows - Introduction', 120, '', 1);

INSERT INTO Curso VALUES  (4, 'Windows - Advanced', 120, '', 1);

INSERT INTO Curso VALUES  (5, 'C++ Programming Language', 240, '', 3);

INSERT INTO Curso VALUES  (6, 'Java Programming Language', 240, '', 3);

INSERT INTO Curso VALUES  (7, 'Python', 120, '', 3);

INSERT INTO Curso VALUES  (8, 'Database System and SQL', 240, '', 2);

INSERT INTO Curso VALUES  (9, 'Data Science', 240, '', 2);

INSERT INTO Curso VALUES  (10, 'Geoinformatics', 240, '', 2);

SELECT * FROM Curso

--Turma--

INSERT INTO Turma VALUES (1, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Turma VALUES (2, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 2, 1);

INSERT INTO Turma VALUES (3, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 1, 1);

INSERT INTO Turma VALUES (4, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 2, 1);

INSERT INTO Turma VALUES (5, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 3, 2);

INSERT INTO Turma VALUES (6, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 4, 2);

INSERT INTO Turma VALUES (7, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 3, 2);

INSERT INTO Turma VALUES (8, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 4, 2);

INSERT INTO Turma VALUES (9, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 7, 3);

INSERT INTO Turma VALUES (10, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 7, 3);

INSERT INTO Turma VALUES (11, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-06-15', 'YYYY-MM-DD'), 7, 3);

INSERT INTO Turma VALUES (12, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 5, 4);

INSERT INTO Turma VALUES (13, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 5, 4);

INSERT INTO Turma VALUES (14, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 6, 3);

INSERT INTO Turma VALUES (15, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 6, 3);

INSERT INTO Turma VALUES (16, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 8, 1);

INSERT INTO Turma VALUES (17, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 8, 1);

INSERT INTO Turma VALUES (18, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 10, 4);

INSERT INTO Turma VALUES (19, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 10, 4);

SELECT * FROM Turma

-- Matricula--

INSERT INTO Matricula VALUES (1, 1, '8.4', 80);

INSERT INTO Matricula VALUES (1, 2, '6.4', 85);

INSERT INTO Matricula VALUES (1, 3, '5.0', 67);

INSERT INTO Matricula VALUES (1, 4, '9.4', 100);

INSERT INTO Matricula VALUES (1, 5, '8.7', 100);

INSERT INTO Matricula VALUES (2, 1, '7.4', 80);

INSERT INTO Matricula VALUES (2, 2, '7.4', 85);

INSERT INTO Matricula VALUES (2, 3, '8.0', 80);

INSERT INTO Matricula VALUES (2, 4, '7.4', 70);

INSERT INTO Matricula VALUES (2, 5, '9.7', 100);

INSERT INTO Matricula VALUES (3, 6, '8.4', 80);

INSERT INTO Matricula VALUES (3, 7, '6.4', 85);

INSERT INTO Matricula VALUES (3, 8, '5.0', 67);

INSERT INTO Matricula VALUES (3, 9, '9.4', 100);

INSERT INTO Matricula VALUES (3, 10, '8.7', 100);

INSERT INTO Matricula VALUES (4, 6, '7.4', 80);

INSERT INTO Matricula VALUES (4, 7, '9.4', 85);

INSERT INTO Matricula VALUES (4, 8, '8.0', 80);

INSERT INTO Matricula VALUES (4, 9, '7.4', 70);

INSERT INTO Matricula VALUES (4, 10, '9.7', 100);

INSERT INTO Matricula VALUES (9, 11, '7.4', 80);

INSERT INTO Matricula VALUES (9, 12, '9.4', 85);

INSERT INTO Matricula VALUES (9, 13, '8.0', 70);

INSERT INTO Matricula VALUES (10, 14, '7.4', 80);

INSERT INTO Matricula VALUES (10, 15, '9.4', 85);

INSERT INTO Matricula VALUES (10, 1, '8.0', 70);

INSERT INTO Matricula VALUES (11, 2, '7.4', 80);

INSERT INTO Matricula VALUES (11, 3, '9.4', 85);

INSERT INTO Matricula VALUES (11, 4, '8.0', 70);

SELECT * FROM Matricula

-- 06) Recupere	as	informações	do	catálogo:
--a. Quais esquemas existem nesse banco de dados?

SELECT *
FROM information_schema.tables;

--b. Recupere as informações sobre as tabelas do esquema “public“.

SELECT *
 FROM  information_schema.tables 
 WHERE table_schema = 'public';

--c. Recupere as informações sobre todas as colunas de todas as
--tabelas do esquema “public”.

SELECT *
FROM information_schema.columns 
WHERE table_schema = 'public';

--d. Recupere as informações sobre todas as restrições (constraints) de
--todas as tabelas do esquema “public”.

-- 07. Selecione todos alunos ordenados pelo nome.

SELECT  *
FROM aluno
ORDER BY nome
 
-- 08. ) Quantos cursos estão	cadastrados	no	banco	de	dados?

SELECT COUNT(cursoid) AS numero_de_curso FROM curso;

-- 09) Quantos cursos foram ministrados pelo instrutor 'Leandro Siqueira'?

-- A função INNER JOIN possui como objetivo unir as tabelas atravez das suas chaves estrangeiras 
-- pelo comando -- ON. Muita atencção em como é que é que elas são utilizadas. 

SELECT COUNT(nome)
FROM instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid
WHERE instrutor.nome = 'Leandro Siqueira'

-- 10) Quantas horas de curso foram ministradas pelo instrutor 'Leandro Siqueira'?

SELECT SUM(carga_horaria)
 FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid) INNER JOIN curso ON curso.cursoid = turma.cursoid
WHERE instrutor.nome =  'Leandro Siqueira'


-- 11) Quantas turmas foram ministradas por cada instrutor?

SELECT instrutor.nome, COUNT(instrutor.nome) AS Curso_por_instrutor
FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)   INNER JOIN curso ON curso.cursoid = turma.cursoid
GROUP BY instrutor.nome
ORDER BY instrutor.nome

-- JUST CHEKING 
--SELECT instrutor.nome, turma.turmaid
--FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)   INNER JOIN curso ON curso.cursoid = turma.cursoid
--ORDER BY instrutor.nome

-- 12) Quantas horas de curso foram ministradas por cada instrutor ?

SELECT instrutor.nome , SUM(carga_horaria)
FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)   INNER JOIN curso ON curso.cursoid = turma.cursoid
GROUP BY instrutor.nome
ORDER BY instrutor.nome

-- 13) Se os cursos pagam 100,00 por hora ministrada, quanto cada instrutor recebeu por ano?


SELECT instrutor.nome ,SUM(carga_horaria)*100 AS Salario_em_R$
FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)   INNER JOIN curso ON curso.cursoid = turma.cursoid
GROUP BY instrutor.nome
ORDER BY instrutor.nome

-- 14) Quais instrutores deram mais que 850h de curso?

-- unir as tabelas curso, instrutor e turma, porque curso tem carga horaria e turma mostra o instrutor que da os cursos.

SELECT instrutor.nome, SUM(curso.carga_horaria),
FROM (Instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)
				INNER JOIN curso ON curso.id = turma.cursoid
GROUP BY instrutor.nome
HAVING SUM(carga_horaria) > 850


-- 15) Quantas	turmas	cada	curso	teve	por	ano?

SELECT b.nome AS nome_curso, 
EXTRACT(YEAR FROM a.data_inicio) AS ano_turma, 
COUNT(a.turmaid) AS qtd_turmas 
FROM turma AS a, curso AS b GROUP BY nome_curso, ano_turma 
ORDER BY ano_turma ASC;

SELECT curso.nome as nome_curso,
 EXTRACT(YEAR FROM turma.data_inicio) AS ano_turma, 
 COUNT(turma.cursoid) AS qtd_turmas 
 FROM curso INNER JOIN turma ON curso.cursoid = turma.cursoid
 GROUP BY nome_curso, ano_turma ORDER BY ano_turma ASC;
 

-- 16) Quais cursos o aluno 'Rodrigo Gomes Dias' cursou e qual foi a nota dele em cada um?

SELECT aluno.nome as Aluno, curso.nome as Curso, matricula.nota_final as Nota_final FROM
(((aluno INNER JOIN matricula ON aluno.alunoid = matricula.alunoid) 
	INNER JOIN turma ON matricula.turmaid = turma.turmaid) 
	INNER JOIN curso ON curso.cursoid = turma.cursoid)  
GROUP BY Aluno,Curso, Nota_final
	HAVING aluno.nome='Rodrigo Gomes Dias';

-- 17) Crie uma view que contenha o histórico dos alunos contendo as seguintes informações: 
--nome do aluno, 
--CPF do aluno, 
--endereço do aluno, 
--curso ministrado, 
--data de inicio e 
--termino do curso, 
--nome do instrutor do curso, 
--carga horaria, 
--nota final, 
--presença.

--Passo 1
CREATE VIEW historico_alunos 
(aluno, 
cpf, 
endereco, 
curso, 
inicio, 
fim, 
instrutor, 
ch, 
nf, 
frequencia)
AS
SELECT 
    aluno.nome AS aluno, 
    aluno.cpf, aluno.endereco, 
	curso.nome AS curso, 
	turma.data_inicio AS inicio, 
	turma.data_termino AS fim,
	instrutor.nome AS instrutor,
	curso.carga_horaria AS ch,
	matricula.nota_final as nf, 
	matricula.presenca as frequencia
FROM ((((aluno INNER JOIN matricula ON aluno.alunoid = matricula.alunoid) 
	INNER JOIN turma ON matricula.turmaid = turma.turmaid) 
	INNER JOIN curso ON curso.cursoid = turma.cursoid)
	INNER JOIN instrutor ON instrutor.instrutorid = turma.instrutorid);
--Passo 2

SELECT * FROM historico_alunos ORDER BY curso ASC;

-- 18) Insira uma nova turma na tabela Turma

INSERT INTO Turma VALUES (20, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 8, 2);

-- 19) Altere o nome do instrutor "Diego Faria" para "Diego Garcia Faria"

UPDATE Instrutor
SET nome = 'Diego Garcia Faria' 
WHERE nome = 'Diego Faria'


-- 20) Aumente a nota de todos alunos em 10%

UPDATE Matricula
SET nota_final = nota_final*1.1

-- 21) Remova o instrutor "Rodrigo Carvalho" da tabela instrutor. OBS: Observe o que acontece com as turmas associadas ao instrutor "Rodrigo Carvalho".

DELETE FROM Instrutor
WHERE nome = 'Rodrigo Carvalho'

-- 22) Mude o atributo "CNPJ" da tabela "Escola" para um tipo textual.

ALTER TABLE Escola
ALTER COLUMN CNPJ TYPE VARCHAR(14) 

-- 23) Renomeie o atributo "CNPJ" para "CNPJ_Escola".

ALTER TABLE Escola
RENAME COLUMN CNPJ TO CNPJ_Escola;

-- 24) Remova o atributo "CNPJ_Escola".

ALTER TABLE Escola 
DROP COLUMN CNPJ_Escola

-- 25) Remova todos os registros da tabela "Instrutor”. 
--      OBS: Observe o que acontece com os registros das tabelas que recebem o atributo "InstrutorID" como foreign key.

DELETE FROM Instrutor *

-- 26) Remova o atributo "InstrutorID" da tabela "Instrutor".

ALTER TABLE Instrutor
DROP COLUMN InstrutorID CASCADE

-- 27) Remova a tabela "Instrutor".

DROP TABLE Instrutor CASCADE

-- 28) Remova todas as tabelas do banco (esquema e conteúdo).

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- 29) Crie novamente as tabelas do banco de dados usando os scripts acima.

 -- DONE 

-- 30) Adicione um atributo "valor_hora" na tabela "Curso" tipo REAL.

ALTER TABLE Curso
ADD COLUMN Valor_hora REAL

-- 31) Preencha o novo atributo “valor_hora” da tabela “Curso” 
-- com o valor 50 (cada curso paga R$ 50,00 por hora ministrada).

UPDATE Curso SET valor_hora = curso.carga_horaria*50

-- 32) Crie uma nova tabela chamada “instrutor_pagamento” que contenha os seguintes atributos: 
--(1) o id do instrutor ( PK - FK da tabela instrutor), 
--(2) ano (PK - tipo INT) e 
--(3) valor_pagamento (tipo REAL).


CREATE TABLE instrutor_pagamento(
  InstrutorID INT NOT NULL,
  Ano INT NOT NULL,
  valor_pagamento REAL ,
   
CONSTRAINT instrutor_pagamentoPK PRIMARY KEY (InstrutorID, Ano),
CONSTRAINT instrutor_pagamentoinstrutorFK FOREIGN KEY (InstrutorID) 
	 REFERENCES Instrutor(InstrutorID) 
	 ON DELETE CASCADE
	 ON UPDATE CASCADE
);  
 

-- 33) Insira na tabela "instrutor_pagamento" o valor que cada instrutor recebeu por ano.

INSERT INTO Instrutor_pagamento(instrutorid, ano, valor_pagamento)
-- Selecionando as colunas 
SELECT instrutor.instrutorid as id_instr, 
EXTRACT(YEAR FROM turma.data_inicio) AS ano_turma, 
(SUM(carga_horaria)*50) AS qtd_hr_inst_valor_receb 
-- De onde elas vem
FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid) 
INNER JOIN curso ON curso.cursoid = turma.cursoid 
GROUP BY instrutor.instrutorid, turma.data_inicio 
ORDER BY ano_turma ASC;

-- 34) Faça uma trigger que atualiza o valor do pagamento do instrutor toda vez que inserirmos uma nova turma no sistema.

CREATE OR REPLACE FUNCTION update_salario() 
RETURNS  TRIGGER
AS $$
BEGIN 
	UPDATE instrutor_pagamento SET valor_pagamento = curso.carga_horaria*50;
END;
$$
LANGUAGE plpgsql;


-- 35) Insira 3 turmas novas em 2019 para alguns instrutores e confira se sua trigger está funcionando e atualizando a tabela "instrutor_pagamento" corretamente.


INSERT INTO Turma VALUES (21, to_date('2018-02-15', 'YYYY-MM-DD'), to_date('2018-11-15', 'YYYY-MM-DD'), 4, 1);
