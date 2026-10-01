-- ============================================================
-- PROJETO 03: OTIMIZAÇÃO DE CONSULTA LENTA EM RELATÓRIO FINANCEIRO
-- Comparativo de Performance & Refatoração
-- ============================================================

-- ------------------------------------------------------------
-- 🔴 CONSULTA INEFICIENTE (ORIGINAL - LENTA)
-- Problema: Utiliza subconsultas correlacionadas executadas linha a linha (N+1 problema)
-- causando alto consumo de CPU e varredura completa da tabela (Table Scan).
-- ------------------------------------------------------------
SELECT 
    c.cliente_id,
    c.nome_empresa,
    c.segmento,
    (SELECT SUM(f1.valor_fatura) 
     FROM faturas f1 
     WHERE f1.cliente_id = c.cliente_id AND f1.status_pagamento = 'Pago') AS total_pago,
    (SELECT SUM(f2.valor_fatura) 
     FROM faturas f2 
     WHERE f2.cliente_id = c.cliente_id AND f2.status_pagamento = 'Pendente') AS total_pendente,
    (SELECT SUM(f3.valor_fatura) 
     FROM faturas f3 
     WHERE f3.cliente_id = c.cliente_id AND f3.status_pagamento = 'Atrasado') AS total_atrasado
FROM clientes_financeiro c;


-- ------------------------------------------------------------
-- 🚀 CONSULTA OTIMIZADA (REFATORADA)
-- Solução: Substituição das subconsultas por um único LEFT JOIN com
-- agregação condicional (SUM + CASE WHEN), reduzindo as leituras ao banco para 1 única passagem.
-- ------------------------------------------------------------
SELECT 
    c.cliente_id,
    c.nome_empresa,
    c.segmento,
    COALESCE(SUM(CASE WHEN f.status_pagamento = 'Pago' THEN f.valor_fatura ELSE 0 END), 0) AS total_pago,
    COALESCE(SUM(CASE WHEN f.status_pagamento = 'Pendente' THEN f.valor_fatura ELSE 0 END), 0) AS total_pendente,
    COALESCE(SUM(CASE WHEN f.status_pagamento = 'Atrasado' THEN f.valor_fatura ELSE 0 END), 0) AS total_atrasado,
    COALESCE(SUM(f.valor_fatura), 0) AS faturamento_total
FROM clientes_financeiro c
LEFT JOIN faturas f ON c.cliente_id = f.cliente_id
GROUP BY c.cliente_id, c.nome_empresa, c.segmento
ORDER BY faturamento_total DESC;


-- ------------------------------------------------------------
-- ⚡ MELHORIA ADICIONAL: CRIAÇÃO DE ÍNDICES ESTRATÉGICOS
-- Evita Index/Table Scans em bancos com grande volume de dados.
-- ------------------------------------------------------------
-- Índice na chave estrangeira e status de pagamento para acelerar o JOIN e agrupamento
CREATE INDEX idx_faturas_cliente_status 
ON faturas (cliente_id, status_pagamento) 
INCLUDE (valor_fatura); -- Sintaxe para SQL Server (no MySQL/PostgreSQL pode omitir o INCLUDE)
