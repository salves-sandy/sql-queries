-- ============================================================
-- PROJETO 05: AUDITORIA DE DUPLICIDADES E LIMPEZA DE DADOS
-- Estrutura de Tabela e Dados Sujos/Inconsistentes
-- ============================================================

-- 1. Tabela de Cadastros do CRM
CREATE TABLE clientes_crm_raw (
    id_registro INT PRIMARY KEY,
    nome_completo VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(30),
    data_cadastro DATETIME NOT NULL
);

-- 2. Inserção de Dados Fictícios com Inconsistências Comuns
INSERT INTO clientes_crm_raw (id_registro, nome_completo, email, telefone, data_cadastro) VALUES
-- Cadastro legítimo 1 e sua duplicata desatualizada
(1, '  Mariana Silva ', 'MARIANA.SILVA@EMAIL.COM', '(13) 99999-1111', '2025-05-10 10:00:00'),
(2, 'Mariana Silva', 'mariana.silva@email.com', '13999991111', '2026-01-15 14:30:00'), -- Registro mais recente

-- Cadastro legítimo 2 com formatação ruidosa
(3, ' Carlos Eduardo ', 'carlos.eduardo@gmail.com  ', ' 13 98888-2222 ', '2026-02-01 09:00:00'),

-- Cadastro legítimo 3 e duplicata exata de importação
(4, 'Ana Paula Souza', 'ana.souza@empresa.com', '11977773333', '2026-03-10 11:15:00'),
(5, 'Ana Paula Souza', 'ANA.SOUZA@EMPRESA.COM', '11977773333', '2026-03-10 11:15:00'), -- Duplicado exato

-- Cadastro com e-mail nulo/incompleto
(6, 'João Pedro Santos', NULL, '13966664444', '2026-04-05 16:20:00');
