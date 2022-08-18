CREATE DATABASE  IF NOT EXISTS `eleicao` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eleicao`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eleicao
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidato` (
  `Numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Endereco` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  `Foto` varchar(500) DEFAULT NULL,
  `Idade` int(11) DEFAULT NULL,
  `Partido_Codigo` int(11) NOT NULL,
  `Cargo_Codigo` int(11) NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `fk_Candidato_Partido` (`Partido_Codigo`),
  KEY `fk_Candidato_Cargo1` (`Cargo_Codigo`),
  CONSTRAINT `fk_Candidato_Cargo1` FOREIGN KEY (`Cargo_Codigo`) REFERENCES `cargo` (`Codigo`),
  CONSTRAINT `fk_Candidato_Partido` FOREIGN KEY (`Partido_Codigo`) REFERENCES `partido` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (12,'Ciro Gomes','rua','Ceará','CE','Favor implementar professor',60,12,1),(13,'Fernando Haddad','rua','São Paulo','SP','Favor implementar professor',55,13,1),(15,'Henrique Meirelles','rua','Goiás','GO','Favor implementar professor',73,15,1),(16,'Vera Lúcia','rua','Pernambuco','PE','Favor implementar professor',51,16,1),(17,'Jair Bolsonaro','rua','São Paulo','SP','Favor implementar professor',63,17,1),(18,'Marina Silva','rua','Acre','AC','Favor implementar professor',60,18,1),(19,'Álvaro Dias','rua','Paraná','PR','Favor implementar professor',73,51,1),(27,'José Maria Eymael','rua','Rio Grande do Sul','RS','Favor implementar professor',78,27,1),(30,'João Amoêdo','rua','Rio de Janeiro','RJ','Favor implementar professor',55,30,1),(45,'Geraldo_Alckmin','rua','São Paulo','SP','Favor implementar professor',65,45,1),(50,'Guilherme Boulos','rua','São Paulo','SP','Favor implementar professor',36,50,1),(51,'Cabo Daciolo','rua','Rio de Janeiro','RJ','Favor implementar professor',42,51,1),(54,'João_Goulart_Filho','rua','Rio de Janeiro','RJ','Favor implementar professor',61,54,1);
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Presidente','Federal'),(2,'Senador','Federal'),(3,'Deputado Federal','Federal');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleicao`
--

DROP TABLE IF EXISTS `eleicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleicao` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Turma` varchar(40) DEFAULT NULL,
  `Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_Eleicao_Urna1` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleicao`
--

LOCK TABLES `eleicao` WRITE;
/*!40000 ALTER TABLE `eleicao` DISABLE KEYS */;
INSERT INTO `eleicao` VALUES (1,'2014','2014-10-03','1',1),(2,'Eleições 2014','2014-09-19','1A2',1),(3,'Eleições 2014','2014-09-19','1B2',1);
/*!40000 ALTER TABLE `eleicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleitor`
--

DROP TABLE IF EXISTS `eleitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleitor` (
  `Codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Endereco` varchar(45) DEFAULT NULL,
  `CPF` char(14) DEFAULT NULL,
  `RG` char(15) DEFAULT NULL,
  `Titulo` char(15) DEFAULT NULL,
  `Zona` int(11) DEFAULT NULL,
  `Secao` int(11) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleitor`
--

LOCK TABLES `eleitor` WRITE;
/*!40000 ALTER TABLE `eleitor` DISABLE KEYS */;
INSERT INTO `eleitor` VALUES (10,'farlen','rua ','123465','111','123',10,20);
/*!40000 ALTER TABLE `eleitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(250) DEFAULT NULL,
  `Sigla` char(7) DEFAULT NULL,
  `Presidente` varchar(45) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (12,'Partido Democrático Trabalhista','PDT','',''),(13,'Partido dos Trabalhadores','PT',' ',''),(15,'Movimento Democrático Brasileiro','MDB','',''),(16,'Partido Socialista dos Trabalhadores Unificado','PSTU','',''),(17,'Partido Social Brasileiro','PSL','',''),(18,'Rede Sustentabilidade','REDE','',''),(19,'Podemos','PODE','',''),(27,'Democracia Cristã','DC','',''),(30,'Partido Novo','NOVO','',''),(45,'Partido Social Democrata Brasileiro','PSDB',' ',''),(50,'Partido Socialismo e Liberdade','PSOL',' ',''),(51,'Patriota','PATRI','',''),(54,'Partido Pátria Livre','PPL','',''),(99,'Branco','Branco',' ','');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urna`
--

DROP TABLE IF EXISTS `urna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urna` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Municipio` varchar(45) DEFAULT NULL,
  `Zona` int(11) DEFAULT NULL,
  `Secao` int(11) DEFAULT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urna`
--

LOCK TABLES `urna` WRITE;
/*!40000 ALTER TABLE `urna` DISABLE KEYS */;
INSERT INTO `urna` VALUES (1,'bh',NULL,10),(2,'bh',0,10),(3,'bh',0,10),(4,'bh',0,10),(5,'c08bba7a0c0386f1551e8474d853ecbf',10,10),(6,'c08bba7a0c0386f1551e8474d853ecbf',0,10),(7,'bh',10,20),(8,'bh',10,20),(9,'bh',10,20),(10,'bh',10,20),(11,'bh',10,20),(12,'bh',10,20);
/*!40000 ALTER TABLE `urna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` char(8) NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'FARLEN','farlen','fabd2014','A'),(2,'LUCIANO','luciano','lubd2014','A'),(3,'CLEBER','cleber','clebd214','A'),(4,'JORDAN','jordan','jobd2014','A'),(5,'LEONARDO','Leonardo','lebd2014','A'),(6,'POLIANA','Poliana','pobd2014','A');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voto` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Quantidade` int(11) unsigned DEFAULT NULL,
  `Eleicao_Codigo` int(11) unsigned NOT NULL,
  `Cargo_Codigo` int(11) unsigned NOT NULL,
  `Eleitor_Codigo` varchar(45) NOT NULL,
  `turma` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto`
--

LOCK TABLES `voto` WRITE;
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
INSERT INTO `voto` VALUES (4,1,1,45,'202cb962ac59075b964b07152d234b70','1A2'),(5,1,1,13,'250cf8b51c773f3f8dc8b4be867a9a02','1B2'),(6,1,1,13,'27dd9142eb72de6143d49d0af040c5da','1B2'),(7,1,1,13,'e02f052b7d3db73f99d4f5801f2b6fff','1B2');
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eleicao'
--

--
-- Dumping routines for database 'eleicao'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07 12:13:08