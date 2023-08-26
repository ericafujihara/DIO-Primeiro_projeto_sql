## Primeiro projeto sql - Desafio DIO

# Recuperando dados com SELECT Statement:
# Recuperar as informações de todos os clientes
SELECT * 
FROM cliente;

# Recuperar as informações dos produtos
SELECT * 
FROM produto;


# Utilizando where para aplicar filtros
# Recuperando pedidos do cliente com id=001
SELECT * 
FROM pedido 
WHERE cliente_id = 001;

# Recuperar produtos com preço acima de 20.00
SELECT * 
FROM produto 
WHERE preco > 20.00;


# Utilizando group by para recuperar o valor total de um pedido
SELECT pedido_id, SUM(quantidade * preco) AS valor_total
FROM item_pedido
JOIN produto ON ItemPedido.produto_id = Produto.produto_id
WHERE pedido_id = 123
GROUP BY pedido_id;


# Recuperar os produtos ordenados por preço
SELECT * 
FROM produto 
ORDER BY preco DESC;


# Condições de filtros aos grupos – HAVING Statement
# Recuperar fornecedores que têm produtos com estoque abaixo de 100 unidades

SELECT fornecedor.nome, COUNT(*) AS produtos_com_pouco_estoque
FROM fornecedor
JOIN estoque ON fornecedor.fornecedor_id = estoque.fornecedor_id
WHERE estoque.quantidade < 100
GROUP BY fornecedor.nome
HAVING produtos_com_pouco_estoque > 0;



# Recuperar os produtos e seus fornecedores
SELECT produto.nome AS nome_produto, fornecedor.nome AS nome_fornecedor
FROM produto
JOIN estoque ON produto.produto_id = estoque.produto_id
JOIN fornecedor ON estoque.fornecedor_id = Fornecedor.fornecedor_id;


# Recuperar os clientes que fizeram mais de 2 pedidos
SELECT cliente.nome, COUNT(pedido.pedido_id) AS qtd_pedidos
FROM cliente
JOIN pedido ON cliente.cliente_id = pedido.cliente_id
GROUP BY cliente.nome
HAVING qtd_pedidos > 2;
