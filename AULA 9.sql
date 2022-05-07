DELIMITER $$
CREATE PROCEDURE sp_registrar_compra(IN p_valor_pago DECIMAL, 
                                     IN p_cli_id BIGINT,
                                     IN p_prd_id BIGINT,
                                     IN p_quantidade INT, 
                                     IN p_preco DECIMAL)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
       ROLLBACK;
       SELECT 'Deu ruim';
    END;
    START TRANSACTION;
    INSERT INTO cm_compras (cmp_data_hora, cmp_valor_pago, cli_id)
				 VALUES(NOW(), p_valor_pago, p_cli_id);
    SET v_cmp_id = LAST_INSERT_ID (); 
    INSERT INTO cmp_prd_compras_produtos VALUES (p_prd_id, v_cmp_id, p_quantidade, p_preco);
END$$
DELIMITER ;

DESC cmp_compras; 
DESC cmp_prd_compras_produtos;

SELECT * FROM cmp_compras;
SELECT * FROM cmp_prd_ compras_produtos;

CALL sp_registrar_compra(200, 2, 1, 1, 150);




SELECT last_insert_id();
