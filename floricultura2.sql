CREATE SCHEMA FLORICULTURA2;

USE FLORICULTURA2;

CREATE TABLE ENDERECO
(
	ID_ENDERECO INT NOT NULL PRIMARY KEY,
    CEP CHAR(8) NOT NULL,
    LOGRADOURO VARCHAR(45) NOT NULL,
    BAIRRO VARCHAR(45) NOT NULL,
    CIDADE VARCHAR(45) NOT NULL,
    ESTADO VARCHAR(45) NOT NULL
);

CREATE TABLE CLIENTE
(
	CPF CHAR(11) NOT NULL PRIMARY KEY,
    NOME VARCHAR(45) NOT NULL,
    EMAIL VARCHAR(45) NOT NULL,
    ID_ENDERECO INT,
    FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO)
);

CREATE TABLE TELEFONE
(
	ID_TELEFONE INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DDD CHAR(3) NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    DESCRICAO VARCHAR(45) NOT NULL,
    CPF CHAR(11),
    FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF)
);

CREATE TABLE PRODUTO
(
	ID_PRODUTO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(45) NOT NULL,
    TIPO VARCHAR(45) NOT NULL,
    PRECO_UNITARIO DECIMAL(6,2)  NOT NULL,
    QTD INT NOT NULL
);

CREATE TABLE ENCOMENDA
(
	ID_ENCOMENDA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DATA_ENCOMENDA DATETIME NOT NULL,
    STATUS_ENCOMENDA VARCHAR(45) NOT NULL,
    CPF CHAR(11),
    ID_ENDERECO INT,
    FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF),
    FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO(ID_ENDERECO)
);

CREATE TABLE COMANDA
(
	ID_COMANDA INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    QTD_PRODUTO INT NOT NULL,
    PRECO_PRODUTO DECIMAL(6,2) NOT NULL,
    ID_ENCOMENDA INT,
    ID_PRODUTO INT,
    FOREIGN KEY (ID_ENCOMENDA) REFERENCES ENCOMENDA(ID_ENCOMENDA),
    FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
);
INSERT INTO ENDERECO (ID_ENDERECO, CEP, LOGRADOURO, BAIRRO, CIDADE, ESTADO) VALUES
(1, '01001000', 'Rua das Flores', 'Centro', 'São Paulo', 'SP'),
(2, '22041001', 'Avenida Brasil', 'Copacabana', 'Rio de Janeiro', 'RJ'),
(3, '30140071', 'Rua da Bahia', 'Funcionários', 'Belo Horizonte', 'MG'),
(4, '80010000', 'Rua XV de Novembro', 'Centro', 'Curitiba', 'PR'),
(5, '40020000', 'Avenida Sete', 'Campo Grande', 'Salvador', 'BA'),
(6, '50030000', 'Rua do Sol', 'Boa Vista', 'Recife', 'PE'),
(7, '60025000', 'Avenida Beira Mar', 'Meireles', 'Fortaleza', 'CE'),
(8, '69005000', 'Rua Amazonas', 'Centro', 'Manaus', 'AM'),
(9, '70040900', 'SQS 108', 'Asa Sul', 'Brasília', 'DF'),
(10, '88010000', 'Rua Felipe Schmidt', 'Centro', 'Florianópolis', 'SC'),
(11, '64000000', 'Rua das Acácias', 'Jóquei', 'Teresina', 'PI'),
(12, '57000000', 'Rua do Comércio', 'Farol', 'Maceió', 'AL'),
(13, '66000000', 'Travessa Padre Eutíquio', 'Batista Campos', 'Belém', 'PA'),
(14, '59000000', 'Avenida Hermes da Fonseca', 'Tirol', 'Natal', 'RN'),
(15, '58000000', 'Rua das Palmeiras', 'Manaíra', 'João Pessoa', 'PB'),
(16, '77000000', 'Quadra 104 Norte', 'Plano Diretor Norte', 'Palmas', 'TO'),
(17, '76800000', 'Rua Rio Madeira', 'Centro', 'Porto Velho', 'RO'),
(18, '69900000', 'Rua Acre', 'Bosque', 'Rio Branco', 'AC'),
(19, '68900000', 'Avenida FAB', 'Central', 'Macapá', 'AP'),
(20, '65000000', 'Rua Grande', 'Centro', 'São Luís', 'MA');

