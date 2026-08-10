-- ============================================================
-- PROJETO 02: MAPEAMENTO DE GARGALOS NO SUPORTE TÉCNICO (SLA)
-- Estrutura de Tabela e Dados Fictícios
-- ============================================================

-- 1. Criação da Tabela de Chamados
CREATE TABLE chamados_suporte (
    chamado_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    analista_responsavel VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    prioridade VARCHAR(20) NOT NULL, -- 'Baixa', 'Média', 'Alta', 'Crítica'
    data_abertura DATETIME NOT NULL,
    data_fechamento DATETIME,
    status VARCHAR(20) NOT NULL -- 'Fechado', 'Em Andamento'
);

-- 2. Inserção de Dados Fictícios
INSERT INTO chamados_suporte (chamado_id, cliente_id, analista_responsavel, categoria, prioridade, data_abertura, data_fechamento, status) VALUES
(201, 101, 'Carlos Silva', 'Erro de Login', 'Alta', '2026-02-01 08:00:00', '2026-02-01 12:30:00', 'Fechado'),
(202, 102, 'Mariana Costa', 'Lentidão no Banco', 'Crítica', '2026-02-01 09:15:00', '2026-02-02 18:00:00', 'Fechado'),
(203, 103, 'Carlos Silva', 'Integração de API', 'Média', '2026-02-02 10:00:00', '2026-02-04 11:00:00', 'Fechado'),
(204, 104, 'Lucas Pereira', 'Erro de Login', 'Baixa', '2026-02-03 14:00:00', '2026-02-03 16:00:00', 'Fechado'),
(205, 105, 'Mariana Costa', 'Lentidão no Banco', 'Crítica', '2026-02-04 11:30:00', '2026-02-06 09:00:00', 'Fechado'),
(206, 106, 'Lucas Pereira', 'Dúvida de Interface', 'Baixa', '2026-02-05 08:30:00', '2026-02-05 10:00:00', 'Fechado'),
(207, 107, 'Carlos Silva', 'Integração de API', 'Alta', '2026-02-05 13:00:00', '2026-02-07 15:00:00', 'Fechado'),
(208, 108, 'Mariana Costa', 'Erro de Login', 'Média', '2026-02-06 09:00:00', '2026-02-06 17:00:00', 'Fechado');
