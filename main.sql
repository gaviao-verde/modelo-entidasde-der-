-- =============================================
-- 1. CRIAÇÃO DA TABELA (Base inicial)
-- =============================================

-- Cria a tabela Funcionarios com a estrutura inicial
-- (Inclui data_admissao para poder remover depois)
CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

-- =============================================
-- 2. INSERÇÃO DE DADOS (Inserir novos funcionários)
-- =============================================

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('João Silva', 'TI', 5000.00, '2023-01-15');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Maria Oliveira', 'RH', 4500.00, '2022-06-20');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Carlos Santos', 'TI', 5500.00, '2023-03-10');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Ana Paula', 'Financeiro', 6000.00, '2021-11-01');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Roberto Lima', 'TI', 4800.00, '2024-02-05');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Fernanda Souza', 'RH', 4200.00, '2023-09-12');

INSERT INTO funcionarios (nome, departamento, salario, data_admissao) 
VALUES ('Ricardo Almeida', 'Marketing', 5200.00, '2022-08-25');

-- Verificando os dados inseridos
SELECT * FROM funcionarios;

-- =============================================
-- 3. ATUALIZAÇÃO DE DADOS (Aumentar salário em 10%)
-- =============================================

-- Atualizar o salário do João Silva em 10%
UPDATE funcionarios 
SET salario = salario * 1.10 
WHERE nome = 'João Silva';

-- Verificando a atualização
SELECT * FROM funcionarios WHERE nome = 'João Silva';

-- =============================================
-- 4. EXCLUSÃO DE DADOS (Excluir por departamento)
-- =============================================

-- Excluir todos os funcionários do departamento 'TI'
DELETE FROM funcionarios 
WHERE departamento = 'TI';

-- Verificando se os registros foram excluídos
SELECT * FROM funcionarios;

-- =============================================
-- 5. MODIFICAÇÃO DE ESTRUTURA (ALTER TABLE)
-- =============================================

-- 5.1 Adicionar nova coluna 'email'
ALTER TABLE funcionarios 
ADD COLUMN email VARCHAR(150);

-- Verificando a estrutura da tabela
DESCRIBE funcionarios;

-- 5.2 Alterar o tipo da coluna 'salario' de DECIMAL para FLOAT
ALTER TABLE funcionarios 
MODIFY COLUMN salario FLOAT NOT NULL;

-- Verificando a mudança de tipo
DESCRIBE funcionarios;

-- 5.3 Remover a coluna 'data_admissao' (agora ela existe!)
ALTER TABLE funcionarios 
DROP COLUMN data_admissao;

-- Verificando se a coluna foi removida
DESCRIBE funcionarios;

-- =============================================
-- 6. MANIPULAÇÃO DE CONSTRAINTS
-- =============================================

-- 6.0 Preencher emails ANTES de adicionar UNIQUE
UPDATE funcionarios SET email = 'joao.silva@empresa.com' WHERE nome = 'João Silva';
UPDATE funcionarios SET email = 'maria.oliveira@empresa.com' WHERE nome = 'Maria Oliveira';
UPDATE funcionarios SET email = 'ana.paula@empresa.com' WHERE nome = 'Ana Paula';
UPDATE funcionarios SET email = 'fernanda.souza@empresa.com' WHERE nome = 'Fernanda Souza';
UPDATE funcionarios SET email = 'ricardo.almeida@empresa.com' WHERE nome = 'Ricardo Almeida';

-- 6.1 Adicionar constraint UNIQUE para a coluna 'email'
ALTER TABLE funcionarios 
ADD CONSTRAINT unq_email UNIQUE (email);

-- Verificando as constraints da tabela
SHOW CREATE TABLE funcionarios;

-- =============================================
-- 7. CONSULTA FINAL (Visualizar dados)
-- =============================================

-- Visualizar todos os dados finais
SELECT * FROM funcionarios;

-- =============================================
-- FIM DO SCRIPT
-- =============================================