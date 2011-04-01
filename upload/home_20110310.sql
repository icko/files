-- phpMyAdmin SQL Dump
-- version 3.3.0
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mar 10, 2011 as 06:52 AM
-- Versão do Servidor: 5.0.51
-- Versão do PHP: 5.2.4-2ubuntu5.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `climo_1`
--
CREATE DATABASE `climo_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `climo_1`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_contato`
--

CREATE TABLE IF NOT EXISTS `cliente_contato` (
  `id` int(11) NOT NULL auto_increment,
  `cliente_id` int(11) default NULL,
  `contato_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cliente_contato`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_followup`
--

CREATE TABLE IF NOT EXISTS `cliente_followup` (
  `id` int(11) NOT NULL auto_increment,
  `cliente_id` int(11) default NULL,
  `followup_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cliente_followup`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_lembrete`
--

CREATE TABLE IF NOT EXISTS `cliente_lembrete` (
  `id` int(11) NOT NULL auto_increment,
  `cliente_id` int(11) default NULL,
  `lembrete_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `cliente_lembrete`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL auto_increment,
  `imovel_id` int(11) default NULL,
  `imovel` varchar(255) default NULL,
  `nome` varchar(255) default NULL,
  `conjuge` varchar(255) default NULL,
  `origem` varchar(100) default NULL,
  `valor` double(16,2) default NULL,
  `obs` text,
  `data_origem` date default NULL,
  `status_id` int(11) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `clientes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_email`
--

CREATE TABLE IF NOT EXISTS `contato_email` (
  `id` int(11) NOT NULL auto_increment,
  `contato_id` int(11) default NULL,
  `email` varchar(255) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `contato_email`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_tel`
--

CREATE TABLE IF NOT EXISTS `contato_tel` (
  `id` int(11) NOT NULL auto_increment,
  `cliente_contato_id` int(11) default NULL,
  `tipo` char(10) default NULL,
  `numero` char(11) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `contato_tel`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  `obs` varchar(255) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `contatos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `followups`
--

CREATE TABLE IF NOT EXISTS `followups` (
  `id` int(11) NOT NULL auto_increment,
  `texto` text,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `followups`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos`
--

CREATE TABLE IF NOT EXISTS `fotos` (
  `id` int(11) NOT NULL auto_increment,
  `path` varchar(255) default NULL,
  `descricao` varchar(255) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `fotos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imoveis`
--

CREATE TABLE IF NOT EXISTS `imoveis` (
  `id` int(11) NOT NULL auto_increment,
  `imovel_transacao_id` int(11) default NULL,
  `imovel_subtipo_id` int(11) default NULL,
  `cep` char(8) default NULL,
  `endereco` varchar(255) default NULL,
  `edificio` varchar(100) default NULL,
  `numero` varchar(20) default NULL,
  `complemento` varchar(100) default NULL,
  `cidade` varchar(100) default NULL,
  `estado` char(2) default NULL,
  `bairro` varchar(100) default NULL,
  `indicador` varchar(100) default NULL,
  `zelador` varchar(100) default NULL,
  `porteiro_manha` varchar(100) default NULL,
  `porteiro_tarde` varchar(100) default NULL,
  `porteiro_noite` varchar(100) default NULL,
  `andar` varchar(100) default NULL,
  `chaves` varchar(100) default NULL,
  `idade` varchar(100) default NULL,
  `area_util` double(16,2) default NULL,
  `area_total` double(16,2) default NULL,
  `terreno_x` double(16,2) default NULL,
  `terreno_y` double(16,2) default NULL,
  `dorms` int(2) default NULL,
  `suites` int(2) default NULL,
  `vagas` int(2) default NULL,
  `valor_venda` double(16,2) default NULL,
  `valor_locacao` double(16,2) default NULL,
  `valor_cond` double(16,2) default NULL,
  `valor_iptu` double(16,2) default NULL,
  `titulo` varchar(255) default NULL,
  `descricao` text,
  `data_captacao` date default NULL,
  `status_id` int(11) default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imoveis`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_features`
--

CREATE TABLE IF NOT EXISTS `imovel_features` (
  `id` int(11) NOT NULL auto_increment,
  `imovel_subtipo_id` int(11) default NULL,
  `descricao` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imovel_features`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_features_imoveis`
--

CREATE TABLE IF NOT EXISTS `imovel_features_imoveis` (
  `id` int(11) NOT NULL auto_increment,
  `imovel_id` int(11) default NULL,
  `imovel_feature_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imovel_features_imoveis`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_subtipo`
--

CREATE TABLE IF NOT EXISTS `imovel_subtipo` (
  `id` int(11) NOT NULL auto_increment,
  `imovel_tipo_id` int(11) default NULL,
  `descricao` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imovel_subtipo`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_tipo`
--

CREATE TABLE IF NOT EXISTS `imovel_tipo` (
  `id` int(11) NOT NULL auto_increment,
  `descricao` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imovel_tipo`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_transacao`
--

CREATE TABLE IF NOT EXISTS `imovel_transacao` (
  `id` int(11) NOT NULL auto_increment,
  `descricao` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `imovel_transacao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `lembretes`
--

CREATE TABLE IF NOT EXISTS `lembretes` (
  `id` int(11) NOT NULL auto_increment,
  `texto` text,
  `data` date default NULL,
  `hora` time default NULL,
  `lembrar` int(2) default NULL,
  `lembrar_tipo` char(10) default NULL,
  `read` int(1) default '0',
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `lembretes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario_contato`
--

CREATE TABLE IF NOT EXISTS `proprietario_contato` (
  `id` int(11) NOT NULL auto_increment,
  `proprietario_id` int(11) default NULL,
  `contato_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `proprietario_contato`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario_followup`
--

CREATE TABLE IF NOT EXISTS `proprietario_followup` (
  `id` int(11) NOT NULL auto_increment,
  `proprietario_id` int(11) default NULL,
  `followup_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `proprietario_followup`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario_lembrete`
--

CREATE TABLE IF NOT EXISTS `proprietario_lembrete` (
  `id` int(11) NOT NULL auto_increment,
  `proprietario_id` int(11) default NULL,
  `lembrete_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `proprietario_lembrete`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietarios`
--

CREATE TABLE IF NOT EXISTS `proprietarios` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  `conjuge` varchar(255) default NULL,
  `obs` text,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` datetime default NULL,
  `user_edit` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `proprietarios`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL auto_increment,
  `descricao` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `roles`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL auto_increment,
  `descricao` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `status`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `status_table`
--

CREATE TABLE IF NOT EXISTS `status_table` (
  `id` int(11) NOT NULL auto_increment,
  `status_id` int(11) default NULL,
  `table_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `status_table`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `nome` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `senha` varchar(128) default NULL,
  `tipo` char(50) default NULL,
  `cpf` char(14) default NULL,
  `creci` varchar(50) default NULL,
  `plano` int(11) default NULL,
  `tel1` char(11) default NULL,
  `tel2` char(11) default NULL,
  `tel3` char(11) default NULL,
  `status_id` int(11) default NULL,
  `role` int(11) default NULL,
  `obs` varchar(255) default NULL,
  `last_login` datetime default NULL,
  `data_cad` datetime default NULL,
  `data_edit` datetime default NULL,
  `user_cad` int(11) default NULL,
  `user_edit` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`email`,`senha`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `usuarios`
--

--
-- Banco de Dados: `teste`
--
CREATE DATABASE `teste` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `teste`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jquerychat`
--

CREATE TABLE IF NOT EXISTS `jquerychat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `from` varchar(255) NOT NULL default '',
  `to` varchar(255) NOT NULL default '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL default '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `jquerychat`
--

INSERT INTO `jquerychat` (`id`, `from`, `to`, `message`, `sent`, `recd`) VALUES
(1, '10055502', '10055482', 'hello', '2010-09-28 15:54:02', 1),
(2, '10055482', '10055502', 'oi', '2010-09-28 15:54:08', 1),
(3, '10055482', '10055502', 'iai', '2010-09-28 15:54:17', 1),
(4, '10055482', '10055502', 'blz??', '2010-09-28 15:54:19', 1),
(5, '10055502', '10055482', 'yehhhhhhhh', '2010-09-28 15:54:25', 1),
(6, '10055482', '10055502', 'oh my', '2010-09-28 15:54:40', 1),
(7, '10055502', '10055482', 'god', '2010-09-28 15:54:46', 1),
(8, '10055482', '10055502', 'good', '2010-09-28 15:55:55', 1),
(9, '10055502', '10055482', 'dog', '2010-09-28 15:56:03', 1),
(10, '10055482', '10055502', 'rsrs', '2010-09-28 15:56:14', 1),
(11, '10055502', '10055482', 'das', '2010-09-28 15:56:23', 1),
(12, '10055482', '10055502', 'oops', '2010-09-28 15:57:02', 1),
(13, '10055502', '10055482', 'q', '2010-09-28 16:16:46', 1),
(14, '10055482', '10055502', 'q oq', '2010-09-28 16:16:50', 1),
(15, '10055502', '10055482', 'q oq oq', '2010-09-28 16:35:59', 1),
(16, '10055482', '10055502', 'hein', '2010-09-28 16:36:02', 1),
(17, '10055482', '10055502', 'onde oq', '2010-09-28 16:36:04', 1),
(18, '10055502', '10055482', '?', '2010-09-28 16:36:06', 1),
(19, '', 'patrick', 'oi', '2010-09-30 15:48:20', 0),
(20, '10055482', '10055483', '?', '2010-09-30 15:48:28', 0),
(21, '', 'patrick', 'ijasodjas', '2010-09-30 15:48:31', 0),
(22, '10055502', 'patrick', '?', '2010-09-30 15:48:44', 0),
(23, '10055482', '10055483', 'eia', '2010-09-30 15:48:47', 0),
(24, '10055502', 'patrick', 'n aparece em nenhum mais', '2010-09-30 15:48:55', 0),
(25, '10055502', 'patrick', 'asjddje890u349034r43', '2010-09-30 15:49:03', 0),
(26, '10055482', '10055483', '//////////', '2010-09-30 15:49:06', 0),
(27, '10055502', '10055482', 'oi', '2010-09-30 15:50:39', 1),
(28, '10055482', '10055502', 'eita', '2010-09-30 15:50:53', 1),
(29, '10055482', '10055502', 'tava aqui nÃ©', '2010-09-30 15:50:57', 1),
(30, '10055482', '10055502', 'ahahauhauhua', '2010-09-30 15:50:59', 1),
(31, '10055502', '10055482', 'carmaba', '2010-09-30 15:51:03', 1),
(32, '10055482', '10055502', 'poxa vida', '2010-09-30 15:51:10', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jquerychat_anunciante`
--

CREATE TABLE IF NOT EXISTS `jquerychat_anunciante` (
  `id` bigint(255) unsigned NOT NULL auto_increment,
  `idPessoa` bigint(255) unsigned default NULL,
  `cdOficial` varchar(45) character set latin1 collate latin1_general_ci default NULL,
  `cdInscricaoEstadual` varchar(20) character set latin1 default NULL,
  `cdInscricaoMunicipal` varchar(20) character set latin1 default NULL,
  `idMunicipio` int(10) unsigned default NULL,
  `idSetor` int(10) unsigned default NULL,
  `nmOficial` varchar(200) default NULL,
  `nmfantasia` varchar(200) default NULL,
  `cnLogradouro` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `cnNumero` varchar(12) character set latin1 collate latin1_general_ci default NULL,
  `cnComplemento` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `cnBairro` varchar(100) character set latin1 collate latin1_general_ci default NULL,
  `cdCep` varchar(12) character set latin1 collate latin1_general_ci default NULL,
  `nmSkype` varchar(200) character set latin1 collate latin1_general_ci default NULL,
  `cnHomePage` varchar(100) character set latin1 collate latin1_general_ci default NULL,
  `cnEmail` varchar(100) character set latin1 collate latin1_general_ci default NULL,
  `cnEmailCotacao` varchar(100) character set latin1 collate latin1_general_ci default NULL,
  `cnTelefone` varchar(45) character set latin1 collate latin1_general_ci default NULL,
  `cnDddTelefone` varchar(6) character set latin1 collate latin1_general_ci default NULL,
  `cnDdiTelefone` varchar(6) character set latin1 collate latin1_general_ci default NULL,
  `cnFax` varchar(45) character set latin1 collate latin1_general_ci default NULL,
  `dtUltimaAtualizacao` datetime default NULL,
  `dtCriacao` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `vbAtualizar` int(11) default NULL,
  `cnDddFax` varchar(6) character set latin1 collate latin1_general_ci default NULL,
  `cnDdiFax` varchar(6) character set latin1 collate latin1_general_ci default NULL,
  `txtProduto` text character set latin1 collate latin1_general_ci,
  `cnUser` varchar(45) character set latin1 collate latin1_general_ci default NULL,
  `cnPws` varchar(45) character set latin1 collate latin1_general_ci default NULL,
  `vbTeste` int(10) unsigned NOT NULL default '0',
  `idtemp` int(10) unsigned default NULL,
  `vbPessoaJuridica` int(10) unsigned default NULL,
  `idOrigem` int(10) unsigned default '6',
  `idRamoAtividade` int(10) unsigned default NULL,
  `nmSlogan` varchar(50) character set latin1 default NULL,
  `vbEstrangeiro` int(10) unsigned NOT NULL default '0',
  `cdAlteracao` int(10) unsigned default NULL,
  `nmAlias` varchar(150) default NULL,
  `vbOcultarEndereco` int(10) unsigned default NULL,
  `online` int(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10055503 ;

--
-- Extraindo dados da tabela `jquerychat_anunciante`
--

INSERT INTO `jquerychat_anunciante` (`id`, `idPessoa`, `cdOficial`, `cdInscricaoEstadual`, `cdInscricaoMunicipal`, `idMunicipio`, `idSetor`, `nmOficial`, `nmfantasia`, `cnLogradouro`, `cnNumero`, `cnComplemento`, `cnBairro`, `cdCep`, `nmSkype`, `cnHomePage`, `cnEmail`, `cnEmailCotacao`, `cnTelefone`, `cnDddTelefone`, `cnDdiTelefone`, `cnFax`, `dtUltimaAtualizacao`, `dtCriacao`, `vbAtualizar`, `cnDddFax`, `cnDdiFax`, `txtProduto`, `cnUser`, `cnPws`, `vbTeste`, `idtemp`, `vbPessoaJuridica`, `idOrigem`, `idRamoAtividade`, `nmSlogan`, `vbEstrangeiro`, `cdAlteracao`, `nmAlias`, `vbOcultarEndereco`, `online`) VALUES
(10055482, 1413, '83.977.623/0001-46', NULL, NULL, 1, 60, 'Golden Teste', 'Golden Teste', 'Avenida Paulista', '303', NULL, 'Centro', '00000-002', NULL, 'goldenteste.br', 'bruno.meneses@goldenlight.biz', NULL, '76269301', '11', '55', '25263315', '2010-09-24 09:28:11', '2010-02-03 17:54:57', NULL, '11', '55', NULL, NULL, NULL, 0, NULL, 1, 6, NULL, '"1001 utilidades"', 0, NULL, 'golden-teste', NULL, 1),
(10055483, 1413, '83.977.623/0001-46', NULL, NULL, 1, 60, 'Golden Teste', 'Golden Teste 2', 'Avenida Paulista', '303', '', 'Centro', '00000-002', NULL, 'goldenteste.br', 'bruno.meneses@goldenlight.biz', NULL, '76269301', '11', '55', '25263315', '2010-09-24 09:28:11', '2010-02-03 17:54:57', NULL, '11', '55', NULL, NULL, NULL, 0, NULL, 1, 6, NULL, '"1001 utilidades"', 0, NULL, 'golden-teste', 0, 1),
(10055502, 1269, '329.028.898-60', NULL, NULL, 1, NULL, 'Edmilson Barbosa da Silva', 'Usuario cliente criado para testar o chat', 'Rua Feitiço da Vila', '301', 'BL 20a ap 34', 'Chacara Santa Maria', '05879-000', NULL, NULL, 'ed1000sons@gmail.com', NULL, '58742851', '11', '55', NULL, '2010-05-12 14:43:57', '2010-02-05 10:40:05', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 6, NULL, NULL, 0, NULL, 'edmilson-barbosa-da-silva20', NULL, 1);
