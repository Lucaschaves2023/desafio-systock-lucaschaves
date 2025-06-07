INSERT INTO pedido_compra (pedido_id, data_pedido, item, produto_id, descricao_produto, ordem_compra, qtde_pedida, filial_id, data_entrega, qtde_entregue, qtde_pendente, preco_compra, fornecedor_id)
VALUES 
(1001, '2025-02-10', 1, 'P001', 'Detergente', 5001, 15, 1, '2025-02-15', 10, 5, 2.50, 1),
(1002, '2025-02-12', 1, 'P002', 'Sabão', 5002, 8, 1, '2025-02-20', 8, 0, 1.75, 1),
(1003, '2025-02-25', 1, 'P003', 'Esponja', 5003, 20, 1, '2025-02-28', 0, 20, 1.00, 2);



INSERT INTO entradas_mercadoria (ordem_compra, data_entrada, nro_nfe, item, produto_id, descricao_produto, qtde_recebida, filial_id, custo_unitario)
VALUES
(5001, '2025-02-16', 'NF001', 1, 'P001', 'Detergente', 10, 1, 2.50),
(5002, '2025-02-22', 'NF002', 1, 'P002', 'Sabão', 8, 1, 1.75);



INSERT INTO venda (venda_id, data_emissao, horariomov, produto_id, qtde_vendida, valor_unitario, filial_id, item, unidade_medida)
VALUES
(2001, '2025-02-20', '10:00:00', 'P001', 8, 3.50, 1, 1, 'UN'),
(2002, '2025-02-25', '11:00:00', 'P002', 6, 4.00, 1, 1, 'UN');
