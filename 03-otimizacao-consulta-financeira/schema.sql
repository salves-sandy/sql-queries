-- ============================================================
-- PROJETO 03: OTIMIZAÇÃO DE CONSULTA LENTA EM RELATÓRIO FINANCEIRO
-- Estrutura de Tabelas e Dados Fictícios
-- ============================================================

-- 1. Tabela de Clientes
CREATE TABLE clientes_financeiro (
    cliente_id INT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    segmento VARCHAR(50) NOT NULL,
    data_cadastro DATE NOT NULL
);

-- 2. Tabela de Faturas / Transações
CREATE TABLE faturas (
    fatura_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    valor_fatura DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL, -- 'Pago', 'Pendente', 'Atrasado'
    FOREIGN KEY (cliente_id) REFERENCES clientes_financeiro(cliente_id)
);

-- 3. Inserção de Dados Fictícios
INSERT INTO clientes_financeiro (cliente_id, nome_empresa, segmento, data_cadastro) VALUES
(1, 'TechCorp Soluções', 'Enterprise', '2024-01-15'),
(2, 'Varejo Express', 'Varejo', '2024-03-10'),
(3, 'Logística Brasil', 'Enterprise', '2024-05-20'),
(4, 'EducaMais Digital', 'Educação', '2024-08-01');

INSERT INTO faturas (fatura_id, cliente_id, valor_fatura, data_vencimento, status_pagamento) VALUES
(1001, 1, 5000.00, '2026-01-10', 'Pago'),
(1002, 1, 5000.00, '2026-02-10', 'Pago'),
(1003, 1, 5500.00, '2026-03-10', 'Pendente'),
(1004, 2, 1200.00, '2026-01-15', 'Pago'),
(1005, 2, 1200.00, '2026-02-15', 'Atrasado'),
(1006, 3, 15000.00, '2026-01-05', 'Pago'),
(1007, 3, 15000.00, '2026-02-05', 'Pago'),
(1008, 4, 800.00, '2026-02-20', 'Atrasado');
