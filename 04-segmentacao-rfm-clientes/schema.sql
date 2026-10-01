-- ============================================================
-- PROJETO 04: SEGMENTAÇÃO DE BASE DE CLIENTES (ANÁLISE RFM)
-- Estrutura de Tabela e Dados Fictícios
-- ============================================================

-- 1. Tabela de Vendas / Transações de Clientes
CREATE TABLE transacoes_clientes (
    transacao_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    data_transacao DATE NOT NULL,
    valor_transacao DECIMAL(10,2) NOT NULL
);

-- 2. Inserção de Dados Fictícios (Simulação de diferentes comportamentos de compra)
INSERT INTO transacoes_clientes (transacao_id, cliente_id, nome_cliente, data_transacao, valor_transacao) VALUES
-- Cliente 101: VIP (Comprou recentemente, com frequência e alto valor)
(1, 101, 'Empresa Alfa', '2026-09-25', 4500.00),
(2, 101, 'Empresa Alfa', '2026-08-10', 3200.00),
(3, 101, 'Empresa Alfa', '2026-07-01', 5000.00),

-- Cliente 102: Em Risco (Tinha gasto alto e frequente, mas não compra há meses)
(4, 102, 'Empresa Beta', '2026-02-15', 8000.00),
(5, 102, 'Empresa Beta', '2026-01-10', 6500.00),

-- Cliente 103: Novo / Promissor (Compra recente de valor moderado)
(6, 103, 'Empresa Gamma', '2026-09-20', 1200.00),

-- Cliente 104: Inativo (Baixa frequência, valor baixo e compra antiga)
(7, 104, 'Empresa Delta', '2025-11-05', 400.00),

-- Cliente 105: Frequente de Baixo Valor (Compra com frequência, mas ticket baixo)
(8, 105, 'Empresa Epsilon', '2026-09-28', 300.00),
(9, 105, 'Empresa Epsilon', '2026-08-15', 350.00),
(10, 105, 'Empresa Epsilon', '2026-07-20', 400.00);
