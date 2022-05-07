USE TW_NFE;
CREATE TABLE cli_clientes
(
  cli_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cli_nome VARCHAR(50) NOT NULL,
  cli_data_nascimento DATE, 
  cli_logradouro VARCHAR(200) 
);

  INSERT INTO cli_clientes
  (cli_nome,cli_data_nascimento,cli_logradouro)
  VALUES 
  ('Felipe','1993-04-10','Rua X');
  
  INSERT INTO cli_clientes
  (cli_nome)
  VALUES 
  ('Jesus');
  
  SELECT (cli_id,cli_nome,cli_data_nascimento,cli_logradouro)
  FROM cli_clientes;
  
  SELECT * FROM cli_clientes;
  
  ALTER TABLE cli_clientes
  ADD CONSTRAINT UN_CLI_CLIENTES__CLI_CPF UNIQUE (cli_cpf);
  
  ALTER TABLE cli_clientes DROP INDEX UN_CLI_CLIENTES__CLI_CPF;
  
  SELECT *
  FROM cli_clientes
  WHERE cli_id = 1;
  
  SELECT *
  FROM cli_clientes
  WHERE cli_data_nascimento IS NULL; 
  
  SELECT *
  FROM cli_clientes
  WHERE cli_data_nascimento IS NOT NULL AND cli_logradouro IS NULL;
  
  SELECT *
  FROM cli_clientes
  WHERE cli_nome LIKE '%el%';
  
  SELECT *
  FROM cli_clientes
  WHERE UPPER(cli_nome) LIKE '%el%';
  
  SELECT LOWER('FELIPE');
  
  SELECT *
  FROM cli_clientes
  WHERE cli_nome = 'Felipe' OR cli_nome = 'Felhipe' OR cli_nome = 'FIlipe';
  
  SELECT *
  FROM cli_clientes
  WHERE SOUNDEX(cli_nome) = SOUNDEX('Felipe'); 
  
  SELECT cli_nome, cli_data_nascimento, TIMESTAMPDIFF(YEAR, cli_data_nascimento, CURDATE()) AS idade
  FROM cli_clientes;
  
  ALTER TABLE cli_clientes
  ADD COLUMN cli_cpf CHAR(14) NOT NULL DEFAULT '-' AFTER cli_nome; 
  
  ALTER TABLE cli_clientes 
  DROP COLUMN cli_cpf; 
  
  UPDATE cli_clientes 
  SET cli_logradouro = 'Rua XX' 
  WHERE cli_id = 2; 
  
  
  