CREATE DATABASE IF NOT EXISTS `portaria_digital`;
USE `portaria_digital`;

-- essa tabala vai pegar dados dos moradores 
CREATE TABLE IF NOT EXISTS `morador` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    apartamento VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    UNIQUE(telefone),
    UNIQUE(email)
) ENGINE=InnoDB;

-- essa tabala vai pegar o dados dos visitantes
CREATE TABLE IF NOT EXISTS `visitante` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    documento_identificacao VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    UNIQUE(documento_identificacao)
) ENGINE=InnoDB;

-- essa tabela pega as entrou e saidas dos visitantes 
CREATE TABLE IF NOT EXISTS `entrada_saida_visitante` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visitante_id INT NOT NULL,
    morador_id INT NOT NULL,
    data_hora_entrada DATETIME NOT NULL,
    data_hora_saida DATETIME,
    FOREIGN KEY (visitante_id) REFERENCES visitante(id),
    FOREIGN KEY (morador_id) REFERENCES morador(id)
) ENGINE=InnoDB;

-- Tabela para guardar informações de quem trabalha no predio
CREATE TABLE IF NOT EXISTS `prestador_servico` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    empresa VARCHAR(255),
    documento_identificacao VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    UNIQUE(documento_identificacao)
) ENGINE=InnoDB;

-- Tabela para pegar as entradas e saídas de quem trabalha no predio
CREATE TABLE IF NOT EXISTS `entrada_saida_prestador` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prestador_id INT NOT NULL,
    morador_id INT,
    data_hora_entrada DATETIME NOT NULL,
    data_hora_saida DATETIME,
    FOREIGN KEY (prestador_id) REFERENCES prestador_servico(id),
    FOREIGN KEY (morador_id) REFERENCES morador(id)
) ENGINE=InnoDB;


-- Tabela para pegar as informações de entregas
CREATE TABLE IF NOT EXISTS `entrega` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    morador_id INT NOT NULL,
    prestador_id INT,
    descricao TEXT,
    data_hora_recebimento DATETIME NOT NULL,
    entregue BOOLEAN NOT NULL DEFAULT 0,
    data_hora_entrega DATETIME,
    FOREIGN KEY (morador_id) REFERENCES morador(id),
    FOREIGN KEY (prestador_id) REFERENCES prestador_servico(id)
) ENGINE=InnoDB;

-- Tabela para pegar informações dos porteiros
CREATE TABLE IF NOT EXISTS `porteiro` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    turno VARCHAR(50),
    telefone VARCHAR(20),
    UNIQUE(telefone)
) ENGINE=InnoDB;


-- Tabela para pegar as logs de acesso dos porteiros (opcional)
CREATE TABLE IF NOT EXISTS `log_acesso_porteiro` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    porteiro_id INT NOT NULL,
    acao VARCHAR(255) NOT NULL,
    data_hora_acesso DATETIME NOT NULL,
    FOREIGN KEY (porteiro_id) REFERENCES porteiro(id)
) ENGINE=InnoDB;











