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

