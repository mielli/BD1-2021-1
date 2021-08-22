-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ModeloRelacional
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMINISTRA`
--

DROP TABLE IF EXISTS `ADMINISTRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMINISTRA` (
  `Agencia` int NOT NULL,
  `Conta` int NOT NULL,
  PRIMARY KEY (`Agencia`,`Conta`),
  KEY `Conta` (`Conta`),
  CONSTRAINT `ADMINISTRA_ibfk_1` FOREIGN KEY (`Agencia`) REFERENCES `Agencia` (`Num_Agencia`),
  CONSTRAINT `ADMINISTRA_ibfk_2` FOREIGN KEY (`Conta`) REFERENCES `Conta` (`Num_Conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Agencia`
--

DROP TABLE IF EXISTS `Agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agencia` (
  `Nome` varchar(100) DEFAULT NULL,
  `Num_Agencia` int NOT NULL,
  `Telefone` int DEFAULT NULL,
  `Cpf_Gerente` int DEFAULT NULL,
  `Logradouro` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  `Cep` int DEFAULT NULL,
  PRIMARY KEY (`Num_Agencia`),
  KEY `Nome` (`Nome`),
  CONSTRAINT `Agencia_ibfk_1` FOREIGN KEY (`Nome`) REFERENCES `Banco` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Agencia_TEM_CaixaEletronico`
--