INSERT INTO CLIENTE (CPF, NOME, EMAIL, ID_ENDERECO) VALUES
('11111111111', 'Ana Souza', 'ana@gmail.com', 1),
('22222222222', 'Carlos Lima', 'carlos@gmail.com', 2),
('33333333333', 'Marina Alves', 'marina@gmail.com', 3),
('44444444444', 'João Pedro', 'joao@gmail.com', 4),
('55555555555', 'Fernanda Costa', 'fernanda@gmail.com', 5),
('66666666666', 'Lucas Rocha', 'lucas@gmail.com', 6),
('77777777777', 'Patricia Gomes', 'patricia@gmail.com', 7),
('88888888888', 'Ricardo Mendes', 'ricardo@gmail.com', 8),
('99999999999', 'Juliana Martins', 'juliana@gmail.com', 9),
('10101010101', 'Bruno Silva', 'bruno@gmail.com', 10),
('12121212121', 'Camila Ferreira', 'camila@gmail.com', 11),
('13131313131', 'Eduardo Santos', 'eduardo@gmail.com', 12),
('14141414141', 'Larissa Melo', 'larissa@gmail.com', 13),
('15151515151', 'Thiago Ribeiro', 'thiago@gmail.com', 14),
('16161616161', 'Aline Barbosa', 'aline@gmail.com', 15),
('17171717171', 'Gabriel Oliveira', 'gabriel@gmail.com', 16),
('18181818181', 'Vanessa Cruz', 'vanessa@gmail.com', 17),
('19191919191', 'Felipe Castro', 'felipe@gmail.com', 18),
('20202020202', 'Renata Dias', 'renata@gmail.com', 19),
('21212121212', 'Diego Ramos', 'diego@gmail.com', 20);

INSERT INTO TELEFONE (DDD, NUMERO, DESCRICAO, CPF) VALUES
('011', '999999001', 'Celular', '11111111111'),
('021', '999999002', 'Residencial', '22222222222'),
('031', '999999003', 'Comercial', '33333333333'),
('041', '999999004', 'Celular', '44444444444'),
('071', '999999005', 'Residencial', '55555555555'),
('081', '999999006', 'Comercial', '66666666666'),
('085', '999999007', 'Celular', '77777777777'),
('092', '999999008', 'Residencial', '88888888888'),
('061', '999999009', 'Comercial', '99999999999'),
('048', '999999010', 'Celular', '10101010101'),
('086', '999999011', 'Residencial', '12121212121'),
('082', '999999012', 'Comercial', '13131313131'),
('091', '999999013', 'Celular', '14141414141'),
('084', '999999014', 'Residencial', '15151515151'),
('083', '999999015', 'Comercial', '16161616161'),
('063', '999999016', 'Celular', '17171717171'),
('069', '999999017', 'Residencial', '18181818181'),
('068', '999999018', 'Comercial', '19191919191'),
('096', '999999019', 'Celular', '20202020202'),
('098', '999999020', 'Residencial', '21212121212');

INSERT INTO PRODUTO (NOME, TIPO, PRECO_UNITARIO, QTD) VALUES
('Rosa Vermelha', 'Flor', 12.50, 100),
('Orquídea Branca', 'Flor', 45.00, 50),
('Girassol', 'Flor', 10.00, 80),
('Lírio', 'Flor', 18.90, 60),
('Tulipa', 'Flor', 22.50, 40),
('Buquê Primavera', 'Arranjo', 75.00, 20),
('Cesta Romântica', 'Presente', 120.00, 15),
('Vaso Decorado', 'Acessório', 35.00, 30),
('Margarida', 'Flor', 8.50, 90),
('Bonsai', 'Planta', 95.00, 10),
('Suculenta', 'Planta', 15.00, 70),
('Azaleia', 'Flor', 25.00, 25),
('Cravo', 'Flor', 9.90, 85),
('Jasmim', 'Flor', 14.50, 55),
('Coroa de Flores', 'Arranjo', 250.00, 5),
('Lavanda', 'Planta', 19.90, 45),
('Hortênsia', 'Flor', 28.00, 35),
('Buquê Luxo', 'Arranjo', 150.00, 12),
('Samambaia', 'Planta', 32.00, 18),
('Kit Jardinagem', 'Acessório', 60.00, 22);

