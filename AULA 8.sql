DELIMITER $$

CREATE PROCEDURE sp_ola(IN p_nome VARCHAR(100))
BEGIN
   SELECT CONCAT('Ola, ', p_nome); 
END$$ 

DELIMITER ; 

CALL sp_ola('TreinaWeb'); 