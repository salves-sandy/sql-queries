#  Projeto 01: Análise de Churn e Satisfação do Cliente (CSAT/NPS)

##  Contexto do Negócio
A diretoria da empresa de software identificou um aumento no cancelamento de assinaturas (*churn*) nos primeiros 60 dias de contrato. 

Como analista da interface de CX e Banco de Dados, o objetivo deste projeto é cruzar os dados do histórico de atendimento com o status das assinaturas para responder às seguintes perguntas estratégicas:

1. Qual é a taxa de cancelamento (*churn rate*) dos clientes que atribuíram notas de satisfação baixas (CSAT < 3)?
2. Qual é a categoria de suporte que gera mais insatisfação e cancelamentos em menos de 30 dias após o atendimento?
3. Quais clientes possuem alto risco de cancelamento (atendimento recente com nota baixa e contrato ativo)?

---

##  Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (Compatível com PostgreSQL, MySQL e SQL Server)
* **Conceitos:** `INNER JOIN`, `LEFT JOIN`, Agregações (`COUNT`, `AVG`), Expressões Condicionais (`CASE WHEN`), Filtros de Data (`DATEDIFF` / Operações de data).

---

##  Estrutura dos Arquivos
* `schema.sql`: Script de criação das tabelas e inserção de dados fictícios para simulação.
* `queries.sql`: Consultas analíticas desenvolvidas para gerar as métricas requeridas.
