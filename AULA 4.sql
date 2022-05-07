USE TW_NFE;
SELECT * FROM  cli_clientes;
SELECT * FROM cmp_compras;

INSERT INTO cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
VALUES
(NOW(), 150.00, 1);

SELECT * 
FROM cli_clientes, cmp_compras;

INSERT INTO cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
VALUES
(NOW(), 75.00, 2);

SELECT cli_clientes.clinome, cli_clientes.cli_cpf, cmp_compras.cmp_data_hora, cmp_compras.cmp_valor_pago
FROM cli_clientes cli, cmp_compras cmp
WHERE cli.cli_id = cmp.cli_id; 

SELECT cli.cli_nome, cli.cli_cpf, cmp.cmp_data_hora, cmp.cmp_valor_pago
FROM cli_clientes cli
INNER JOIN cmp_compras cmp
ON cli.cli_id = cmp.cli_id;
-- WHERE cmp.cmp_valor_valorpago > 100; 

SELECT cli.cli_nome,
       cli.cli_cpf,
       cmp.cmp_data_hora, 
       COALESCE (cmp.cmp_valor_pago, 0)
FROM cli_clientes cli
LEFT JOIN cmp_compras cmp
ON cli.cli_id = cmp.cli_id;
-- WHERE cmp.cmp_data_hora IS NULL;

SELECT cli.cli_nome,
       cli.cli_cpf,
       cmp.cmp_data_hora, 
       COALESCE (cmp.cmp_valor_pago, 0)
FROM cmp_compras cmp
RIGHT JOIN cli_clientes cli
ON cli.cli_id = cmp.cli_id;

