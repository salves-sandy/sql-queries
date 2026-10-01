-- ============================================================
-- PROJETO 04: SEGMENTAÇÃO DE BASE DE CLIENTES (ANÁLISE RFM)
-- Consulta em CTEs para Cálculo de Recência, Frequência e Valor
-- Data de referência considerada para simulação: '2026-09-30'
-- ============================================================

WITH rfm_base AS (
    -- Etapa 1: Calcular os valores brutos de Recência (dias), Frequência e Valor Monetário Total
    SELECT 
        cliente_id,
        nome_cliente,
        DATEDIFF('2026-09-30', MAX(data_transacao)) AS dias_recencia,
        COUNT(transacao_id) AS frequencia_compras,
        SUM(valor_transacao) AS valor_monetario_total
    FROM transacoes_clientes
    GROUP BY cliente_id, nome_cliente
),

rfm_scores AS (
    -- Etapa 2: Atribuir pontuação relativa de 1 a 3 para cada dimensão (Regra de Negócio)
    SELECT 
        cliente_id,
        nome_cliente,
        dias_recencia,
        frequencia_compras,
        valor_monetario_total,
        -- Pontuação de Recência: Quanto menor os dias desde a última compra, maior o score
        CASE 
            WHEN dias_recencia <= 30 THEN 3
            WHEN dias_recencia <= 120 THEN 2
            ELSE 1
        END AS score_recencia,
        -- Pontuação de Frequência
        CASE 
            WHEN frequencia_compras >= 3 THEN 3
            WHEN frequencia_compras = 2 THEN 2
            ELSE 1
        END AS score_frequencia,
        -- Pontuação Monetária
        CASE 
            WHEN valor_monetario_total >= 5000 THEN 3
            WHEN valor_monetario_total >= 1000 THEN 2
            ELSE 1
        END AS score_monetario
    FROM rfm_base
)

-- Etapa 3: Classificação e Segmentação de CX com recomendação de ação
SELECT 
    cliente_id,
    nome_cliente,
    dias_recencia,
    frequencia_compras,
    valor_monetario_total,
    CONCAT(score_recencia, score_frequencia, score_monetario) AS codigo_rfm,
    CASE 
        WHEN score_recencia = 3 AND score_frequencia = 3 AND score_monetario = 3 THEN 'Cliente VIP (Prioridade Total)'
        WHEN score_recencia = 3 AND score_frequencia >= 2 THEN 'Ativo Frequente'
        WHEN score_recencia = 3 AND score_frequencia = 1 THEN 'Novo / Promissor'
        WHEN score_recencia = 1 AND score_monetario >= 2 THEN 'Em Risco de Churn (Ação Imediata)'
        ELSE 'Inativo / Churn Confirmado'
    END AS segmento_cx,
    CASE 
        WHEN score_recencia = 3 AND score_monetario = 3 THEN 'Oferecer atendimento dedicado e pré-lançamentos'
        WHEN score_recencia = 1 AND score_monetario >= 2 THEN 'Acionar time de CS para reunião de alinhamento e resgate'
        WHEN score_recencia = 3 AND score_frequencia = 1 THEN 'Enviar fluxo de onboarding e treinamento do sistema'
        ELSE 'Inserir em régua automatizada de reativação'
    END AS acao_recomendada_cx
FROM rfm_scores
ORDER BY valor_monetario_total DESC;
