
--tabela de vendas
CREATE TABLE public.venda (
	venda_id int8 NOT NULL,
	data_emissao date NOT NULL,
	horariomov varchar(8) NOT NULL DEFAULT '00:00:00',
	produto_id varchar(25) NOT NULL DEFAULT '',
	qtde_vendida float8,
	valor_unitario numeric(12, 4) NOT NULL DEFAULT 0,
	filial_id int8 NOT NULL DEFAULT 1,
	item int4 NOT NULL DEFAULT 0,
	unidade_medida varchar(3),
	CONSTRAINT pk_consumo PRIMARY KEY (filial_id, venda_id, data_emissao, produto_id, item, horariomov)
);

--tabelas de vendas

CREATE TABLE public.pedido_compra(
	pedido_id float8 DEFAULT 0 NOT NULL,
	data_pedido date NULL,
	item float8 DEFAULT 0 NOT NULL,
	produto_id varchar(25) DEFAULT '0' NOT NULL,
	descricao_produto varchar(255) NULL,
	ordem_compra float8 DEFAULT 0 NOT NULL,
	qtde_pedida float8 NULL,
	filial_id int4 NULL,
	data_entrega date NULL,
	qtde_entregue float8 DEFAULT 0 NOT NULL,
	qtde_pendente float8 DEFAULT 0 NOT NULL,
	preco_compra float8 DEFAULT 0 NULL,
	fornecedor_id int4 DEFAULT 0 NULL,
	CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id , produto_id, item)
);


-- tabela de entrada de mercadoria

CREATE TABLE public.entradas_mercadoria (
	ordem_compra float8 DEFAULT 0 NOT NULL,
	data_entrada date NULL,
	nro_nfe varchar(255) NOT NULL,
	item float8 DEFAULT 0 NOT NULL,
	produto_id varchar(25) DEFAULT '0' NOT NULL,
	descricao_produto varchar(255) NULL,
	qtde_recebida float8 NULL,
	filial_id int4 NULL,
	custo_unitario numeric(12, 4) DEFAULT 0 NOT NULL,
	CONSTRAINT entradas_mercadoria_pkey PRIMARY KEY (ordem_compra, item, produto_id, nro_nfe)
);

SELECT tablename
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;



