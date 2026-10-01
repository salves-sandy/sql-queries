# ⚡ Projeto 03: Otimização de Consulta Lenta em Relatório Financeiro

## 🎯 Contexto do Negócio
A equipe financeira e a diretoria relataram extrema lentidão ao carregar o dashboard mensal de faturamento e status de pagamento por cliente. A consulta original levava cerca de 45 segundos para responder, travando a interface e gerando concorrência desnecessária no banco de dados (*locks*).

Como analista com foco em performance e dados, o objetivo deste projeto é refatorar a query ineficiente (que utilizava subconsultas correlacionadas e varreduras completas em tabelas), reduzindo o tempo de execução e aplicando boas práticas de indexação e estrutura de consultas.

---

## 🛠️ Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (PostgreSQL / MySQL / SQL Server)
* **Conceitos:** Refatoração de Subqueries para `LEFT JOIN`, Agregações Condicionais (`SUM(CASE ...)`), Plano de Execução (`EXPLAIN` / `EXPLAIN ANALYZE`), Criação Estratégica de Índices.

---

## 📂 Estrutura dos Arquivos
* `schema.sql`: Tabela de faturas/transações e inserção de dados fictícios para simulação de alto volume.
* `queries.sql`: Comparativo completo entre a **Query Lenta (Original)** e a **Query Otimizada (Refatorada)**, com scripts de indexação.
