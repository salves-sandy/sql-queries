-- ============================================================
-- PROJETO 01: ANÁLISE DE CHURN E CSAT
-- Consultas Analíticas para CX e Tomada de Decisão
-- ============================================================

-- ------------------------------------------------------------
-- Pergunta 1: Qual é a taxa de cancelamento (Churn) agregada por faixa de satisfação (CSAT)?
-- ------------------------------------------------------------
SELECT 
    CASE 
        WHEN t.nota_csat <= 2 THEN 'Insatisfeito (1-2)'
        WHEN t.nota_csat = 3 THEN 'Neutro (3)'
        ELSE 'Satisfeito (4-5)'
    END AS classificacao_csat,
    COUNT(DISTINCT c.cliente_id) AS total_clientes,
    COUNT(DISTINCT CASE WHEN c.status_assinatura = 'Cancelado' THEN c.cliente_id END) AS total_churn,
    ROUND(
        (COUNT(DISTINCT CASE WHEN c.status_assinatura = 'Cancelado' THEN c.cliente_id END) * 100.0) / COUNT(DISTINCT c.cliente_id), 
        2
    ) AS taxa_churn_porcentagem
FROM clientes c
INNER JOIN tickets_suporte t ON c.cliente_id = t.cliente_id
GROUP BY 
    CASE 
        WHEN t.nota_csat <= 2 THEN 'Insatisfeito (1-2)'
        WHEN t.nota_csat = 3 THEN 'Neutro (3)'
        ELSE 'Satisfeito (4-5)'
    END;


-- ------------------------------------------------------------
-- Pergunta 2: Quais categorias de suporte geram menor nota média de CSAT e maior número de cancelamentos?
-- ------------------------------------------------------------
SELECT 
    t.categoria,
    ROUND(AVG(t.nota_csat), 2) AS media_csat,
    COUNT(t.ticket_id) AS total_chamados,
    COUNT(DISTINCT CASE WHEN c.status_assinatura = 'Cancelado' THEN c.cliente_id END) AS clientes_cancelados
FROM tickets_suporte t
INNER JOIN clientes c ON t.cliente_id = c.cliente_id
GROUP BY t.categoria
ORDER BY media_csat ASC;


-- ------------------------------------------------------------
-- Pergunta 3: Mapeamento de Risco (Health Score)
-- Clientes ativos com notas baixas de atendimento (CSAT <= 2) que exigem contato preventivo do time de CS/CX.
-- ------------------------------------------------------------
SELECT 
    c.cliente_id,
    c.nome,
    c.status_assinatura,
    t.categoria AS categoria_ultimo_problema,
    t.nota_csat,
    t.data_fechamento AS data_atendimento
FROM clientes c
INNER JOIN tickets_suporte t ON c.cliente_id = t.cliente_id
WHERE c.status_assinatura = 'Ativo'
  AND t.nota_csat <= 2
ORDER BY t.data_fechamento DESC;
