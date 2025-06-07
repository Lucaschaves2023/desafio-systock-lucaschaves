
----Consultas SQL de apoio para a reunião de validação

----3.1 – Produtos vendidos no mês de fevereiro/2025**


SELECT 
    produto_id,
    SUM(qtde_vendida) AS total_vendido
FROM 
    venda
WHERE 
    data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id;


 -- 3.2 – Produtos recebidos no mês de fevereiro/2025


SELECT 
    produto_id,
    SUM(qtde_recebida) AS total_recebida
FROM 
    entradas_mercadoria
WHERE 
    data_entrada BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id;


-- 3.3 – Produtos requisitados (pedidos feitos) no mês de fevereiro/2025


SELECT 
    produto_id,
    SUM(qtde_pedida) AS total_requisitado
FROM 
    pedido_compra
WHERE 
    data_pedido BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY 
    produto_id;


--3.4 – Produtos requisitados mas não recebidos e não vendidos


SELECT DISTINCT 
    p.produto_id
FROM 
    pedido_compra p
LEFT JOIN 
    venda v ON p.produto_id = v.produto_id AND v.data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
LEFT JOIN 
    entradas_mercadoria e ON p.ordem_compra = e.ordem_compra AND p.produto_id = e.produto_id
WHERE 
    v.venda_id IS NULL
    AND e.produto_id IS NULL
    AND p.data_pedido BETWEEN '2025-02-01' AND '2025-02-28';


--3.5 – Verificação do custo vs. valor de venda


SELECT 
    v.produto_id,
    v.valor_unitario AS preco_venda,
    e.custo_unitario AS custo_entrada
FROM 
    venda v
JOIN 
    entradas_mercadoria e 
    ON v.produto_id = e.produto_id
WHERE 
    v.data_emissao BETWEEN '2025-02-01' AND '2025-02-28'
    AND e.data_entrada BETWEEN '2025-02-01' AND '2025-02-28';
