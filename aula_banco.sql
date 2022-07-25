/* 2 funções com base na aula/videoaula (treino de sintaxe) **/

DELIMITER //
CREATE FUNCTION retorna_nome(nome VARCHAR(50), sobrenome VARCHAR(50))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
DECLARE nome_completo VARCHAR(100) DEFAULT CONCAT(nome, sobrenome);
    RETURN nome_completo ;
END;
//
DELIMITER ;

SELECT retorna_nome('Marcio', 'Carvalho');

-- função com if → se parâmetro é 'S' retornar PESSOA ATIVO.
-- testando a função na consulta
DELIMITER ??
CREATE FUNCTION verificar_ativo(ativo CHAR(1))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
DECLARE result VARCHAR(50) DEFAULT 'INATIVO';
    IF (ativo) = 'S' THEN
SET result = 'ATIVO';
END IF;
    RETURN result;
END;
??
DELIMITER ;

SELECT pessoa.nome, verificar_ativo(pessoa.ativo) FROM pessoa;

/* → x funções para treino de sintaxe **/

-- função com if e else → se parâmetro é 'S' retornar CLIENTE ATIVO senão CLIENTE INATIVO.
-- testando somente a função (sem tabela)
-- testando a função na consulta

DELIMITER ]]
CREATE FUNCTION verifica_ativo_else (ativo CHAR(1))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
DECLARE result VARCHAR(50) ;
    IF UPPER(ativo) = 'S' THEN
BEGIN
SET result = 'PESSOA ATIVO';
        END;
ELSE
BEGIN
SET result = 'PESSOA INATIVO';
        END;
END IF;
    RETURN result;
END;
]]
DELIMITER ;
SELECT pessoa.nome, verifica_ativo_else (pessoa.ativo) FROM pessoa;

