-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/02/2025 às 19:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbbikeshop`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id_cargos` int(11) NOT NULL,
  `funcao` varchar(30) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `descricao_cargos` text NOT NULL,
  `beneficios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(30) NOT NULL,
  `descricao_categoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(50) NOT NULL,
  `cpf_cliente` varchar(15) NOT NULL,
  `data_nascimento_cliente` date NOT NULL,
  `data_cadastro` date NOT NULL DEFAULT current_timestamp(),
  `contato` int(11) NOT NULL,
  `endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `id_contato` int(11) NOT NULL,
  `telefone_residencial` varchar(15) DEFAULT NULL,
  `telefone_comercial` varchar(15) DEFAULT NULL,
  `telefone_celular` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `tipo_logradouro` enum('Rua','Avenida','Alameda','Travessa','Viela','Rodovia') DEFAULT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `data_aquisicao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `cnpj` varchar(16) NOT NULL,
  `contato` int(11) NOT NULL,
  `endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionarios` int(11) NOT NULL,
  `nome_funcionario` varchar(100) NOT NULL,
  `cpf_funcionario` varchar(15) NOT NULL,
  `data_nascimento_funcionario` date NOT NULL,
  `horaio_expediente` varchar(20) NOT NULL,
  `contato` int(11) NOT NULL,
  `endereco` int(11) NOT NULL,
  `cargos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_venda`
--

CREATE TABLE `itens_venda` (
  `id_produto` int(11) NOT NULL,
  `venda` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade_vendida` int(11) NOT NULL,
  `total` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `nome_modelo` varchar(30) NOT NULL,
  `descricao_modelo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `venda` int(11) NOT NULL,
  `forma_pagamento` varchar(20) DEFAULT NULL,
  `valor_pagar` decimal(6,2) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `valor_parcela` decimal(6,2) NOT NULL,
  `troco` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `modelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id_cargos`),
  ADD UNIQUE KEY `funcao` (`funcao`),
  ADD UNIQUE KEY `descricao_cargos` (`descricao_cargos`) USING HASH;

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria` (`nome_categoria`),
  ADD UNIQUE KEY `descricao_categoria` (`descricao_categoria`) USING HASH;

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD UNIQUE KEY `cpf_cliente` (`cpf_cliente`),
  ADD KEY `fk_cliente_pk_endereco` (`endereco`),
  ADD KEY `fk_cliente_pk_contato` (`contato`);

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_contato`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `fk_estoque_pk_produto` (`produto`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `razao_social` (`razao_social`),
  ADD UNIQUE KEY `cnpj` (`cnpj`),
  ADD KEY `fk_fornecedor_pk_endereco` (`endereco`),
  ADD KEY `fk_fornecedor_pk_contato` (`contato`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionarios`),
  ADD UNIQUE KEY `cpf_funcionario` (`cpf_funcionario`),
  ADD KEY `fk_funcionario_pk_endereco` (`endereco`),
  ADD KEY `fk_funcionario_pk_contato` (`contato`),
  ADD KEY `fk_funcionario_pk_cargos` (`cargos`);

--
-- Índices de tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_itens_venda_pk_produto` (`produto`),
  ADD KEY `fk_itens_venda_pk_venda` (`venda`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD UNIQUE KEY `nome_modelo` (`nome_modelo`),
  ADD UNIQUE KEY `descricao_modelo` (`descricao_modelo`) USING HASH;

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `fk_pagamento_pk_venda` (`venda`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_produto_pk_fornecedor` (`fornecedor`),
  ADD KEY `fk_produto_pk_categoria` (`categoria`),
  ADD KEY `fk_produto_pk_modelo` (`modelo`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_venda_pk_funcionario` (`funcionario`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_pk_contato` FOREIGN KEY (`contato`) REFERENCES `contato` (`id_contato`),
  ADD CONSTRAINT `fk_cliente_pk_endereco` FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_pk_produto` FOREIGN KEY (`produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fk_fornecedor_pk_contato` FOREIGN KEY (`contato`) REFERENCES `contato` (`id_contato`),
  ADD CONSTRAINT `fk_fornecedor_pk_endereco` FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_pk_cargos` FOREIGN KEY (`cargos`) REFERENCES `cargos` (`id_cargos`),
  ADD CONSTRAINT `fk_funcionario_pk_contato` FOREIGN KEY (`contato`) REFERENCES `contato` (`id_contato`),
  ADD CONSTRAINT `fk_funcionario_pk_endereco` FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD CONSTRAINT `fk_itens_venda_pk_produto` FOREIGN KEY (`produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `fk_itens_venda_pk_venda` FOREIGN KEY (`venda`) REFERENCES `venda` (`id_venda`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_pk_venda` FOREIGN KEY (`venda`) REFERENCES `venda` (`id_venda`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_pk_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_produto_pk_fornecedor` FOREIGN KEY (`fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  ADD CONSTRAINT `fk_produto_pk_modelo` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id_modelo`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_pk_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`id_funcionarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
