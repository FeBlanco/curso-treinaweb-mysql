CREATE TABLE prd_produtos
(
 prd_id SERIAL PRIMARY KEY,
 prq_nome VARCHAR(30) NOT NULL,
 prd_codigo VARCHAR(50) DEFAULT'-'
 );
 
 CREATE TABLE unm_unidades_medida
(
 unm_id SERIAL PRIMARY KEY,
 unm_nome VARCHAR(30),
 unm_codigo VARCHAR(5) NOT NULL
 );
 
 ALTER TABLE prd_produtos
 ADD COLUMN unm_id INT NOT NULL;
 
 INSERT INTO unm_unidades_medida
 (unm_nome, unm_sigla)
 VALUES
 ('Quilograma','Kg');
 
 SELECT * FROM unm_unidades_medida;
 
 INSERT INTO prq_produtos
 (prd_nome, prd_codigo, unm_id)
 VALUES
 ('Carne', '1234', 1);
 
 SELECT * FROM prd_produtos;
 
  INSERT INTO prq_produtos
 (prd_nome, prd_codigo, unm_id)
 VALUES
 ('Bolacha', '3456A', 2);
 
 DELETE FROM prd_produtos WHERE prd_id = 2; 
 
 ALTER TABLE prd_produtos
 ADD CONSTRAINT fk_prd_produtos__unm_unidades_medida__unm_id
 FOREIGN KEY (unm_id) REFERENCES unm_unidades_medida(unm_id);
 
 ALTER TABLE prd_produtos CHANGE COLUMN unm_id unm_id BIGINT UNSIGNED NOT NULL; 
 
 CREATE TABLE cmp_compras
 (
 cmp_id SERIAL PRIMARY KEY, 
 cmp_data_hora DATETIME NOT NULL DEFAULT NOW(),
 cmp_valor_pago DECIMAL(8,2) NOT NULL,
 cli_id BIGINT UNSIGNED NOT NULL,
 FOREIGN KEY (cli_id) REFERENCES cli_clientes(cli_id)
 );
 
 CREATE TABLE cmp_prd_compras_produtos
 (
 prd_id BIGINT UNSIGNED NOT NULL,
 cmp_id BIGINT UNSIGNED NOT NULL,
 cmp_prd_quantidade INT NOT NULL,
 cmp_prd_preco DECIMAL(8,2) NOT NULL,
 PRIMARY KEY(prod_id, cmp_id),
 FOREIGN KEY(prd_id) REFERENCES prd_produtos(pred_id),
 FOREIGN KEY(cmp_id) REFERENCES cmp_compras(cmp_id)
 );
 