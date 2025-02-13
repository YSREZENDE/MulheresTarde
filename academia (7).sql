-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/02/2023 às 01:35
-- Versão do servidor: 10.4.24-MariaDB
-- Versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academia`
--
CREATE DATABASE IF NOT EXISTS `academia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `academia`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `cpf` char(14) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `datanascimento` date NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` smallint(6) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`matricula`, `nome`, `telefone`, `sexo`, `cpf`, `rg`, `datanascimento`, `cep`, `numerocasa`, `complemento`, `foto`, `email`, `senha`, `status`) VALUES
(1, 'Maria das Graças da Silva', '(21)99886-1055', 'F', '123456893-10', '12555', '2001-08-01', '23085-610', 31, 'ap 102', 'vazio', 'maria@gmail.com', '$2y$10$im0jB8.c.gP0PaUEdCH3B.4IwD8OqIjfT7Bdocr5AmxfYEYbvIecu', 'A'),
(2, 'Pedro', '(21)99999-1055', 'M', '123456789-10', '00012', '1997-10-20', '26551-090', 100, 'fundos', 'vazio', 'pdro@gmail.com', '123', 'A'),
(3, 'Priscila', '(21)99999-9999', 'F', '111.111.111-11', '6565656', '2000-01-01', '23085-610', 100, 'casa', 'fotos/63d93f20ac9ea.png', 'priscila@gmail.com', '$2y$10$d7UaAkDuNw6klWSujVCABOQdwUe4OKhOCDgh7uUf7T5DZCCnc//Be', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade`
--

