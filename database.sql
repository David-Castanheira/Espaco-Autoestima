CREATE TABLE contas(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(20),
    telefone VARCHAR(25),
    email VARCHAR(40),
    senha VARCHAR(20)
);

CREATE TABLE clientes(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45), 
    telefone VARCHAR(25), 
    email VARCHAR(40), 
    cpf VARCHAR(25)
);

CREATE TABLE profissionais(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45), 
    telefone VARCHAR(25), 
    especialidade VARCHAR(20)
);

CREATE TABLE procedimentos(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45), 
    descricao VARCHAR(100)
);

CREATE TABLE agendamento(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    data date, 
    horario time, 
    sessao BIGINT, 
    clientes_id BIGINT, 
    profissionais_id BIGINT, 
    FOREIGN KEY (clientes_id) REFERENCES clientes(id), 
    FOREIGN KEY (profissionais_id) REFERENCES profissionais(id)
);

CREATE TABLE produtos(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45), 
    data_validade date, 
    quantidade INT, 
    marca VARCHAR(20), 
    preco decimal(10, 2), 
    descricao VARCHAR(100)
);

CREATE TABLE fornecedores(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45), 
    telefone VARCHAR(20), 
    empresa VARCHAR(20)
);