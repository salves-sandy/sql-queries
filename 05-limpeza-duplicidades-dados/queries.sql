-- ============================================================
-- PROJETO 05: AUDITORIA DE DUPLICIDADES E LIMPEZA DE DADOS
-- Consultas de Higienização e Deduplicação de Registros
-- ============================================================

-- ------------------------------------------------------------
-- Etapa 1: Higienização de Strings (Data Normalization)
-- Remove espaços excedentes nas pontas (TRIM) e padroniza e-mails em caixa baixa (LOWER)
-- ------------------------------------------------------------
SELECT 
    id_registro,
    TRIM(nome_completo) AS nome_limpo,
    LOWER(TRIM(COALESCE(email, 'email_nao_cadastrado@dominio.com'))) AS email_normalizado,
    REPLACE(REPLACE(REPLACE(REPLACE(telefone, '(', ''), ')', ''), '-', ''), ' ', '') AS telefone_apenas_numeros,
    data_cadastro
FROM clientes_crm_raw;


-- ------------------------------------------------------------
-- Etapa 2: Diagnóstico de Registros Duplicados por E-mail
-- Identifica quais e-mails aparecem mais de uma vez na base
-- ------------------------------------------------------------
SELECT 
    LOWER(TRIM(email)) AS email_duplicado,
    COUNT(*) AS quantidade_duplicadas,
    MIN(data_cadastro) AS primeiro_cadastro,
    MAX(data_cadastro) AS ultimo_cadastro
FROM clientes_crm_raw
WHERE email IS NOT NULL
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;


-- ------------------------------------------------------------
-- Etapa 3: Deduplicação Avançada com Window Function (ROW_NUMBER)
-- Numera as duplicatas agrupando por e-mail e ordenando pela data mais recente.
-- Mantem `posicao_registro = 1` como o registro oficial atualizado.
-- ------------------------------------------------------------
WITH clientes_limpos_cte AS (
    SELECT 
        id_registro,
        TRIM(nome_completo) AS nome_completo,
        LOWER(TRIM(email)) AS email_limpo,
        telefone,
        data_cadastro,
        ROW_NUMBER() OVER (
            PARTITION BY LOWER(TRIM(email)) 
            ORDER BY data_cadastro DESC, id_registro DESC
        ) AS posicao_registro
    FROM clientes_crm_raw
    WHERE email IS NOT NULL
)

-- Exibe apenas a base final limpa e deduplicada
SELECT 
    id_registro,
    nome_completo,
    email_limpo,
    telefone,
    data_cadastro
FROM clientes_limpos_cte
WHERE posicao_registro = 1
ORDER BY data_cadastro DESC;
