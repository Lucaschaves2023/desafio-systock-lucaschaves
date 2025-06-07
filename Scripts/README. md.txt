# 📦 Desafio Técnico – Analista de Integração de Dados (Systock)

Este repositório contém a solução do desafio técnico proposto para a vaga de **Analista de Integração de Dados** da empresa **Systock**, com foco em consultas SQL, estruturação de banco de dados e análise de consistência entre pedidos, entradas e vendas.



## ✅ Parte 1 – Consultas SQL Básicas

- **1.1** Total de consumo por produto no mês de fevereiro/2025  
- **1.2** Produtos com requisição pendente (qtde_pendente > 0)  
- **1.3** Produtos requisitados, mas não consumidos e não recebidos em fevereiro  

📄 Acesse: [`scripts/queries_parte1.sql`](scripts/queries_parte1.sql)



## 🔄 Parte 2 – Transformações de Dados

Consulta que retorna:

- Concatenação de `produto_id` e `descricao_produto`  
- Data formatada como `DD/MM/YYYY`  
- Apenas produtos requisitados mais de 10 vezes no período

📄 Acesse: [`scripts/queries_parte2.sql`](scripts/queries_parte2.sql)



## 👥 Parte 3 – Estratégia de Validação com o Cliente

# 📌 Pontos que seriam validados com o cliente

1. Se os pedidos foram registrados corretamente (produto, quantidade, data);
2. Se as entradas foram feitas com base nos pedidos, conferindo por ordem de compra;
3. Se os produtos vendidos têm vínculo com as entradas realizadas no mês;
4. Se há produtos requisitados, mas **não recebidos e nem vendidos**;
5. Se o **valor de venda** é maior que o **custo de entrada**, garantindo margem.



### 🧠 Técnicas utilizadas

- `JOINs` entre as três tabelas para cruzar dados;
- `LEFT JOIN + IS NULL` para encontrar inconsistências (ex: produtos pendentes);
- `SUM()` e `GROUP BY` para agregações por produto;
- Filtros por data para garantir a análise apenas do mês solicitado;
- Comparação entre custo e preço de venda para avaliação financeira.

📄 Acesse: [`scripts/validacao_cliente.sql`](scripts/validacao_cliente.sql)



## 👨‍💻 Autor

Lucas dos Santos Chaves 
📍 Manaus, AM – Brasil  
🎓 Estudante de Engenharia de Software na FUCAPI  
💼 Consultor de Dados na TOTVS Norte
