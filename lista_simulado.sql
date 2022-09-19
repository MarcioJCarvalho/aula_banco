/*
1.	Considerando que a coluna STATUS da tabela ESTADO apresenta ‘A’ para estados ativos e ‘I’ para inativos. 
Crie uma coluna gerada virtual que apresente a informação completa (ATIVO e INATIVO). Após a criação da coluna, 
escreva a consulta que apresente a coluna virtual.
*/

SELECT IF(status = 'A', 'ATIVO', 'INATIVO') AS 'STATUS_COMPLETO'
FROM estado;

/*
2.	A coluna DATA_CADASTRO da tabela CIDADE tem a finalidade de armazenar as datas dos registros.
Neste contexto, crie uma coluna gerada armazenada que classifique os registros em “novo” (após 2010)
e “antigo” (demais registros). Após a criação da coluna, escreva a consulta que apresente a coluna gerada armazenada.
*/


ALTER TABLE cidade 
ADD COLUMN antigo_novo VARCHAR(15)
GENERATED ALWAYS AS(
CASE WHEN YEAR(DATA_CADASTRO) > 2010
	THEN 'NOVO'
	ELSE 'ANTIGO'
END)STORED;


/*
3.	Em relação aos exercícios anteriores, explique a diferença entre as duas elencando as vantagens e desvantagens de cada uma.
R = A tabela virtual não é interessante quando a tabela tem muitos registros de cnsulta, armazenada é melhor indicada quando tem uma coluna desnormalizadas.
*/

/*
4.	Escreva uma função que receba como parâmetro um e-mail, verifique se é válido (possui “@”)
e retorne o resultado. Teste a função em uma das tabelas do estudo de caso. 
*/

DELIMITER //
CREATE FUNCTION validar_email(email varchar(100))
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE retorno VARCHAR(20) DEFAULT 'INVALIDO';
    IF email LIKE '%@%' THEN
		BEGIN
			SET retorno = 'VALIDO';
		END;
    END IF;
    RETURN retorno;
END;
//
DELIMITER ;
SELECT validarEmail(email) FROM cliente;

/*
5.	Escreva uma função que receba como parâmetro o código de um produto, verifique se o preço de venda está pelo menos
30% superior ao preço de compra e retorne o resultado. Em seguida, escreva um único comando que utilize a função criada
para verificar os preços de todos os produtos cadastrados.
*/

DELIMITER //
CREATE FUNCTION verifica_preco_produto(id_produto INT)
RETURNS BIT DETERMINISTIC
BEGIN
DECLARE retorno BIT DEFAULT 0;
DECLARE p_custo DECIMAL(12,2);
DECLARE p_venda DECIMAL(12,2);
SELECT PRECO_CUSTO + (PRECO_CUSTO  / 100 * 30) INTO p_custo FROM produto WHERE ID = id_produto;
SELECT PRECO_VENDA INTO p_venda FROM produto WHERE ID = id_produto;
    IF p_custo > p_venda THEN
		BEGIN
			SET retorno = 1;
		END;
    END IF;
    RETURN retorno;
END;
//
DELIMITER ;


SELECT verifica_preco_produto(id) FROM produto;

/*
6.	Considerando em que a coluna TOTAL da tabela COMPRA está desnormalizada, escreva uma única função que verifique
a coesão de todos os totais da tabela compra.
*/

DELIMITER //
CREATE FUNCTION verifica_total(id_compra INT)
RETURNS BIT DETERMINISTIC
BEGIN

	DECLARE retorno BIT DEFAULT 1;
	DECLARE total DECIMAL(12,2);
    DECLARE total_compra DECIMAL(12,2);
	SELECT  C.DESCONTO - (C.DESCONTO + C.ACRESCIMO) INTO total FROM COMPRA C WHERE ID = id_compra;
    SELECT C.TOTAL INTO total_compra FROM COMPRA C WHERE ID = id_compra;
	IF total != total_compra THEN
    BEGIN
		SET retorno = 0;
	END;
    END IF;
	RETURN retorno;
