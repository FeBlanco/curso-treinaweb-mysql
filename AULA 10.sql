DELIMITER $$

CREATE TRIGGER tr_registro_compra AFTER INSERT ON cmp_compras
FOR EACH ROW 
 BEGIN
   INSERT INTO log_logs(log_mensagem)
   VALUES 
   (CONCAT('Compra realizada em', DATE_FORMAT (NEW.cmp_data_hora, '%d%M%Y %H:%m:%s')));
 END$$

DELIMITER ;

CREATE TABLE log_logs
(
 log_id SERIAL PRIMARY KEY,
 log_mensagem VARCHAR (1000) NOT NULL
);

SELECT * FROM cmp_compras; 

INSERT INTO cmp_compras (cmp_data_hora, cmp_valor_pago, cli_id)
VALUES (NOW(), 125.00, 1);

SELECT * FROM log_logs;
