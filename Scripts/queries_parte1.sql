-- 1.1 – Consumo por produto em fevereiro de 2025
SELECT 
    produto_id,
    SUM(qtde_vendida) AS total_consumo
FROM 
    venda
WHERE 
    data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id
ORDER BY 
    total_consumo DESC;


--1.2 – Produtos com requisição pendente


SELECT 
    produto_id,
    SUM(qtde_pedida) AS total_requisitada,
    SUM(qtde_entregue) AS total_entregue,
    SUM(qtde_pendente) AS pendente
FROM 
    pedido_compra
WHERE 
    qtde_pendente > 0
GROUP BY 
    produto_id
ORDER BY 
    pendente DESC;


-- 1.3 – Produtos requisitados, mas não consumidos e não recebidos (em fevereiro)

SELECT DISTINCT 
  p.produto_id || ' - ' || p.descricao_produto AS produto
FROM pedido_compra p
LEFT JOIN venda v 
  ON p.produto_id = v.produto_id AND v.data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
LEFT JOIN entradas_mercadoria e 
  ON p.ordem_compra = e.ordem_compra AND p.produto_id = e.produto_id
WHERE v.venda_id IS NULL
  AND e.produto_id IS NULL
  AND p.data_pedido BETWEEN '2025-02-01' AND '2025-02-28';


-- Tansformacao de dados 

SELECT 
    p.produto_id || ' - ' || p.descricao_produto AS produto,
    SUM(p.qtde_pedida) AS qtde_requisitada,
    TO_CHAR(p.data_pedido, 'DD/MM/YYYY') AS data_solicitacao
FROM 
    pedido_compra p
WHERE 
    p.data_pedido BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY 
    p.produto_id, p.descricao_produto, p.data_pedido
HAVING 
    SUM(p.qtde_pedida) > 10
ORDER BY 
    qtde_requisitada DESC;

