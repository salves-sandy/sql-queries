# 🧹 Projeto 05: Auditoria de Duplicidades e Limpeza de Dados (Data Cleaning)

## 🎯 Contexto do Negócio
Devido a falhas de validação no formulário de cadastro do sistema legado e importações em lote incorretas, a base de dados de clientes e chamados de suporte do CRM acumulou **cadastros duplicados**, **espaços em branco desnecessários** e **inconsistências na formatação de e-mails/documentos**.

Essa sujeira nos dados gera duplicidade no envio de e-mails de atendimento, métricas distorcidas no dashboard de Customer Experience (CX) e retrabalho para o time de suporte.

Como analista responsável pela governança de dados e CX, o objetivo deste projeto é:
1. Identificar registros duplicados mantendo apenas o registro mais recente/completo.
2. Normalizar e higienizar campos de texto (e-mail, nome e telefone).
3. Desenvolver uma consulta de remoção/deduplicação segura utilizando *Window Functions*.

---

## 🛠️ Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (PostgreSQL / MySQL / SQL Server)
* **Conceitos:** *Window Functions* (`ROW_NUMBER() OVER (...)`), *Common Table Expressions* (`WITH` / CTEs), Funções de Tratamento de Texto (`LOWER`, `TRIM`, `REPLACE`), Filtragem de Nulos (`COALESCE`).

---

## 📂 Estrutura dos Arquivos
* `schema.sql`: Tabela de cadastros de clientes contendo inconsistências e registros duplicados intencionais para simulação.
* `queries.sql`: Consultas para diagnóstico de sujeira nos dados, higienização de strings e script de deduplicação via CTE e `ROW_NUMBER()`.
