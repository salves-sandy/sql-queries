#  Projeto 02: Mapeamento de Gargalos no Suporte Técnico (SLA)

##  Contexto do Negócio
A equipe de operações de Customer Experience (CX) notou um aumento nas reclamações de clientes devido ao atraso no atendimento de chamados críticos. O Acordo de Nível de Serviço (**SLA - Service Level Agreement**) estipula o tempo máximo de **24 horas** para a resolução de chamados de suporte técnico.

Como analista responsável por alinhar dados e CX, o objetivo deste projeto é identificar onde estão os gargalos operacionais, quais categorias ultrapassam o SLA com mais frequência e quais analistas precisam de apoio ou redistribuição de demandas.

---

##  Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (PostgreSQL / MySQL / SQL Server)
* **Conceitos:** Cálculo de intervalo de tempo (`DATEDIFF` / Subtração de Datas), Expressões Condicionais (`CASE WHEN`), Agrupamentos (`GROUP BY`), Filtros por Status e Taxa de Estouro de SLA.

---

##  Estrutura dos Arquivos
* `schema.sql`: Estrutura da tabela de chamados e inserção de dados fictícios com timestamps de abertura e fechamento.
* `queries.sql`: Consultas analíticas para monitoramento de tempo médio de atendimento e estouro de SL
