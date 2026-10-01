# 🎯 Projeto 04: Segmentação de Base de Clientes (Análise RFM)

## 🎯 Contexto do Negócio
A equipe de Customer Experience (CX) e Marketing de Relacionamento precisa criar campanhas personalizadas para diferentes perfis de clientes. Enviar a mesma comunicação para um cliente recém-chegado e para um cliente VIP de longa data gera irrelevância e aumenta o risco de cancelamento.

Como analista responsável pela inteligência de dados de CX, o objetivo deste projeto é aplicar o modelo analítico **RFM (Recência, Frequência e Valor Monetário)** via SQL:

* **Recência (R):** Há quantos dias o cliente fez a última compra/interação?
* **Frequência (F):** Quantas compras/transações o cliente realizou no total?
* **Valor Monetário (M):** Quanto o cliente já investiu no produto/serviço?

Com esses indicadores, classificamos os clientes em segmentos operacionais como **VIP**, **Ativo Frequente**, **Em Risco (Churn Alert)** e **Inativo**.

---

## 🛠️ Tecnologias e Conceitos Utilizados
* **Linguagem:** SQL (PostgreSQL / MySQL / SQL Server)
* **Conceitos:** *Common Table Expressions* (`WITH` / CTEs), *Window Functions* (`NTILE` / `RANK`), Funções de Data (`DATEDIFF` / `CURRENT_DATE`), Expressões Condicionais (`CASE WHEN`).

---

## 📂 Estrutura dos Arquivos
* `schema.sql`: Tabela de transações/pedidos com datas e valores fictícios para simulação da base.
* `queries.sql`: Consulta analítica completa em camadas utilizando CTEs para cálculo dos escores de RFM e segmentação final.
