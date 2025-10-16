-- Criação da tabela de clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataCadastro DATE
);

-- Inserção de dados
INSERT INTO Clientes (ID, Nome, Email, DataCadastro)
VALUES
(1, 'Ana Souza', 'ana@email.com', '2022-01-10'),
(2, 'Carlos Lima', 'carlos@email.com', '2022-02-15');

-- Consulta
SELECT * FROM Clientes;