INSERT INTO ENCOMENDA (DATA_ENCOMENDA, STATUS_ENCOMENDA, CPF, ID_ENDERECO) VALUES
('2026-01-10 10:00:00', 'Entregue', '11111111111', 1),
('2026-01-11 11:00:00', 'Pendente', '22222222222', 2),
('2026-01-12 12:00:00', 'Cancelada', '33333333333', 3),
('2026-01-13 13:00:00', 'Entregue', '44444444444', 4),
('2026-01-14 14:00:00', 'Em preparo', '55555555555', 5),
('2026-01-15 15:00:00', 'Pendente', '66666666666', 6),
('2026-01-16 16:00:00', 'Entregue', '77777777777', 7),
('2026-01-17 17:00:00', 'Em rota', '88888888888', 8),
('2026-01-18 18:00:00', 'Entregue', '99999999999', 9),
('2026-01-19 19:00:00', 'Pendente', '10101010101', 10),
('2026-01-20 20:00:00', 'Em preparo', '12121212121', 11),
('2026-01-21 09:00:00', 'Entregue', '13131313131', 12),
('2026-01-22 10:30:00', 'Cancelada', '14141414141', 13),
('2026-01-23 11:45:00', 'Entregue', '15151515151', 14),
('2026-01-24 12:15:00', 'Em rota', '16161616161', 15),
('2026-01-25 13:20:00', 'Pendente', '17171717171', 16),
('2026-01-26 14:10:00', 'Entregue', '18181818181', 17),
('2026-01-27 15:35:00', 'Em preparo', '19191919191', 18),
('2026-01-28 16:50:00', 'Entregue', '20202020202', 19),
('2026-01-29 17:25:00', 'Pendente', '21212121212', 20);

INSERT INTO COMANDA (QTD_PRODUTO, PRECO_PRODUTO, ID_ENCOMENDA, ID_PRODUTO) VALUES
(2, 25.00, 1, 1),
(1, 45.00, 2, 2),
(3, 30.00, 3, 3),
(2, 37.80, 4, 4),
(1, 22.50, 5, 5),
(1, 75.00, 6, 6),
(1, 120.00, 7, 7),
(2, 70.00, 8, 8),
(5, 42.50, 9, 9),
(1, 95.00, 10, 10),
(4, 60.00, 11, 11),
(2, 50.00, 12, 12),
(3, 29.70, 13, 13),
(2, 29.00, 14, 14),
(1, 250.00, 15, 15),
(2, 39.80, 16, 16),
(1, 28.00, 17, 17),
(1, 150.00, 18, 18),
(2, 64.00, 19, 19),
(1, 60.00, 20, 20);

with preco_max(valor)as(select max(preco_unitario)from produto)
select nome,tipo,preco_unitario from produto,preco_max where produto.preco_unitario=preco_max.valor;

with total_preco(tipo,valor)as 
(select tipo, sum(preco_unitario)from produto group by tipo),
total_media_preco(valor) as
(select avg(valor)from total_preco)
select total_preco.tipo, total_preco.valor
from total_preco, total_media_preco
where total_preco.valor<=total_media_preco.valor;

select nome, 
(select count(*) from telefone where telefone.cpf=cliente.cpf)
as qtd_telefone
from cliente;
select nome, numero
from cliente natural join telefone;

insert into produto(nome,tipo,preco_unitario,qtd)
select 'cesta simples','presente',
(select sum  (valor)from(select avg(preco_unitario) from produto group by tipo) as media(valor));