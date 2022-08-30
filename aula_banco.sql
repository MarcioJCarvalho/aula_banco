-- -----------------------------------------------------
-- Deleta o banco inteiro 
-- Modo de desenvolvimento
-- -----------------------------------------------------
DROP DATABASE IF EXISTS so_manager;


-- -----------------------------------------------------
-- Criação e utilização do banco de dados
-- -----------------------------------------------------
CREATE DATABASE so_manager;
USE so_manager;

-- -----------------------------------------------------
-- Criação da tabela estado
-- -----------------------------------------------------
CREATE TABLE estado(
  id INT NOT NULL AUTO_INCREMENT
  ,nome VARCHAR(200) NOT NULL UNIQUE
  ,sigla CHAR(2) NOT NULL UNIQUE
  ,CONSTRAINT pk_estado PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Inserindo estados
-- -----------------------------------------------------
INSERT INTO estado (nome, sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome, sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO','MT');
INSERT INTO estado (nome, sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado (nome, sigla) VALUES ('RIO GRANDE DO SUL','RS');
INSERT INTO estado (nome, sigla) VALUES ('ACRE','AC');
INSERT INTO estado (nome, sigla) VALUES ('TOCANTINS','TO');
INSERT INTO estado (nome, sigla) VALUES ('ALAGOAS','AL');
INSERT INTO estado (nome, sigla) VALUES ('SERGIPE','SE');
INSERT INTO estado (nome, sigla) VALUES ('PARÁ','PA');
INSERT INTO estado (nome, sigla) VALUES ('RORAIMA','RR');
INSERT INTO estado (nome, sigla) VALUES ('DISTRITO FEDERAL','DF');
INSERT INTO estado (nome, sigla) VALUES ('BAHIA','BA');
INSERT INTO estado (nome, sigla) VALUES ('PIAUÍ','PI');
INSERT INTO estado (nome, sigla) VALUES ('ESPÍRITO SANTO','ES');
INSERT INTO estado (nome, sigla) VALUES ('RIO DE JANEIRO','RJ');
INSERT INTO estado (nome, sigla) VALUES ('MARANHÃO','MA');
INSERT INTO estado (nome, sigla) VALUES ('CEARÁ','CE');
INSERT INTO estado (nome, sigla) VALUES ('RIO GRANDE DO NORTE','RN');
INSERT INTO estado (nome, sigla) VALUES ('GOIÁS','GO');
INSERT INTO estado (nome, sigla) VALUES ('AMAZONAS','AM');
INSERT INTO estado (nome, sigla) VALUES ('MINAS GERAIS','MG');
INSERT INTO estado (nome, sigla) VALUES ('PERNANBUCO','PE');
INSERT INTO estado (nome, sigla) VALUES ('PARAÍBA','PB');
INSERT INTO estado (nome, sigla) VALUES ('RONDÔNIA','RO');
INSERT INTO estado (nome, sigla) VALUES ('AMAPÁ','AP');
INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO DO SUL','MS');


-- -----------------------------------------------------
-- Criação da tabela cidade
-- -----------------------------------------------------
CREATE TABLE cidade(
  id INT NOT NULL AUTO_INCREMENT
  ,nome VARCHAR(200) NOT NULL
  ,estado_id INT NOT NULL
  ,CONSTRAINT pk_cidade PRIMARY KEY (id)
  ,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado(id)
  ,CONSTRAINT cidade_unica UNIQUE(nome, estado_id) -- garante que não teremos 2 cidades com mesmo nome e estado.
);


-- -----------------------------------------------------
-- Inserindo cidades
-- -----------------------------------------------------
INSERT INTO cidade (nome, estado_id) VALUES ('ERECHIM',5);
INSERT INTO cidade (nome, estado_id) VALUES ('PALMAS',7);
INSERT INTO cidade (nome, estado_id) VALUES ('PARNAMIRIM',19);
INSERT INTO cidade (nome, estado_id) VALUES ('PLAMAS',7);
INSERT INTO cidade (nome, estado_id) VALUES ('CUIBÁ',3);
INSERT INTO cidade (nome, estado_id) VALUES ('BOA VISTA',11);
INSERT INTO cidade (nome, estado_id) VALUES ('ITABUNA',13);
INSERT INTO cidade (nome, estado_id) VALUES ('ABREU DE LIMA',23);
INSERT INTO cidade (nome, estado_id) VALUES ('PONTA PORÃ',27);
INSERT INTO cidade (nome, estado_id) VALUES ('NATAL',19);
INSERT INTO cidade (nome, estado_id) VALUES ('JOINVILLE',4);
INSERT INTO cidade (nome, estado_id) VALUES ('RIO VERDE',20);
INSERT INTO cidade (nome, estado_id) VALUES ('VITÓRIA',15);


-- -----------------------------------------------------
-- Criação da tabela bairro
-- -----------------------------------------------------
CREATE TABLE bairro(
	id INT NOT NULL AUTO_INCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,CONSTRAINT pk_bairro PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- inserindo bairros
-- -----------------------------------------------------
INSERT INTO bairro (nome) VALUE ('CRISTO REI');
INSERT INTO bairro (nome) VALUE ('DISTRITO INDUSTRIAL DE TAQUARALTO');
INSERT INTO bairro (nome) VALUE ('SANTA TEREZA');
INSERT INTO bairro (nome) VALUE ('GRACIOSA - ORLA 14');
INSERT INTO bairro (nome) VALUE ('CENTRO SUL');
INSERT INTO bairro (nome) VALUE ('ASA BRANCA');
INSERT INTO bairro (nome) VALUE ('TIJUCAL');
INSERT INTO bairro (nome) VALUE ('SÃO PEDRO');
INSERT INTO bairro (nome) VALUE ('PLANALTO');
INSERT INTO bairro (nome) VALUE ('RESIDENCIAL MANOEL PADIAL UREL');
INSERT INTO bairro (nome) VALUE ('LAGOA NOVA');
INSERT INTO bairro (nome) VALUE ('SANTO ANTÔNIO');
INSERT INTO bairro (nome) VALUE ('PARQUE BANDEIRANTE');
INSERT INTO bairro (nome) VALUE ('SANTA TEREZA');


-- -----------------------------------------------------
-- Criação da tabela endereço
-- -----------------------------------------------------
CREATE TABLE endereco(
	id INT NOT NULL AUTO_INCREMENT
    ,logradouro VARCHAR(45) NOT NULL
    ,numero INT NOT NULL
    ,cep CHAR(8) NOT NULL UNIQUE
    ,bairro_id INT NOT NULL
    ,cidade_id INT NOT NULL
    ,CONSTRAINT pk_endereco PRIMARY KEY (id)
    ,CONSTRAINT fk_endereco_bairro FOREIGN KEY (bairro_id) REFERENCES bairro (id)
    ,CONSTRAINT fk_endereco_cidade FOREIGN KEY (cidade_id) REFERENCES cidade (id)
);
-- -----------------------------------------------------
-- inserindo bairros
-- -----------------------------------------------------
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA SÃO JOÃO', 867, '99708444', 1, 1);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA MACAPÁ', 914, '77060828', 2, 2);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA SEBASTIANA CONSTÂNCIA DA SILVA',  577, '59142180', 3, 3);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('QUADRA ORLA 14 ALAMEDA 15', 614, '77026005', 4, 4);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA SÃO JOAQUIM 285', 804, '78020970', 5, 5);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA PREDRO PRAÇA', 200, '69309180', 6, 6);

INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA 126', 409, '78088080', 7, 5);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA CASTRO ALVES', 903,'45606180', 8, 7);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA SESSENTA E UM', 232,'53550811', 9, 8);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA EDEMIR PADIAL JÚNIOR', 496, '79901382', 10, 9);

INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('TRAVESSA SÃO CRISTÓVÃO', 966, '59056295', 11, 10);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA RUBI', '544', '89218050', 12, 11);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA NOVO HORIZONTE', 112,'75905780', 13, 12);
INSERT INTO endereco (logradouro, numero, cep, bairro_id, cidade_id) VALUES ('RUA GUITH MEYER', '839', '29026834', 14, 13);


-- -----------------------------------------------------
-- Criação da tabela cliente
-- -----------------------------------------------------
CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,cpf_cnpj VARCHAR(14) NOT NULL UNIQUE
    ,telefone VARCHAR(14) NOT NULL
    ,endereco_id INT NOT NULL -- rua, avenida, praça, estrada etc...
    ,ativo CHAR(1) NOT NULL DEFAULT 'S'
    ,CONSTRAINT pk_cliente PRIMARY KEY (id)
    ,CONSTRAINT fk_cliente_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (id)
    ,CONSTRAINT cliente_ativo_deve_ser_s_ou_n CHECK (ativo IN ('S', 'N'))
);


-- -----------------------------------------------------
-- Inserindo cliente
-- -----------------------------------------------------
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('VITÓRIA MÁRCIA RAQUEL DA COSTA', '39265546069', '54981946476', 1);
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('CAUÃ IAN APARÍCIO', '29928959110', '63988079218', 2);
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('EVELYN CAROLINA CLÁUDIA DA ROCHA', '98466710400', '84984012578', 3);
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('STEFANY CLÁUDIA ESTER FERREIRA', '77132879731', '63989363330', 4);
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('CLARICE EMILLY LAVÍNIA DA COSTA', '11329092104', '65999359170', 5);
INSERT INTO cliente (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('DAVI FERNANDO ROBERTO DA CONCEIÇÃO', '56973149308', '95999650272', 6);


-- -----------------------------------------------------
-- Criação da tabela atendente
-- -----------------------------------------------------
CREATE TABLE atendente(
	id INT NOT NULL AUTO_INCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,cpf CHAR(11) NOT NULL UNIQUE
    ,telefone VARCHAR(14) NOT NULL
    ,endereco_id INT NOT NULL
    ,ativo CHAR(1) NOT NULL DEFAULT 'S'
    ,CONSTRAINT pk_atendente PRIMARY KEY (id)
    ,CONSTRAINT fk_atendente_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (id)
    ,CONSTRAINT atendente_ativo_deve_ser_s_ou_n CHECK (ativo IN ('S', 'N'))
);


-- -----------------------------------------------------
-- Inserindo atendente
-- -----------------------------------------------------
INSERT INTO atendente (nome, cpf, telefone, endereco_id)
VALUES ('EDUARDO ANTHONY ASSUNÇÃO', '66874759086', '65997386481', 7);
INSERT INTO atendente (nome, cpf, telefone, endereco_id)
VALUES ('VINICIUS EDSON MIGUEL DUARTE', '43490840534', '73983121162', 8);
INSERT INTO atendente (nome, cpf, telefone, endereco_id)
VALUES ('SEBASTIÃO LUCCA DOS SANTOS', '90262820951', '81991219100', 9);
INSERT INTO atendente (nome, cpf, telefone, endereco_id)
VALUES ('SOPHIA NATÁLIA PORTO', '00911478086', '67994117773', 10);


-- -----------------------------------------------------
-- Criação da tabela tecnico
-- -----------------------------------------------------
CREATE TABLE tecnico(
	id INT NOT NULL AUTO_INCREMENT
    	,nome VARCHAR(200) NOT NULL
    	,cpf_cnpj VARCHAR(14) NOT NULL UNIQUE
    	,telefone VARCHAR(14) NOT NULL
    	,endereco_id INT NOT NULL
    	,ativo CHAR(1) NOT NULL DEFAULT 'S'
    	,CONSTRAINT pk_tecnico PRIMARY KEY (id)
    	,CONSTRAINT fk_tecnico_endereco FOREIGN KEY (endereco_id) REFERENCES endereco (id)
    	,CONSTRAINT tecnico_ativo_deve_ser_s_ou_n CHECK (ativo IN ('S', 'N'))
);


-- -----------------------------------------------------
-- Inserindo técnico
-- -----------------------------------------------------
INSERT INTO tecnico (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('AMANDA TÂNIA EMILY DAS NEVES', '06072556507', '84994473489', 11);
INSERT INTO tecnico (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('BIANCA ALESSANDRA VIEIRA', '37520702855', '47982693921', 12);
INSERT INTO tecnico (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('MURILO OTÁVIO ALMADA', '49307865841', '64996867417', 13);
INSERT INTO tecnico (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('MARCOS ENRICO ALMADA', '04519261708', '27993362333', 14);
INSERT INTO tecnico (nome, cpf_cnpj, telefone, endereco_id)
VALUES ('BRENDA CARLA BATISTA', '16305339554', '985522319', 6);


-- -----------------------------------------------------
-- Criação da tabela ocorrencia
-- -----------------------------------------------------
CREATE TABLE ocorrencia(
	id INT NOT NULL AUTO_INCREMENT
    	,nome VARCHAR(200) NOT NULL UNIQUE
    	,descricao VARCHAR(400) NULL
    	,CONSTRAINT pk_ocorrencia PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- nserindo ocorrencias
-- -----------------------------------------------------
INSERT INTO ocorrencia (nome, descricao) VALUES ('LENTIDÃO',NULL);
INSERT INTO ocorrencia (nome, descricao) VALUES ('QUEDAS',NULL);
INSERT INTO ocorrencia (nome, descricao) VALUES ('NÃO CONECTADO',NULL);
INSERT INTO ocorrencia (nome, descricao) VALUES ('ROMPIMENTO DO CABO ÓPTICO',NULL);
INSERT INTO ocorrencia (nome, descricao) VALUES ('EQUIPAMENTO NÃO LIGA',NULL);


-- -----------------------------------------------------
-- Criação da tabela os
-- -----------------------------------------------------
CREATE TABLE os(
	id INT NOT NULL AUTO_INCREMENT
    ,n_protocolo INT NOT NULL UNIQUE
    ,cliente_id INT NOT NULL
    ,tecnico_id INT NOT NULL
    ,atendente_id INT NOT NULL
	,ocorrencia_id INT NOT NULL
    ,data_atendimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,data_agendamento DATETIME NOT NULL
    ,data_encerramento DATETIME NULL
    ,laudo_tecnico VARCHAR(400) NULL
    ,ativo CHAR(1) NOT NULL DEFAULT 'S'
    ,CONSTRAINT pk_os PRIMARY KEY (id)
    ,CONSTRAINT fk_os_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
    ,CONSTRAINT fk_os_tecnico FOREIGN KEY (tecnico_id) REFERENCES tecnico (id)
    ,CONSTRAINT fk_os_atendente FOREIGN KEY (atendente_id) REFERENCES atendente (id)
    ,CONSTRAINT os_ativo_deve_ser_s_ou_n CHECK (ativo IN('S','N'))
);


-- -----------------------------------------------------
-- Inserindo OS
-- -----------------------------------------------------
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021410, 2, 3, 4, 1, '2022-02-15 15-45');
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021411, 1, 2, 2, 2, '2022-02-15 10-20');
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021412, 3, 1, 3, 4, '2022-02-16 09-40');
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021413, 4, 4, 1, 3, '2022-02-17 16-10');
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021414, 5, 3, 3, 1, '2022-02-17 10-00');
INSERT INTO os(n_protocolo, cliente_id, tecnico_id, atendente_id, ocorrencia_id, data_agendamento)
VALUES (2022021415, 6, 1, 1, 2, '2022-02-18 08-30');


-- -----------------------------------------------------
-- Alterando os para baixa
-- -----------------------------------------------------
UPDATE os 
SET ativo = 'N' , data_encerramento = CURRENT_TIMESTAMP(), laudo_tecnico = 'FOI CONSTATADO QUE NA CASA DO CLIENTE HAVIA MUITAS CONEXÕES EXECEDENDO A BANDA CONTRATADA'
WHERE id = '1';

UPDATE os 
SET ativo = 'N', data_encerramento = CURRENT_TIMESTAMP(), laudo_tecnico = 'HOUVE A TROCA DO EQUIPAMENTO, O MESMO APRESENTAVA FALHAS DE ENERGIA'
WHERE id = '2';


-- -----------------------------------------------------
-- Criação da tabela equipamento
-- -----------------------------------------------------
CREATE TABLE equipamento(
	id INT NOT NULL AUTO_INCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,descricao VARCHAR(400) NULL
	,quantidade INT NOT NULL
    ,unidade_sigla VARCHAR(2) NOT NULL -- UN = unidade, M = metros, CM = centimetros
    ,CONSTRAINT pk_equipamento PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Inserindo equipamento
-- -----------------------------------------------------
INSERT INTO equipamento (nome, descricao, quantidade, unidade_sigla)
VALUES ('ROTEADOR D-LINK AC1200', NULL, 1, 'UN');
INSERT INTO equipamento (nome, descricao, quantidade, unidade_sigla)
VALUES ('PATCH CORD CAT-5', NULL, 1, 'UN');
INSERT INTO equipamento (nome, descricao, quantidade, unidade_sigla)
VALUES ('CABO DROP', NULL, 100, 'M');


-- -----------------------------------------------------
-- Criação da tabela associativa os_equipamento
-- -----------------------------------------------------
CREATE TABLE os_equipamento(
	os_id INT NOT NULL
    ,equipamento_id INT NOT NULL
    ,CONSTRAINT pk_os_equipamento_os_id_equipamento_id PRIMARY KEY (os_id, equipamento_id)
    ,CONSTRAINT fk_os_equipamento_os_id FOREIGN KEY (os_id) REFERENCES os (id)
    ,CONSTRAINT fk_os_equipamento_equipamento_id FOREIGN KEY (equipamento_id) REFERENCES equipamento (id)
);


-- -----------------------------------------------------
-- Associando muitas os para muitos equipamentos
-- -----------------------------------------------------
INSERT INTO os_equipamento (os_id, equipamento_id)
VALUES (2, 2), (2, 1);


-- -----------------------------------------------------
-- Listar todos os clientes
-- -----------------------------------------------------
SELECT 
	clt.nome 'CLIENTE'
    ,clt.cpf_cnpj 'CPF/CNPJ'
    ,clt.telefone 'TELEFONE'
    ,edc.logradouro 'LOGRADOURO'
    ,edc.numero 'NÚMERO'
    ,edc.cep 'CEP'
    ,bro.nome 'BAIRRO'
    ,cdd.nome 'CIDADE'
    ,est.sigla 'UF'
FROM cliente clt
INNER JOIN endereco edc ON clt.endereco_id = edc.id
INNER JOIN bairro bro ON edc.bairro_id = bro.id
INNER JOIN cidade cdd ON edc.cidade_id = cdd.id
INNER JOIN estado est ON cdd.estado_id = est.id
;


-- -----------------------------------------------------
-- Listar todos os técnicos
-- -----------------------------------------------------
SELECT 
	tec.nome 'TÉCNICO'
    ,tec.cpf_cnpj 'CPF/CNPJ'
    ,tec.telefone 'TELEFONE'
    ,edc.logradouro 'LOGRADOURO'
    ,edc.numero 'NÚMERO'
    ,edc.cep 'CEP'
    ,bro.nome 'BAIRRO'
    ,cdd.nome 'CIDADE'
    ,est.sigla 'UF'
FROM tecnico tec
INNER JOIN endereco edc ON tec.endereco_id = edc.id
INNER JOIN bairro bro ON edc.bairro_id = bro.id
INNER JOIN cidade cdd ON edc.cidade_id = cdd.id
INNER JOIN estado est ON cdd.estado_id = est.id
;


-- -----------------------------------------------------
-- Listar todos os atendentes
-- -----------------------------------------------------
SELECT 
	adt.nome 'ATENDENTE'
    ,adt.cpf 'CPF'
    ,adt.telefone 'TELEFONE'
    ,edc.logradouro 'LOGRADOURO'
    ,edc.numero 'NÚMERO'
    ,edc.cep 'CEP'
    ,bro.nome 'BAIRRO'
    ,cdd.nome 'CIDADE'
    ,est.sigla 'UF'
FROM atendente adt
INNER JOIN endereco edc ON adt.endereco_id = edc.id
INNER JOIN bairro bro ON edc.bairro_id = bro.id
INNER JOIN cidade cdd ON edc.cidade_id = cdd.id
INNER JOIN estado est ON cdd.estado_id = est.id
;


-- -----------------------------------------------------
-- Listando OS em aberto
-- -----------------------------------------------------
SELECT
    os.n_protocolo 'Nº PROTOCOLO' 
    ,c.nome 'CLIENTE'
    ,c.telefone 'TELEFONE'
    ,e.logradouro 'LOGRADOURO'
    ,e.numero 'NÚMERO'
    ,b.nome 'BAIRRO'
    ,cid.nome 'CIDADE'
    ,est.sigla 'UF'
    ,o.nome 'OCORRÊNCIA'
    ,DATE_FORMAT(os.data_atendimento, '%d/%m/%Y') 'ABERTURA'
    ,DATE_FORMAT(os.data_agendamento, '%d/%m/%Y') 'AGENDADO'
    ,TIME_FORMAT(os.data_agendamento, '%H:%i') 'HORÁRIO'
    ,t.nome 'TÉCNICO'
    ,a.nome 'ATENDENTE'
FROM os
INNER JOIN cliente c ON os.cliente_id = c.id
INNER JOIN tecnico t ON os.tecnico_id = t.id
INNER JOIN atendente a ON os.atendente_id = a.id
INNER JOIN endereco e ON c.endereco_id = e.id
INNER JOIN cidade cid ON e.cidade_id = cid.id
INNER JOIN bairro b ON e.bairro_id = b.id
INNER JOIN estado est ON cid.estado_id = est.id
INNER JOIN ocorrencia o ON os.ocorrencia_id = o.id
WHERE os.ativo = 'S';


-- -----------------------------------------------------
-- Listando OS dado baixa
-- -----------------------------------------------------
SELECT
    os.n_protocolo 'Nº PROTOCOLO'
    ,c.nome 'CLIENTE'
    ,c.telefone 'TELEFONE'
    ,e.logradouro 'LOGRADOURO'
    ,e.numero 'NÚMERO'
    ,b.nome 'BAIRRO'
    ,cid.nome 'CIDADE'
    ,est.sigla 'UF'
    ,o.nome 'OCORRÊNCIA'
    ,DATE_FORMAT(os.data_atendimento, '%d/%m/%Y') 'ABERTURA'
    ,DATE_FORMAT(os.data_agendamento, '%d/%m/%Y') 'AGENDADO'
    ,TIME_FORMAT(os.data_agendamento, '%H:%i') 'HORÁRIO'
    ,DATE_FORMAT(os.data_encerramento, '%d/%m/%Y') 'ENCERRADO'
    ,TIME_FORMAT(os.data_encerramento, '%H:%i') 'HORÁRIO'
    ,os.laudo_tecnico 'LAUDO TÉCNICO'
    ,(SELECT GROUP_CONCAT(eq.nome SEPARATOR ', ') 
    	FROM equipamento eq 
    	INNER JOIN os_equipamento ose ON ose.os_id = os.id
    	WHERE ose.equipamento_id = eq.id) 'EQUIPAMENTO'
    ,t.nome 'TÉCNICO'
    ,a.nome 'ATENDENTE'
FROM os
INNER JOIN cliente c ON os.cliente_id = c.id
INNER JOIN tecnico t ON os.tecnico_id = t.id
INNER JOIN atendente a ON os.atendente_id = a.id
INNER JOIN endereco e ON c.endereco_id = e.id
INNER JOIN cidade cid ON e.cidade_id = cid.id
INNER JOIN bairro b ON e.bairro_id = b.id
INNER JOIN estado est ON cid.estado_id = est.id
INNER JOIN ocorrencia o ON os.ocorrencia_id = o.id
WHERE os.ativo = 'N';

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Atividades do dia 25/07

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



-- Atividades do dia 22/08

-- -----------------------------------------------------
-- Função que retorna os técnicos da mesma cidade que o 
-- cliente.
-- -----------------------------------------------------
DELIMITER //
CREATE FUNCTION localiza_tecnico(nome_cliente VARCHAR(60))
RETURNS VARCHAR(60) DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(60);
	SELECT GROUP_CONCAT(t.nome  SEPARATOR ' | ') INTO resultado FROM tecnico t 
	JOIN endereco e ON t.endereco_id = e.id
	JOIN cidade t_cid ON t_cid.id = e.cidade_id
	WHERE EXISTS (
		SELECT c_cid.id	
		FROM cliente c
		JOIN endereco e ON c.endereco_id = e.id
		JOIN cidade c_cid ON c_cid.id = e.cidade_id
		WHERE c.nome = UPPER(nome_cliente) 
		AND t_cid.nome = c_cid.nome 
		);
	IF resultado IS NULL THEN
		SET resultado = 'NÃO HÁ TÉCNICOS DA MESMA CIDADE QUE O CLIENTE!';
	ELSE
		SET resultado = concat(resultado);
	END IF;
	RETURN resultado;
END;
//
DELIMITER ;

SELECT localiza_tecnico('DAVI FERNANDO ROBERTO DA CONCEIÇÃO') 'NOME TÉCNICO';

DROP FUNCTION localiza_tecnico;
SELECT c.nome 'CLIENTE', cdd.nome 'CIDADE' FROM cliente c JOIN endereco e ON e.id = c.endereco_id JOIN cidade cdd ON cdd.id = e.cidade_id;
SELECT t.nome 'TÉCNICO', cdd.nome 'CIDADE' FROM tecnico t JOIN endereco e ON e.id = t.endereco_id JOIN cidade cdd ON cdd.id = e.cidade_id;

-- -----------------------------------------------------
-- Função que retorna quntidade de clientes por cidade
-- -----------------------------------------------------
DELIMITER //
CREATE FUNCTION cliente_por_cidade(nome_cidade VARCHAR(60))
RETURNS VARCHAR(60) DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(60);
	SELECT UPPER(c.nome) 'CIDADE',(
			SELECT COUNT(cli.nome)
            FROM cliente cli
            JOIN endereco en ON cli.endereco_id = en.id
            WHERE c.id = en.cidade_id
			GROUP BY c.id
        )'CLIENTE' FROM cidade c;
	RETURN concat(resultado);
END;
//
DELIMITER ;
DROP FUNCTION cliente_por_cidade;
SELECT cliente_por_cidade("boa vista");

SELECT * FROM cidade;
SELECT UPPER(c.nome) 'CIDADE',(
			SELECT COUNT(cli.id)
            FROM cliente cli
            JOIN endereco en ON cli.endereco_id = en.id
            WHERE c.id = en.cidade_id
			GROUP BY c.id
        )'QTD CLIENTES' FROM cidade c;
	
	
	
	criar uma função que valida qua época os equipamentos dão mais defeitos