DROP TABLE IF EXISTS `Agencia_TEM_CaixaEletronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Agencia_TEM_CaixaEletronico` (
  `Num_Terminal` int NOT NULL,
  `Num_Agencia` int NOT NULL,
  PRIMARY KEY (`Num_Terminal`,`Num_Agencia`),
  KEY `Num_Agencia` (`Num_Agencia`),
  CONSTRAINT `Agencia_TEM_CaixaEletronico_ibfk_1` FOREIGN KEY (`Num_Terminal`) REFERENCES `CaixaEletronico` (`Num_terminal`),
  CONSTRAINT `Agencia_TEM_CaixaEletronico_ibfk_2` FOREIGN KEY (`Num_Agencia`) REFERENCES `Agencia` (`Num_Agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Banco`
--

DROP TABLE IF EXISTS `Banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Banco` (
  `Nome` varchar(100) NOT NULL,
  `DataFundacao` date DEFAULT NULL,
  `Logradouro` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  `Cep` int DEFAULT NULL,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CaixaEletronico`
--

DROP TABLE IF EXISTS `CaixaEletronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CaixaEletronico` (
  `Num_Agencia` int DEFAULT NULL,
  `Num_terminal` int NOT NULL,
  `Func_Resp` varchar(50) DEFAULT NULL,
  `Num_Modelo` int DEFAULT NULL,
  PRIMARY KEY (`Num_terminal`),
  KEY `Num_Agencia` (`Num_Agencia`),
  CONSTRAINT `CaixaEletronico_ibfk_1` FOREIGN KEY (`Num_Agencia`) REFERENCES `Agencia` (`Num_Agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `IdCliente` int NOT NULL,
  `Telefone` int DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Logradouro` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  `Cep` int DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Conta`
--

DROP TABLE IF EXISTS `Conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conta` (
  `Num_Conta` int NOT NULL,
  `Salario` float DEFAULT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `CPF` int NOT NULL,
  `Num_Agencia` int DEFAULT NULL,
  PRIMARY KEY (`Num_Conta`,`CPF`),
  KEY `fk_Conta_1_idx` (`Num_Agencia`),
  CONSTRAINT `fk_Conta_1` FOREIGN KEY (`Num_Agencia`) REFERENCES `Agencia` (`Num_Agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContaCorrente`
--

DROP TABLE IF EXISTS `ContaCorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContaCorrente` (
  `Num_Conta` int NOT NULL,
  `LimChequeEspecial` float DEFAULT NULL,
  `Tarifa` float DEFAULT NULL,
  PRIMARY KEY (`Num_Conta`),
  CONSTRAINT `ContaCorrente_ibfk_1` FOREIGN KEY (`Num_Conta`) REFERENCES `Conta` (`Num_Conta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContaPoupanca`
--

DROP TABLE IF EXISTS `ContaPoupanca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContaPoupanca` (
  `Num_Conta` int NOT NULL,
  `TaxaJuros` float DEFAULT NULL,
  PRIMARY KEY (`Num_Conta`),
  CONSTRAINT `ContaPoupanca_ibfk_1` FOREIGN KEY (`Num_Conta`) REFERENCES `Conta` (`Num_Conta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Conta_TEM_Cliente`
--

DROP TABLE IF EXISTS `Conta_TEM_Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conta_TEM_Cliente` (
  `Num_Conta` int NOT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`Num_Conta`,`IdCliente`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `Conta_TEM_Cliente_ibfk_1` FOREIGN KEY (`Num_Conta`) REFERENCES `Conta` (`Num_Conta`),
  CONSTRAINT `Conta_TEM_Cliente_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPREGA`
--

DROP TABLE IF EXISTS `EMPREGA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPREGA` (
  `Num_Agencia` int NOT NULL,
  `CPF_Funcionario` int NOT NULL,
  PRIMARY KEY (`Num_Agencia`,`CPF_Funcionario`),
  KEY `CPF_Funcionario` (`CPF_Funcionario`),
  CONSTRAINT `EMPREGA_ibfk_1` FOREIGN KEY (`Num_Agencia`) REFERENCES `Conta` (`Num_Agencia`),
  CONSTRAINT `EMPREGA_ibfk_2` FOREIGN KEY (`CPF_Funcionario`) REFERENCES `Funcionario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPRESTIMO`
--

DROP TABLE IF EXISTS `EMPRESTIMO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPRESTIMO` (
  `Num_Contrato` int DEFAULT NULL,
  `Id_Emprestimo` int DEFAULT NULL,
  `TaxaJuros` float DEFAULT NULL,
  KEY `Num_Contrato` (`Num_Contrato`),
  CONSTRAINT `EMPRESTIMO_ibfk_1` FOREIGN KEY (`Num_Contrato`) REFERENCES `Servico` (`Num_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Finan_Automovel`
--

DROP TABLE IF EXISTS `Finan_Automovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Finan_Automovel` (
  `Num_Contrato` int DEFAULT NULL,
  `Id_FinanciamentoAutomovel` int DEFAULT NULL,
  `TaxaJuros` float DEFAULT NULL,
  KEY `Num_Contrato` (`Num_Contrato`),
  CONSTRAINT `Finan_Automovel_ibfk_1` FOREIGN KEY (`Num_Contrato`) REFERENCES `Servico` (`Num_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Finan_Imovel`
--

DROP TABLE IF EXISTS `Finan_Imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Finan_Imovel` (
  `Num_Contrato` int DEFAULT NULL,
  `Id_FinanciamentoImovel` int DEFAULT NULL,
  `TaxaJuros` float DEFAULT NULL,
  KEY `Num_Contrato` (`Num_Contrato`),
  CONSTRAINT `Finan_Imovel_ibfk_1` FOREIGN KEY (`Num_Contrato`) REFERENCES `Servico` (`Num_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `CPF` int NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Logradouro` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` char(2) DEFAULT NULL,
  `Cep` int DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  `DataInicio` date DEFAULT NULL,
  `Telefone` int DEFAULT NULL,
  `Num_Agencia` int NOT NULL,
  PRIMARY KEY (`CPF`,`Num_Agencia`),
  KEY `Funcionario_ibfk_1` (`Num_Agencia`),
  CONSTRAINT `Funcionario_ibfk_1` FOREIGN KEY (`Num_Agencia`) REFERENCES `Agencia` (`Num_Agencia`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NEGOCIA`
--

DROP TABLE IF EXISTS `NEGOCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NEGOCIA` (
  `IdCliente` int NOT NULL,
  `CPF_Funcionario` int NOT NULL,
  `Num_Contrato` int NOT NULL,
  PRIMARY KEY (`IdCliente`,`CPF_Funcionario`,`Num_Contrato`),
  KEY `CPF_Funcionario` (`CPF_Funcionario`),
  KEY `Num_Contrato` (`Num_Contrato`),
  CONSTRAINT `NEGOCIA_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`),
  CONSTRAINT `NEGOCIA_ibfk_2` FOREIGN KEY (`CPF_Funcionario`) REFERENCES `Funcionario` (`CPF`),
  CONSTRAINT `NEGOCIA_ibfk_3` FOREIGN KEY (`Num_Contrato`) REFERENCES `Servico` (`Num_Contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `POSSUI`
--

DROP TABLE IF EXISTS `POSSUI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSSUI` (
  `NomeBanco` varchar(50) NOT NULL,
  `Num_Agencia` int NOT NULL,
  PRIMARY KEY (`NomeBanco`,`Num_Agencia`),
  KEY `Num_Agencia` (`Num_Agencia`),
  CONSTRAINT `POSSUI_ibfk_1` FOREIGN KEY (`NomeBanco`) REFERENCES `Banco` (`Nome`),
  CONSTRAINT `POSSUI_ibfk_2` FOREIGN KEY (`Num_Agencia`) REFERENCES `Agencia` (`Num_Agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PessoaFisica`
--

DROP TABLE IF EXISTS `PessoaFisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PessoaFisica` (
  `CPF` int NOT NULL,
  `RG` int DEFAULT NULL,
  `Reservista` int DEFAULT NULL,
  `EstadoCivil` varchar(20) DEFAULT NULL,
  `Profissao` varchar(40) DEFAULT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`CPF`,`IdCliente`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `PessoaFisica_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PessoaJuridica`
--

DROP TABLE IF EXISTS `PessoaJuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PessoaJuridica` (
  `CNPJ` int NOT NULL,
  `NomeFantasia` varchar(40) DEFAULT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`CNPJ`,`IdCliente`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `PessoaJuridica_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `Num_Contrato` int NOT NULL,
  `IdCliente` int DEFAULT NULL,
  `CPF_Funcionario` int DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `DataAquisicao` date DEFAULT NULL,
  `ValorRestante` float DEFAULT NULL,
  PRIMARY KEY (`Num_Contrato`),
  KEY `IdCliente` (`IdCliente`),
  KEY `CPF_Funcionario` (`CPF_Funcionario`),
  CONSTRAINT `Servico_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`),
  CONSTRAINT `Servico_ibfk_2` FOREIGN KEY (`CPF_Funcionario`) REFERENCES `Funcionario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Supervisiona`
--

DROP TABLE IF EXISTS `Supervisiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervisiona` (
  `CPF_Supervisor` int NOT NULL,
  `CPF_Supervisionado` int NOT NULL,
  `Nome_Supervisor` varchar(100) DEFAULT NULL,
  `Nome_Supervisionado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CPF_Supervisor`,`CPF_Supervisionado`),
  KEY `CPF_Supervisionado` (`CPF_Supervisionado`),
  CONSTRAINT `Supervisiona_ibfk_1` FOREIGN KEY (`CPF_Supervisor`) REFERENCES `Funcionario` (`CPF`),
  CONSTRAINT `Supervisiona_ibfk_2` FOREIGN KEY (`CPF_Supervisionado`) REFERENCES `Funcionario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-22 17:52:19
