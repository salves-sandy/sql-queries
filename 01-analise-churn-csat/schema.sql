-- ============================================================
-- PROJETO 01: ANÁLISE DE CHURN E CSAT
-- Estrutura de Tabelas e Dados Fictícios
-- ============================================================

-- 1. Criação da Tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL,
    status_assinatura VARCHAR(20) NOT NULL -- 'Ativo', 'Cancelado'
);

-- 2. Criação da Tabela de Tickets de Suporte / Atendimento
CREATE TABLE tickets_suporte (
    ticket_id INT PRIMARY KEY,
    cliente_id INT,
    categoria VARCHAR(50) NOT NULL,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    nota_csat INT, -- Escala de 1 a 5
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- 3. Inserção de Dados Fictícios de Clientes
INSERT INTO clientes (cliente_id, nome, data_cadastro, status_assinatura) VALUES
(101, 'Empresa Alfa', '2025-10-10', 'Cancelado'),
(102, 'Empresa Beta', '2025-11-01', 'Ativo'),
(103, 'Empresa Gamma', '2025-11-15', 'Cancelado'),
(104, 'Empresa Delta', '2025-12-01', 'Ativo'),
(105, 'Empresa Epsilon', '2026-01-05', 'Cancelado'),
(106, 'Empresa Zeta', '2026-01-20', 'Ativo');

-- 4. Inserção de Dados Fictícios de Atendimentos (CSAT)
INSERT INTO tickets_suporte (ticket_id, cliente_id, categoria, data_abertura, data_fechamento, nota_csat) VALUES
(1, 101, 'Integração de API', '2025-10-20', '2025-10-25', 1),
(2, 102, 'Dúvida Operacional', '2025-11-10', '2025-11-10', 5),
(3, 103, 'Falha no Banco de Dados', '2025-11-20', '2025-11-28', 2),
(4, 104, 'Cobrança', '2025-12-05', '2025-12-06', 4),
(5, 105, 'Integração de API', '2026-01-10', '2026-01-18', 1),
(6, 106, 'Falha no Banco de Dados', '2026-02-01', '2026-02-03', 2);