END;
//
DELIMITER ;

SELECT verifica_total(2);



-- --------------------------------------------------------
-- Lista II
-- --------------------------------------------------------

/*
1.	Considerando um cenário em que a tabela PARCELA_PAGAR possui poucas incidências de inserções de novos registros
e muitas requisições de consulta. Diante do exposto, interprete a melhor solução para implementar uma coluna gerada
VIRTUAL ou ARMAZENADA que indique se a parcela está quitada ou não. Justifique a solução.
*/
SELECT IF(QUITADO = VALOR, 'QUITADO', 'EM ABERTO') AS 'PARCELA_QUITADA'
FROM parcela_pagar;
/*
Ultilizo a coluna virtual, pois economiza espaço em disco, tendo em vista que na tabela existam poucos registros.
*/

describe parcela_pagar;
INSERT INTO parcela_pagar(VALOR, QUITADO) VALUES(10.00, 10.00);


/*
2.	Em relação à coluna TOTAL da tabela COMPRA, a coluna respeita todas as regras da normalização? Caso não, identifique
qual normalização não é respeitada, explique os possível problemas que podem ser gerados e implemente uma possível solução
para minimizar estes problemas. Justifique a solução.
*/
/*
R= A coluna TOTAL está desnormalizada, pois ao fazer alteração na coluna DESCONTO ou ACRESCIMO a TOTAL pode não ser atalizado ou inserido valores 
divergentes.
A Solução foi criar uma coluna armazenada TOTAL que é verificada e atualizada na inserção dos valores.
*/
DESCRIBE compra;
ALTER TABLE compra 
MODIFY COLUMN TOTAL DECIMAL(12,2) AS( - DESCONTO + ACRESCIMO)STORED;

/*
3.	Escreva uma função que retorne a diferença prevista entre pagamentos e recebimentos à vista do dia.
Em seguida, escreva o comando para testar a função.
*/

DELIMITER //
CREATE FUNCTION diferenca_pagamento(dia DATETIME)
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
	DECLARE pagamento DECIMAL(12,2);
    DECLARE recebimento DECIMAL(12,2);
    DECLARE retorno DECIMAL(12,2) DEFAULT 0.00;
    SELECT P.VALOR INTO pagamento FROM PAGAMENTO P WHERE DATE_FORMAT(DATA_PAGAMENTO,'%d/%m/%Y') >= dia;
    SELECT R.VALOR INTO recebimento FROM RECEBIMENTO R WHERE DATE_FORMAT(DATA_RECEBIMENTO,'%d/%m/%Y') >= dia;
    IF pagamento > 0 OR recebimento > 0 THEN
		BEGIN
			SET retorno = pagamento - recebimento;
		END;
	END IF;
    RETURN retorno;
END;
//
DELIMITER ;

SELECT diferenca_pagamento(18/09/2022) AS 'DIFERENÇA';


/*
5.	A coluna CONTATO da tabela CLIENTE foi criada especificamente para registros de empresas – pessoa jurídica.
Neste sentido, escreva uma única função que verifique se somente registros de empresas possuem contato. Em seguida, 
escreva o comando para testar a função.
*/

DELIMITER //
CREATE FUNCTION verifica_contato(id_cliente INT)
RETURNS BIT DETERMINISTIC 
BEGIN
	DECLARE retorno BIT DEFAULT 1;
    DECLARE len INT;
    DECLARE contato VARCHAR(100);
    SELECT CHARACTER_LENGTH(c.CPF_CNPJ) INTO len FROM cliente c WHERE c.ID = id_cliente;
    SELECT c.CONTATO INTO contato FROM cliente c WHERE c.ID = id_cliente;
    IF len > 14 AND contato != NULL OR contato != '' THEN
    BEGIN
		SET retorno = 0;
	END;
    END IF;
    RETURN retorno;
END;
//
DELIMITER ;

SELECT verifica_contato(ID) FROM cliente;