CREATE TABLE `atividade` (
  `idatividade` int(11) NOT NULL,
  `nomeatividade` varchar(60) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `atividade`
--

INSERT INTO `atividade` (`idatividade`, `nomeatividade`, `descricao`) VALUES
(1, 'jumpp', 'atividade realizada pulando em um trampolim'),
(2, 'spinning', 'atividade realizada em uma bicicleta com subidas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

CREATE TABLE `aula` (
  `idaula` int(11) NOT NULL,
  `dataaula` date NOT NULL,
  `horario` varchar(30) NOT NULL,
  `idprofessor` int(11) NOT NULL,
  `idatividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `aula`
--

INSERT INTO `aula` (`idaula`, `dataaula`, `horario`, `idprofessor`, `idatividade`) VALUES
(1, '2022-12-05', 'de 15:00 às 15:30h', 1, 1),
(2, '2022-12-09', 'de 08:00 às 9:00h', 1, 2),
(3, '2022-12-06', 'de 07:00 às 08:00h', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `aulaaluno`
--

CREATE TABLE `aulaaluno` (
  `idaulaaluno` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `idaula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `aulaaluno`
--

INSERT INTO `aulaaluno` (`idaulaaluno`, `matricula`, `idaula`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nomecategoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nomecategoria`) VALUES
(1, 'mochila'),
(2, 'roupa'),
(3, 'suplemento'),
(4, 'acessórios');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cpffuncionario` char(14) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `sexo` char(1) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `cep` char(9) NOT NULL,
  `numerocasa` smallint(6) NOT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`cpffuncionario`, `nome`, `telefone`, `sexo`, `rg`, `cep`, `numerocasa`, `complemento`, `foto`, `email`, `senha`) VALUES
('123', 'Mário Silva', '(21)9999-8888', 'M', '0001', '23085-610', 40, 'ap 202', 'vazio', '', ''),
('456', 'Gabriel Silva', '(21)9999-7777', 'M', '0002', '26551-090', 100, 'casa', 'vazio', '', ''),
('789', 'Mariana Souza', '(21)9999-5555', 'F', '1234', '23085-610', 1820, 'casa', 'vazio', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `habilitaprofessor`
--

CREATE TABLE `habilitaprofessor` (
  `idhabilitacao` int(11) NOT NULL,
  `idatividade` int(11) NOT NULL,
  `idprofessor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `habilitaprofessor`
--

INSERT INTO `habilitaprofessor` (`idhabilitacao`, `idatividade`, `idprofessor`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigoproduto` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cor` varchar(30) NOT NULL,
  `valor` double NOT NULL,
  `tamanho` char(2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codigoproduto`, `nome`, `cor`, `valor`, `tamanho`, `quantidade`, `idcategoria`, `foto`) VALUES
(1, 'mochila Paloma', 'rosa', 150, 'un', 20, 1, 'produtos/63daa69add605.jpg'),
(2, 'mochila Raissa', 'azul', 120, 'un', 30, 2, 'produtos/63daa6af278c1.jpg'),
(3, 'mochila amanda', 'preta', 50.85, 'M', 30, 1, 'produtos/63d964567a504.jpg'),
(4, 'mochila agatha', 'azul', 100.6, 'G', 10, 1, 'produtos/63d9649fb4542.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `idprofessor` int(11) NOT NULL,
  `disponibilidade` varchar(40) NOT NULL,
  `cpffuncionario` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`idprofessor`, `disponibilidade`, `cpffuncionario`) VALUES
(1, 'segunda e sexta dia todo', '123'),
(2, 'terca,quarta e quinta dia todo', '456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL,
  `data` date NOT NULL,
  `valor` double NOT NULL,
  `quantidade` int(11) NOT NULL,
  `codigoproduto` int(11) NOT NULL,
  `cpffuncionario` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`idvenda`, `data`, `valor`, `quantidade`, `codigoproduto`, `cpffuncionario`) VALUES
(1, '2022-12-05', 300, 2, 1, '789'),
(2, '2022-12-05', 120, 1, 2, '789');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `cep` (`cep`);

--
-- Índices de tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`idatividade`);

--
-- Índices de tabela `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`idaula`),
  ADD KEY `idprofessor` (`idprofessor`),
  ADD KEY `idatividade` (`idatividade`);

--
-- Índices de tabela `aulaaluno`
--
ALTER TABLE `aulaaluno`
  ADD PRIMARY KEY (`idaulaaluno`),
  ADD KEY `matricula` (`matricula`),
  ADD KEY `idaula` (`idaula`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cpffuncionario`),
  ADD KEY `cep` (`cep`);

--
-- Índices de tabela `habilitaprofessor`
--
ALTER TABLE `habilitaprofessor`
  ADD PRIMARY KEY (`idhabilitacao`),
  ADD KEY `idatividade` (`idatividade`),
  ADD KEY `idprofessor` (`idprofessor`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigoproduto`),
  ADD KEY `fk_categoria` (`idcategoria`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idprofessor`),
  ADD KEY `cpffuncionario` (`cpffuncionario`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`),
  ADD KEY `codigoproduto` (`codigoproduto`),
  ADD KEY `cpffuncionario` (`cpffuncionario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `atividade`
--
ALTER TABLE `atividade`
  MODIFY `idatividade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `aula`
--
ALTER TABLE `aula`
  MODIFY `idaula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `aulaaluno`
--
ALTER TABLE `aulaaluno`
  MODIFY `idaulaaluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `habilitaprofessor`
--
ALTER TABLE `habilitaprofessor`
  MODIFY `idhabilitacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigoproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idprofessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idvenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`),
  ADD CONSTRAINT `aula_ibfk_2` FOREIGN KEY (`idatividade`) REFERENCES `atividade` (`idatividade`);

--
-- Restrições para tabelas `aulaaluno`
--
ALTER TABLE `aulaaluno`
  ADD CONSTRAINT `aulaaluno_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `aluno` (`matricula`),
  ADD CONSTRAINT `aulaaluno_ibfk_2` FOREIGN KEY (`idaula`) REFERENCES `aula` (`idaula`);

--
-- Restrições para tabelas `habilitaprofessor`
--
ALTER TABLE `habilitaprofessor`
  ADD CONSTRAINT `habilitaprofessor_ibfk_1` FOREIGN KEY (`idatividade`) REFERENCES `atividade` (`idatividade`),
  ADD CONSTRAINT `habilitaprofessor_ibfk_2` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprofessor`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Restrições para tabelas `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`cpffuncionario`) REFERENCES `funcionario` (`cpffuncionario`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codigoproduto`) REFERENCES `produto` (`codigoproduto`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`cpffuncionario`) REFERENCES `funcionario` (`cpffuncionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
