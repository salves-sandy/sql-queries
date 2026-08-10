-- ============================================================
-- PROJETO 02: MAPEAMENTO DE GARGALOS NO SUPORTE TÉCNICO (SLA)
-- Consultas Analíticas para Diagnóstico Operacional
-- ============================================================

-- ------------------------------------------------------------
-- Pergunta 1: Tempo Médio de Resolução (em horas) e Taxa de Estouro de SLA por Categoria
-- Considera SLA limite = 24 horas
-- ------------------------------------------------------------
SELECT 
    categoria,
    COUNT(chamado_id) AS total_chamados,
    ROUND(AVG(DATEDIFF(HOUR, data_abertura, data_fechamento)), 1) AS tempo_medio_horas,
    SUM(CASE WHEN DATEDIFF(HOUR, data_abertura, data_fechamento) > 24 THEN 1 ELSE 0 END) AS chamados_fora_sla,
    ROUND(
        (SUM(CASE WHEN DATEDIFF(HOUR, data_abertura, data_fechamento) > 24 THEN 1.0 ELSE 0.0 END) / COUNT(chamado_id)) * 100, 
        2
    ) AS porcentagem_estouro_sla
FROM chamados_suporte
WHERE status = 'Fechado'
GROUP BY categoria
ORDER BY porcentagem_estouro_sla DESC;


-- ------------------------------------------------------------
-- Pergunta 2: Performance por Analista - Volume vs Cumprimento de SLA
-- ------------------------------------------------------------
SELECT 
    analista_responsavel,
    COUNT(chamado_id) AS total_atendidos,
    ROUND(AVG(DATEDIFF(HOUR, data_abertura, data_fechamento)), 1) AS horas_medias_por_chamado,
    SUM(CASE WHEN DATEDIFF(HOUR, data_abertura, data_fechamento) <= 24 THEN 1 ELSE 0 END) AS dentro_do_sla,
    SUM(CASE WHEN DATEDIFF(HOUR, data_abertura, data_fechamento) > 24 THEN 1 ELSE 0 END) AS fora_do_sla
FROM chamados_suporte
WHERE status = 'Fechado'
GROUP BY analista_responsavel
ORDER BY fora_do_sla DESC;


-- ------------------------------------------------------------
-- Pergunta 3: Mapeamento de Chamados Críticos que Excederam o SLA
-- Lista detalhada para auditoria do time de liderança de CX
-- ------------------------------------------------------------
SELECT 
    chamado_id,
    cliente_id,
    analista_responsavel,
    categoria,
    prioridade,
    DATEDIFF(HOUR, data_abertura, data_fechamento) AS horas_totais_atendimento
FROM chamados_suporte
WHERE prioridade IN ('Alta', 'Crítica')
  AND DATEDIFF(HOUR, data_abertura, data_fechamento) > 24
ORDER BY horas_totais_atendimento DESC;
