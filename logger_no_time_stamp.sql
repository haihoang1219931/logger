-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2015 at 06:04 AM
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

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`bot_id`, `os`, `hostname`, `ip`, `first_active_time`, `last_active_time`, `CC`, `Flag`, `status`) VALUES
('8956c8ed7e2818bbae8979b404cd68c6', 'Windows 6.1', 'None', '127.0.0.1', '2015-12-31 09:05:16', '2015-12-31 10:53:22', '', '', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `clilog`
--

CREATE TABLE IF NOT EXISTS `clilog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_id` varchar(32) NOT NULL,
  `command` text NOT NULL,
  `time` datetime DEFAULT NULL,
  `result` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `clilog`
--

INSERT INTO `clilog` (`id`, `bot_id`, `command`, `time`, `result`, `status`) VALUES
(3, '0985083f48279d66f55a7990ed40ed0d', 'ping 192.168.1.19', '2015-12-26 15:30:02', 'Pinging 192.168.1.19 with 32 bytes of data:\nReply from 192.168.1.19: bytes=32 time=71ms TTL=127\nReply from 192.168.1.19: bytes=32 time=8ms TTL=127\nReply from 192.168.1.19: bytes=32 time=3ms TTL=127\nReply from 192.168.1.19: bytes=32 time=6ms TTL=127\nPing statistics for 192.168.1.19:\n	Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),\nApproximate round trip times in milli-seconds:\n	Minimum = 3ms, Maximum = 71ms, Average = 22ms\n', 'done'),
(4, '0985083f48279d66f55a7990ed40ed0d', 'ipconfig', '2015-12-26 17:28:46', '', 'wait'),
(5, '0985083f48279d66f55a7990ed40ed0d', 'ping 192.168.1.19', '2015-12-26 17:43:41', 'Pinging 192.168.1.19 with 32 bytes of data:\r\nReply from 192.168.1.19: bytes=32 time=71ms TTL=127\r\nReply from 192.168.1.19: bytes=32 time=8ms TTL=127\r\nReply from 192.168.1.19: bytes=32 time=3ms TTL=127\r\nReply from 192.168.1.19: bytes=32 time=6ms TTL=127\r\nPing statistics for 192.168.1.19:\r\n	Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),\r\nApproximate round trip times in milli-seconds:\r\n	Minimum = 3ms, Maximum = 71ms, Average = 22ms\r\n', 'done'),
(6, '0985083f48279d66f55a7990ed40ed0d', 'ping 192.168.1.19', '2015-12-26 17:44:40', 'Pinging 192.168.1.19 with 32 bytes of data:\nReply from 192.168.1.19: bytes=32 time=71ms TTL=127\nReply from 192.168.1.19: bytes=32 time=8ms TTL=127\nReply from 192.168.1.19: bytes=32 time=3ms TTL=127\nReply from 192.168.1.19: bytes=32 time=6ms TTL=127\nPing statistics for 192.168.1.19:\n	Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),\nApproximate round trip times in milli-seconds:\n	Minimum = 3ms, Maximum = 71ms, Average = 22ms\n', 'done');

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

--
-- Dumping data for table `cmd`
--

INSERT INTO `cmd` (`bot_id`, `command`, `result`, `status`) VALUES
('0985083f48279d66f55a7990ed40ed0d', 'netstat', '', 'wait');

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

--
-- Dumping data for table `commands`
--

INSERT INTO `commands` (`bot_id`, `cmd_id`, `cmd`, `active`) VALUES
('aaaa', 3, 'pas', 'off'),
('aaaa', 5, 'scr', 'off'),
('ccc34129b9e49a3e21af7392cb76bf6c', 1, 'scr', 'off'),
('ccc34129b9e49a3e21af7392cb76bf6c', 2, 'pas', 'on');

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

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id_countries`, `name`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `currency_code`, `currency_name`, `currrency_symbol`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 'AFN', 'Afghani', '؋', 'AF.png'),
(2, 'Albania', 'AL', 'ALB', 8, 'ALL', 'Lek', 'Lek', 'AL.png'),
(3, 'Algeria', 'DZ', 'DZA', 12, 'DZD', 'Dinar', NULL, 'DZ.png'),
(4, 'American Samoa', 'AS', 'ASM', 16, 'USD', 'Dollar', '$', 'AS.png'),
(5, 'Andorra', 'AD', 'AND', 20, 'EUR', 'Euro', '€', 'AD.png'),
(6, 'Angola', 'AO', 'AGO', 24, 'AOA', 'Kwanza', 'Kz', 'AO.png'),
(7, 'Anguilla', 'AI', 'AIA', 660, 'XCD', 'Dollar', '$', 'AI.png'),
(8, 'Antarctica', 'AQ', 'ATA', 10, '', '', NULL, 'AQ.png'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 28, 'XCD', 'Dollar', '$', 'AG.png'),
(10, 'Argentina', 'AR', 'ARG', 32, 'ARS', 'Peso', '$', 'AR.png'),
(11, 'Armenia', 'AM', 'ARM', 51, 'AMD', 'Dram', NULL, 'AM.png'),
(12, 'Aruba', 'AW', 'ABW', 533, 'AWG', 'Guilder', 'ƒ', 'AW.png'),
(13, 'Australia', 'AU', 'AUS', 36, 'AUD', 'Dollar', '$', 'AU.png'),
(14, 'Austria', 'AT', 'AUT', 40, 'EUR', 'Euro', '€', 'AT.png'),
(15, 'Azerbaijan', 'AZ', 'AZE', 31, 'AZN', 'Manat', 'ман', 'AZ.png'),
(16, 'Bahamas', 'BS', 'BHS', 44, 'BSD', 'Dollar', '$', 'BS.png'),
(17, 'Bahrain', 'BH', 'BHR', 48, 'BHD', 'Dinar', NULL, 'BH.png'),
(18, 'Bangladesh', 'BD', 'BGD', 50, 'BDT', 'Taka', NULL, 'BD.png'),
(19, 'Barbados', 'BB', 'BRB', 52, 'BBD', 'Dollar', '$', 'BB.png'),
(20, 'Belarus', 'BY', 'BLR', 112, 'BYR', 'Ruble', 'p.', 'BY.png'),
(21, 'Belgium', 'BE', 'BEL', 56, 'EUR', 'Euro', '€', 'BE.png'),
(22, 'Belize', 'BZ', 'BLZ', 84, 'BZD', 'Dollar', 'BZ$', 'BZ.png'),
(23, 'Benin', 'BJ', 'BEN', 204, 'XOF', 'Franc', NULL, 'BJ.png'),
(24, 'Bermuda', 'BM', 'BMU', 60, 'BMD', 'Dollar', '$', 'BM.png'),
(25, 'Bhutan', 'BT', 'BTN', 64, 'BTN', 'Ngultrum', NULL, 'BT.png'),
(26, 'Bolivia', 'BO', 'BOL', 68, 'BOB', 'Boliviano', '$b', 'BO.png'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 'BAM', 'Marka', 'KM', 'BA.png'),
(28, 'Botswana', 'BW', 'BWA', 72, 'BWP', 'Pula', 'P', 'BW.png'),
(29, 'Bouvet Island', 'BV', 'BVT', 74, 'NOK', 'Krone', 'kr', 'BV.png'),
(30, 'Brazil', 'BR', 'BRA', 76, 'BRL', 'Real', 'R$', 'BR.png'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 'USD', 'Dollar', '$', 'IO.png'),
(32, 'British Virgin Islands', 'VG', 'VGB', 92, 'USD', 'Dollar', '$', 'VG.png'),
(33, 'Brunei', 'BN', 'BRN', 96, 'BND', 'Dollar', '$', 'BN.png'),
(34, 'Bulgaria', 'BG', 'BGR', 100, 'BGN', 'Lev', 'лв', 'BG.png'),
(35, 'Burkina Faso', 'BF', 'BFA', 854, 'XOF', 'Franc', NULL, 'BF.png'),
(36, 'Burundi', 'BI', 'BDI', 108, 'BIF', 'Franc', NULL, 'BI.png'),
(37, 'Cambodia', 'KH', 'KHM', 116, 'KHR', 'Riels', '៛', 'KH.png'),
(38, 'Cameroon', 'CM', 'CMR', 120, 'XAF', 'Franc', 'FCF', 'CM.png'),
(39, 'Canada', 'CA', 'CAN', 124, 'CAD', 'Dollar', '$', 'CA.png'),
(40, 'Cape Verde', 'CV', 'CPV', 132, 'CVE', 'Escudo', NULL, 'CV.png'),
(41, 'Cayman Islands', 'KY', 'CYM', 136, 'KYD', 'Dollar', '$', 'KY.png'),
(42, 'Central African Republic', 'CF', 'CAF', 140, 'XAF', 'Franc', 'FCF', 'CF.png'),
(43, 'Chad', 'TD', 'TCD', 148, 'XAF', 'Franc', NULL, 'TD.png'),
(44, 'Chile', 'CL', 'CHL', 152, 'CLP', 'Peso', NULL, 'CL.png'),
(45, 'China', 'CN', 'CHN', 156, 'CNY', 'Yuan Renminbi', '¥', 'CN.png'),
(46, 'Christmas Island', 'CX', 'CXR', 162, 'AUD', 'Dollar', '$', 'CX.png'),
(47, 'Cocos Islands', 'CC', 'CCK', 166, 'AUD', 'Dollar', '$', 'CC.png'),
(48, 'Colombia', 'CO', 'COL', 170, 'COP', 'Peso', '$', 'CO.png'),
(49, 'Comoros', 'KM', 'COM', 174, 'KMF', 'Franc', NULL, 'KM.png'),
(50, 'Cook Islands', 'CK', 'COK', 184, 'NZD', 'Dollar', '$', 'CK.png'),
(51, 'Costa Rica', 'CR', 'CRI', 188, 'CRC', 'Colon', '₡', 'CR.png'),
(52, 'Croatia', 'HR', 'HRV', 191, 'HRK', 'Kuna', 'kn', 'HR.png'),
(53, 'Cuba', 'CU', 'CUB', 192, 'CUP', 'Peso', '₱', 'CU.png'),
(54, 'Cyprus', 'CY', 'CYP', 196, 'CYP', 'Pound', NULL, 'CY.png'),
(55, 'Czech Republic', 'CZ', 'CZE', 203, 'CZK', 'Koruna', 'Kč', 'CZ.png'),
(56, 'Democratic Republic of the Congo', 'CD', 'COD', 180, 'CDF', 'Franc', NULL, 'CD.png'),
(57, 'Denmark', 'DK', 'DNK', 208, 'DKK', 'Krone', 'kr', 'DK.png'),
(58, 'Djibouti', 'DJ', 'DJI', 262, 'DJF', 'Franc', NULL, 'DJ.png'),
(59, 'Dominica', 'DM', 'DMA', 212, 'XCD', 'Dollar', '$', 'DM.png'),
(60, 'Dominican Republic', 'DO', 'DOM', 214, 'DOP', 'Peso', 'RD$', 'DO.png'),
(61, 'East Timor', 'TL', 'TLS', 626, 'USD', 'Dollar', '$', 'TL.png'),
(62, 'Ecuador', 'EC', 'ECU', 218, 'USD', 'Dollar', '$', 'EC.png'),
(63, 'Egypt', 'EG', 'EGY', 818, 'EGP', 'Pound', '£', 'EG.png'),
(64, 'El Salvador', 'SV', 'SLV', 222, 'SVC', 'Colone', '$', 'SV.png'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 'XAF', 'Franc', 'FCF', 'GQ.png'),
(66, 'Eritrea', 'ER', 'ERI', 232, 'ERN', 'Nakfa', 'Nfk', 'ER.png'),
(67, 'Estonia', 'EE', 'EST', 233, 'EEK', 'Kroon', 'kr', 'EE.png'),
(68, 'Ethiopia', 'ET', 'ETH', 231, 'ETB', 'Birr', NULL, 'ET.png'),
(69, 'Falkland Islands', 'FK', 'FLK', 238, 'FKP', 'Pound', '£', 'FK.png'),
(70, 'Faroe Islands', 'FO', 'FRO', 234, 'DKK', 'Krone', 'kr', 'FO.png'),
(71, 'Fiji', 'FJ', 'FJI', 242, 'FJD', 'Dollar', '$', 'FJ.png'),
(72, 'Finland', 'FI', 'FIN', 246, 'EUR', 'Euro', '€', 'FI.png'),
(73, 'France', 'FR', 'FRA', 250, 'EUR', 'Euro', '€', 'FR.png'),
(74, 'French Guiana', 'GF', 'GUF', 254, 'EUR', 'Euro', '€', 'GF.png'),
(75, 'French Polynesia', 'PF', 'PYF', 258, 'XPF', 'Franc', NULL, 'PF.png'),
(76, 'French Southern Territories', 'TF', 'ATF', 260, 'EUR', 'Euro  ', '€', 'TF.png'),
(77, 'Gabon', 'GA', 'GAB', 266, 'XAF', 'Franc', 'FCF', 'GA.png'),
(78, 'Gambia', 'GM', 'GMB', 270, 'GMD', 'Dalasi', 'D', 'GM.png'),
(79, 'Georgia', 'GE', 'GEO', 268, 'GEL', 'Lari', NULL, 'GE.png'),
(80, 'Germany', 'DE', 'DEU', 276, 'EUR', 'Euro', '€', 'DE.png'),
(81, 'Ghana', 'GH', 'GHA', 288, 'GHC', 'Cedi', '¢', 'GH.png'),
(82, 'Gibraltar', 'GI', 'GIB', 292, 'GIP', 'Pound', '£', 'GI.png'),
(83, 'Greece', 'GR', 'GRC', 300, 'EUR', 'Euro', '€', 'GR.png'),
(84, 'Greenland', 'GL', 'GRL', 304, 'DKK', 'Krone', 'kr', 'GL.png'),
(85, 'Grenada', 'GD', 'GRD', 308, 'XCD', 'Dollar', '$', 'GD.png'),
(86, 'Guadeloupe', 'GP', 'GLP', 312, 'EUR', 'Euro', '€', 'GP.png'),
(87, 'Guam', 'GU', 'GUM', 316, 'USD', 'Dollar', '$', 'GU.png'),
(88, 'Guatemala', 'GT', 'GTM', 320, 'GTQ', 'Quetzal', 'Q', 'GT.png'),
(89, 'Guinea', 'GN', 'GIN', 324, 'GNF', 'Franc', NULL, 'GN.png'),
(90, 'Guinea-Bissau', 'GW', 'GNB', 624, 'XOF', 'Franc', NULL, 'GW.png'),
(91, 'Guyana', 'GY', 'GUY', 328, 'GYD', 'Dollar', '$', 'GY.png'),
(92, 'Haiti', 'HT', 'HTI', 332, 'HTG', 'Gourde', 'G', 'HT.png'),
(93, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, 'AUD', 'Dollar', '$', 'HM.png'),
(94, 'Honduras', 'HN', 'HND', 340, 'HNL', 'Lempira', 'L', 'HN.png'),
(95, 'Hong Kong', 'HK', 'HKG', 344, 'HKD', 'Dollar', '$', 'HK.png'),
(96, 'Hungary', 'HU', 'HUN', 348, 'HUF', 'Forint', 'Ft', 'HU.png'),
(97, 'Iceland', 'IS', 'ISL', 352, 'ISK', 'Krona', 'kr', 'IS.png'),
(98, 'India', 'IN', 'IND', 356, 'INR', 'Rupee', '₹', 'IN.png'),
(99, 'Indonesia', 'ID', 'IDN', 360, 'IDR', 'Rupiah', 'Rp', 'ID.png'),
(100, 'Iran', 'IR', 'IRN', 364, 'IRR', 'Rial', '﷼', 'IR.png'),
(101, 'Iraq', 'IQ', 'IRQ', 368, 'IQD', 'Dinar', NULL, 'IQ.png'),
(102, 'Ireland', 'IE', 'IRL', 372, 'EUR', 'Euro', '€', 'IE.png'),
(103, 'Israel', 'IL', 'ISR', 376, 'ILS', 'Shekel', '₪', 'IL.png'),
(104, 'Italy', 'IT', 'ITA', 380, 'EUR', 'Euro', '€', 'IT.png'),
(105, 'Ivory Coast', 'CI', 'CIV', 384, 'XOF', 'Franc', NULL, 'CI.png'),
(106, 'Jamaica', 'JM', 'JAM', 388, 'JMD', 'Dollar', '$', 'JM.png'),
(107, 'Japan', 'JP', 'JPN', 392, 'JPY', 'Yen', '¥', 'JP.png'),
(108, 'Jordan', 'JO', 'JOR', 400, 'JOD', 'Dinar', NULL, 'JO.png'),
(109, 'Kazakhstan', 'KZ', 'KAZ', 398, 'KZT', 'Tenge', 'лв', 'KZ.png'),
(110, 'Kenya', 'KE', 'KEN', 404, 'KES', 'Shilling', NULL, 'KE.png'),
(111, 'Kiribati', 'KI', 'KIR', 296, 'AUD', 'Dollar', '$', 'KI.png'),
(112, 'Kuwait', 'KW', 'KWT', 414, 'KWD', 'Dinar', NULL, 'KW.png'),
(113, 'Kyrgyzstan', 'KG', 'KGZ', 417, 'KGS', 'Som', 'лв', 'KG.png'),
(114, 'Laos', 'LA', 'LAO', 418, 'LAK', 'Kip', '₭', 'LA.png'),
(115, 'Latvia', 'LV', 'LVA', 428, 'LVL', 'Lat', 'Ls', 'LV.png'),
(116, 'Lebanon', 'LB', 'LBN', 422, 'LBP', 'Pound', '£', 'LB.png'),
(117, 'Lesotho', 'LS', 'LSO', 426, 'LSL', 'Loti', 'L', 'LS.png'),
(118, 'Liberia', 'LR', 'LBR', 430, 'LRD', 'Dollar', '$', 'LR.png'),
(119, 'Libya', 'LY', 'LBY', 434, 'LYD', 'Dinar', NULL, 'LY.png'),
(120, 'Liechtenstein', 'LI', 'LIE', 438, 'CHF', 'Franc', 'CHF', 'LI.png'),
(121, 'Lithuania', 'LT', 'LTU', 440, 'LTL', 'Litas', 'Lt', 'LT.png'),
(122, 'Luxembourg', 'LU', 'LUX', 442, 'EUR', 'Euro', '€', 'LU.png'),
(123, 'Macao', 'MO', 'MAC', 446, 'MOP', 'Pataca', 'MOP', 'MO.png'),
(124, 'Macedonia', 'MK', 'MKD', 807, 'MKD', 'Denar', 'ден', 'MK.png'),
(125, 'Madagascar', 'MG', 'MDG', 450, 'MGA', 'Ariary', NULL, 'MG.png'),
(126, 'Malawi', 'MW', 'MWI', 454, 'MWK', 'Kwacha', 'MK', 'MW.png'),
(127, 'Malaysia', 'MY', 'MYS', 458, 'MYR', 'Ringgit', 'RM', 'MY.png'),
(128, 'Maldives', 'MV', 'MDV', 462, 'MVR', 'Rufiyaa', 'Rf', 'MV.png'),
(129, 'Mali', 'ML', 'MLI', 466, 'XOF', 'Franc', NULL, 'ML.png'),
(130, 'Malta', 'MT', 'MLT', 470, 'MTL', 'Lira', NULL, 'MT.png'),
(131, 'Marshall Islands', 'MH', 'MHL', 584, 'USD', 'Dollar', '$', 'MH.png'),
(132, 'Martinique', 'MQ', 'MTQ', 474, 'EUR', 'Euro', '€', 'MQ.png'),
(133, 'Mauritania', 'MR', 'MRT', 478, 'MRO', 'Ouguiya', 'UM', 'MR.png'),
(134, 'Mauritius', 'MU', 'MUS', 480, 'MUR', 'Rupee', '₨', 'MU.png'),
(135, 'Mayotte', 'YT', 'MYT', 175, 'EUR', 'Euro', '€', 'YT.png'),
(136, 'Mexico', 'MX', 'MEX', 484, 'MXN', 'Peso', '$', 'MX.png'),
(137, 'Micronesia', 'FM', 'FSM', 583, 'USD', 'Dollar', '$', 'FM.png'),
(138, 'Moldova', 'MD', 'MDA', 498, 'MDL', 'Leu', NULL, 'MD.png'),
(139, 'Monaco', 'MC', 'MCO', 492, 'EUR', 'Euro', '€', 'MC.png'),
(140, 'Mongolia', 'MN', 'MNG', 496, 'MNT', 'Tugrik', '₮', 'MN.png'),
(141, 'Montserrat', 'MS', 'MSR', 500, 'XCD', 'Dollar', '$', 'MS.png'),
(142, 'Morocco', 'MA', 'MAR', 504, 'MAD', 'Dirham', NULL, 'MA.png'),
(143, 'Mozambique', 'MZ', 'MOZ', 508, 'MZN', 'Meticail', 'MT', 'MZ.png'),
(144, 'Myanmar', 'MM', 'MMR', 104, 'MMK', 'Kyat', 'K', 'MM.png'),
(145, 'Namibia', 'NA', 'NAM', 516, 'NAD', 'Dollar', '$', 'NA.png'),
(146, 'Nauru', 'NR', 'NRU', 520, 'AUD', 'Dollar', '$', 'NR.png'),
(147, 'Nepal', 'NP', 'NPL', 524, 'NPR', 'Rupee', '₨', 'NP.png'),
(148, 'Netherlands', 'NL', 'NLD', 528, 'EUR', 'Euro', '€', 'NL.png'),
(149, 'Netherlands Antilles', 'AN', 'ANT', 530, 'ANG', 'Guilder', 'ƒ', 'AN.png'),
(150, 'New Caledonia', 'NC', 'NCL', 540, 'XPF', 'Franc', NULL, 'NC.png'),
(151, 'New Zealand', 'NZ', 'NZL', 554, 'NZD', 'Dollar', '$', 'NZ.png'),
(152, 'Nicaragua', 'NI', 'NIC', 558, 'NIO', 'Cordoba', 'C$', 'NI.png'),
(153, 'Niger', 'NE', 'NER', 562, 'XOF', 'Franc', NULL, 'NE.png'),
(154, 'Nigeria', 'NG', 'NGA', 566, 'NGN', 'Naira', '₦', 'NG.png'),
(155, 'Niue', 'NU', 'NIU', 570, 'NZD', 'Dollar', '$', 'NU.png'),
(156, 'Norfolk Island', 'NF', 'NFK', 574, 'AUD', 'Dollar', '$', 'NF.png'),
(157, 'North Korea', 'KP', 'PRK', 408, 'KPW', 'Won', '₩', 'KP.png'),
(158, 'Northern Mariana Islands', 'MP', 'MNP', 580, 'USD', 'Dollar', '$', 'MP.png'),
(159, 'Norway', 'NO', 'NOR', 578, 'NOK', 'Krone', 'kr', 'NO.png'),
(160, 'Oman', 'OM', 'OMN', 512, 'OMR', 'Rial', '﷼', 'OM.png'),
(161, 'Pakistan', 'PK', 'PAK', 586, 'PKR', 'Rupee', '₨', 'PK.png'),
(162, 'Palau', 'PW', 'PLW', 585, 'USD', 'Dollar', '$', 'PW.png'),
(163, 'Palestinian Territory', 'PS', 'PSE', 275, 'ILS', 'Shekel', '₪', 'PS.png'),
(164, 'Panama', 'PA', 'PAN', 591, 'PAB', 'Balboa', 'B/.', 'PA.png'),
(165, 'Papua New Guinea', 'PG', 'PNG', 598, 'PGK', 'Kina', NULL, 'PG.png'),
(166, 'Paraguay', 'PY', 'PRY', 600, 'PYG', 'Guarani', 'Gs', 'PY.png'),
(167, 'Peru', 'PE', 'PER', 604, 'PEN', 'Sol', 'S/.', 'PE.png'),
(168, 'Philippines', 'PH', 'PHL', 608, 'PHP', 'Peso', 'Php', 'PH.png'),
(169, 'Pitcairn', 'PN', 'PCN', 612, 'NZD', 'Dollar', '$', 'PN.png'),
(170, 'Poland', 'PL', 'POL', 616, 'PLN', 'Zloty', 'zł', 'PL.png'),
(171, 'Portugal', 'PT', 'PRT', 620, 'EUR', 'Euro', '€', 'PT.png'),
(172, 'Puerto Rico', 'PR', 'PRI', 630, 'USD', 'Dollar', '$', 'PR.png'),
(173, 'Qatar', 'QA', 'QAT', 634, 'QAR', 'Rial', '﷼', 'QA.png'),
(174, 'Republic of the Congo', 'CG', 'COG', 178, 'XAF', 'Franc', 'FCF', 'CG.png'),
(175, 'Reunion', 'RE', 'REU', 638, 'EUR', 'Euro', '€', 'RE.png'),
(176, 'Romania', 'RO', 'ROU', 642, 'RON', 'Leu', 'lei', 'RO.png'),
(177, 'Russia', 'RU', 'RUS', 643, 'RUB', 'Ruble', 'руб', 'RU.png'),
(178, 'Rwanda', 'RW', 'RWA', 646, 'RWF', 'Franc', NULL, 'RW.png'),
(179, 'Saint Helena', 'SH', 'SHN', 654, 'SHP', 'Pound', '£', 'SH.png'),
(180, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 'XCD', 'Dollar', '$', 'KN.png'),
(181, 'Saint Lucia', 'LC', 'LCA', 662, 'XCD', 'Dollar', '$', 'LC.png'),
(182, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'EUR', 'Euro', '€', 'PM.png'),
(183, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 'XCD', 'Dollar', '$', 'VC.png'),
(184, 'Samoa', 'WS', 'WSM', 882, 'WST', 'Tala', 'WS$', 'WS.png'),
(185, 'San Marino', 'SM', 'SMR', 674, 'EUR', 'Euro', '€', 'SM.png'),
(186, 'Sao Tome and Principe', 'ST', 'STP', 678, 'STD', 'Dobra', 'Db', 'ST.png'),
(187, 'Saudi Arabia', 'SA', 'SAU', 682, 'SAR', 'Rial', '﷼', 'SA.png'),
(188, 'Senegal', 'SN', 'SEN', 686, 'XOF', 'Franc', NULL, 'SN.png'),
(189, 'Serbia and Montenegro', 'CS', 'SCG', 891, 'RSD', 'Dinar', 'Дин', 'CS.png'),
(190, 'Seychelles', 'SC', 'SYC', 690, 'SCR', 'Rupee', '₨', 'SC.png'),
(191, 'Sierra Leone', 'SL', 'SLE', 694, 'SLL', 'Leone', 'Le', 'SL.png'),
(192, 'Singapore', 'SG', 'SGP', 702, 'SGD', 'Dollar', '$', 'SG.png'),
(193, 'Slovakia', 'SK', 'SVK', 703, 'SKK', 'Koruna', 'Sk', 'SK.png'),
(194, 'Slovenia', 'SI', 'SVN', 705, 'EUR', 'Euro', '€', 'SI.png'),
(195, 'Solomon Islands', 'SB', 'SLB', 90, 'SBD', 'Dollar', '$', 'SB.png'),
(196, 'Somalia', 'SO', 'SOM', 706, 'SOS', 'Shilling', 'S', 'SO.png'),
(197, 'South Africa', 'ZA', 'ZAF', 710, 'ZAR', 'Rand', 'R', 'ZA.png'),
(198, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 'GBP', 'Pound', '£', 'GS.png'),
(199, 'South Korea', 'KR', 'KOR', 410, 'KRW', 'Won', '₩', 'KR.png'),
(200, 'Spain', 'ES', 'ESP', 724, 'EUR', 'Euro', '€', 'ES.png'),
(201, 'Sri Lanka', 'LK', 'LKA', 144, 'LKR', 'Rupee', '₨', 'LK.png'),
(202, 'Sudan', 'SD', 'SDN', 736, 'SDD', 'Dinar', NULL, 'SD.png'),
(203, 'Suriname', 'SR', 'SUR', 740, 'SRD', 'Dollar', '$', 'SR.png'),
(204, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'NOK', 'Krone', 'kr', 'SJ.png'),
(205, 'Swaziland', 'SZ', 'SWZ', 748, 'SZL', 'Lilangeni', NULL, 'SZ.png'),
(206, 'Sweden', 'SE', 'SWE', 752, 'SEK', 'Krona', 'kr', 'SE.png'),
(207, 'Switzerland', 'CH', 'CHE', 756, 'CHF', 'Franc', 'CHF', 'CH.png'),
(208, 'Syria', 'SY', 'SYR', 760, 'SYP', 'Pound', '£', 'SY.png'),
(209, 'Taiwan', 'TW', 'TWN', 158, 'TWD', 'Dollar', 'NT$', 'TW.png'),
(210, 'Tajikistan', 'TJ', 'TJK', 762, 'TJS', 'Somoni', NULL, 'TJ.png'),
(211, 'Tanzania', 'TZ', 'TZA', 834, 'TZS', 'Shilling', NULL, 'TZ.png'),
(212, 'Thailand', 'TH', 'THA', 764, 'THB', 'Baht', '฿', 'TH.png'),
(213, 'Togo', 'TG', 'TGO', 768, 'XOF', 'Franc', NULL, 'TG.png'),
(214, 'Tokelau', 'TK', 'TKL', 772, 'NZD', 'Dollar', '$', 'TK.png'),
(215, 'Tonga', 'TO', 'TON', 776, 'TOP', 'Pa''anga', 'T$', 'TO.png'),
(216, 'Trinidad and Tobago', 'TT', 'TTO', 780, 'TTD', 'Dollar', 'TT$', 'TT.png'),
(217, 'Tunisia', 'TN', 'TUN', 788, 'TND', 'Dinar', NULL, 'TN.png'),
(218, 'Turkey', 'TR', 'TUR', 792, 'TRY', 'Lira', 'YTL', 'TR.png'),
(219, 'Turkmenistan', 'TM', 'TKM', 795, 'TMM', 'Manat', 'm', 'TM.png'),
(220, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 'USD', 'Dollar', '$', 'TC.png'),
(221, 'Tuvalu', 'TV', 'TUV', 798, 'AUD', 'Dollar', '$', 'TV.png'),
(222, 'U.S. Virgin Islands', 'VI', 'VIR', 850, 'USD', 'Dollar', '$', 'VI.png'),
(223, 'Uganda', 'UG', 'UGA', 800, 'UGX', 'Shilling', NULL, 'UG.png'),
(224, 'Ukraine', 'UA', 'UKR', 804, 'UAH', 'Hryvnia', '₴', 'UA.png'),
(225, 'United Arab Emirates', 'AE', 'ARE', 784, 'AED', 'Dirham', NULL, 'AE.png'),
(226, 'United Kingdom', 'GB', 'GBR', 826, 'GBP', 'Pound', '£', 'GB.png'),
(227, 'United States', 'US', 'USA', 840, 'USD', 'Dollar', '$', 'US.png'),
(228, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, 'USD', 'Dollar ', '$', 'UM.png'),
(229, 'Uruguay', 'UY', 'URY', 858, 'UYU', 'Peso', '$U', 'UY.png'),
(230, 'Uzbekistan', 'UZ', 'UZB', 860, 'UZS', 'Som', 'лв', 'UZ.png'),
(231, 'Vanuatu', 'VU', 'VUT', 548, 'VUV', 'Vatu', 'Vt', 'VU.png'),
(232, 'Vatican', 'VA', 'VAT', 336, 'EUR', 'Euro', '€', 'VA.png'),
(233, 'Venezuela', 'VE', 'VEN', 862, 'VEF', 'Bolivar', 'Bs', 'VE.png'),
(234, 'Vietnam', 'VN', 'VNM', 704, 'VND', 'Dong', '₫', 'VN.png'),
(235, 'Wallis and Futuna', 'WF', 'WLF', 876, 'XPF', 'Franc', NULL, 'WF.png'),
(236, 'Western Sahara', 'EH', 'ESH', 732, 'MAD', 'Dirham', NULL, 'EH.png'),
(237, 'Yemen', 'YE', 'YEM', 887, 'YER', 'Rial', '﷼', 'YE.png'),
(238, 'Zambia', 'ZM', 'ZMB', 894, 'ZMK', 'Kwacha', 'ZK', 'ZM.png'),
(239, 'Zimbabwe', 'ZW', 'ZWE', 716, 'ZWD', 'Dollar', 'Z$', 'ZW.png');

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

--
-- Dumping data for table `ddos`
--

INSERT INTO `ddos` (`id`, `bot_id`, `ip`) VALUES
(1, 'ccc34129b9e49a3e21af7392cb76bf6c', '14.177.3.215'),
(2, 'ccc34129b9e49a3e21af7392cb76bf6c', '19.137.5.192');

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

--
-- Dumping data for table `geos`
--

INSERT INTO `geos` (`botID`, `ip`, `time`, `asInfo`, `city`, `country`, `countryCode`, `isp`, `lat`, `lon`, `org`, `query`, `region`, `regionName`, `status`, `timezone`, `zip`) VALUES
('ccc34129b9e49a3e21af7392cb76bf6c', '113.167.114.91', '2015-09-28 10:51:00', 'AS45899 VNPT Corp\r\n', 'Hanoi', 'Vietnam', 'VN', 'VDC', 21.0333, 105.85, 'Vietnam Posts and Telecommunications(VNPT)\r\n', '113.167.114.91', '64', 'Thanh Pho Ha Noi', 'success', '\r\nAsia/Ho_Chi_Minh', '');

-- --------------------------------------------------------

--
-- Table structure for table `keylogs`
--

CREATE TABLE IF NOT EXISTS `keylogs` (
  `bot_id` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bot_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keylogs`
--

INSERT INTO `keylogs` (`bot_id`, `content`, `time`) VALUES
('5215c1d169ad7fe29dc3643322801fd8', 'w[]w[Backspace][]a[Num Enter][Backspace][Backspace][Down][Down][Down][Down][Down]', '2015-12-31 03:11:50'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:11:51'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:11:56'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:13'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:15'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up]', '2015-12-31 03:12:16'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:17'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Down][Down][Down][Down][Down][Up][Up][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:21'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:22'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Up][Up][Up][Up][Up][Up][Up][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:27'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:28'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-31 03:12:29'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:32'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:33'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:34'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:12:35'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:12:37'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-31 03:12:39'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Right][Right][Right][Left][Left][Right]', '2015-12-31 03:12:42'),
('5215c1d169ad7fe29dc3643322801fd8', '[Left][Right][Right][Left][Right][Left][Right][Left][Right][Left][Down][Down]', '2015-12-31 03:19:17'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:18'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up]', '2015-12-31 03:19:19'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Down]', '2015-12-31 03:19:20'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Up][Down][Up][Up][Up][Up][Up][Up][Down][Down][Down][Down]', '2015-12-31 03:19:23'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Down][Down][Down]', '2015-12-31 03:19:25'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:26'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:27'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:28'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:19:31'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:19:32'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:19:34'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:35'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:36'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-31 03:19:37'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:38'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:39'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Up][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:40'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:19:41'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:19:42'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:26:08'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up]', '2015-12-31 03:26:09'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 03:26:10'),
('5215c1d169ad7fe29dc3643322801fd8', '[Up][Up][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:26:11'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:26:12'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:26:13'),
('5215c1d169ad7fe29dc3643322801fd8', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-31 03:26:14'),
('5215c1d169ad7fe29dc3643322801fd8', '[Ctrl]abcakjskdljkalsjdlkajsiduoqwjeiuasdjklasjdlkajskdljasdd[Backspace][W]', '2015-12-31 03:30:06'),
('5215c1d169ad7fe29dc3643322801fd8', '[Backspace][][]d[Backspace][W]d[Backspace][][]d[Backspace][W]d[Backspace][][]', '2015-12-31 03:30:07'),
('5215c1d169ad7fe29dc3643322801fd8', 'ld[]jlaks[]jd[]klaj[Backspace][]d[]lja[]s[Backspace][]kld[]jlka[]j[Backspace]', '2015-12-31 03:30:08'),
('5215c1d169ad7fe29dc3643322801fd8', 'd[]lkja[]ls[]kd[]jklas[Backspace][]j[Backspace][]d[]kljqiwueioqw[]ue[]io[]j[Backspace]', '2015-12-31 03:30:11'),
('5215c1d169ad7fe29dc3643322801fd8', 'as[Backspace][Backspace][][]lkd[]ja[]lks[]jd[]iwuoue[]oiqieuo[]j[Backspace][]', '2015-12-31 03:30:14'),
('5215c1d169ad7fe29dc3643322801fd8', 'ka[]s[Backspace][]j[Backspace][]d[]cmaa[Backspace][]a[Backspace][][]aaaaaaal', '2015-12-31 03:30:17'),
('5215c1d169ad7fe29dc3643322801fd8', 'djqwlejljdasldjalksjdklajdlakjsdlkjlkjjlasd[Backspace][Backspace][Backspace]', '2015-12-31 03:30:21'),
('5215c1d169ad7fe29dc3643322801fd8', '[Backspace][Backspace][Backspace][Backspace][Backspace][Backspace][Backspace]', '2015-12-31 03:30:22'),
('5215c1d169ad7fe29dc3643322801fd8', '[Backspace][Backspace][Backspace][Backspace][Backspace][Backspace][Backspace]', '2015-12-31 03:30:23'),
('5215c1d169ad7fe29dc3643322801fd8', '[Backspace][Backspace][Backspace][Backspace][Backspace][Backspace][Backspace]', '2015-12-31 03:30:24'),
('7515c8626d2b77161a52d2b347a31cf3', '[Ctrl][Ctrl][SHIFT][Delete][Num Enter][Down][Num Enter][Ctrl][Ctrl][SHIFT]', '2015-12-30 17:16:36'),
('7515c8626d2b77161a52d2b347a31cf3', '[Num Enter][SHIFT][Delete][Num Enter][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:57:39'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:57:47'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:57:49'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:57:51'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:58:53'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:58:55'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 17:58:56'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 17:58:59'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 17:59:38'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Down]', '2015-12-30 17:59:40'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Right][Right][Right][Right][Right][Right][Right][Right][Right][Right]', '2015-12-30 18:02:33'),
('7515c8626d2b77161a52d2b347a31cf3', '[Right][Right][Right][Right][Right][Right][Right][Right][Right][Right][Right]', '2015-12-30 18:02:35'),
('7515c8626d2b77161a52d2b347a31cf3', '[Right][Right][Right][Right][Right][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:07:17'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Up][Num Enter][Down][Up][Down][Left][Left][Left][Left][Left]', '2015-12-30 18:07:28'),
('7515c8626d2b77161a52d2b347a31cf3', '[Left][Left][Left][Left][Right][Right][Down][Down][Right Ctrl][Right Ctrl][Right Ctrl]', '2015-12-30 18:07:32'),
('7515c8626d2b77161a52d2b347a31cf3', '', '2015-12-30 18:07:36'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:07:39'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:07:41'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Down][Backspace][Backspace][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:07:54'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Up][Right][Left][Num Enter][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:08:04'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Num Enter][Down][Down][Down][Up][Up][Num Enter][Down][Down]', '2015-12-30 18:08:09'),
('7515c8626d2b77161a52d2b347a31cf3', '[Num Enter][Down][Down][Down][Down][Down][Down][Down][Num Enter][Down][Up][Down]', '2015-12-30 18:08:11'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Up][Num Enter][Down][Down][Down][Num Enter][Down][Down][Down][Num Enter]', '2015-12-30 18:08:17'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:08:18'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-30 18:08:20'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:08:49'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:11:00'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:11:01'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-30 18:11:06'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Down][Down]', '2015-12-30 18:14:49'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:14:52'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Up]', '2015-12-30 18:14:55'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:15:49'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:15:50'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:15:51'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:15:52'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Up][Down][Down][Down][Down][Down]', '2015-12-30 18:15:53'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Num Enter][Down][Num Enter][Down][Down][Down][Up][Up][Num Enter]', '2015-12-30 18:16:09'),
('7515c8626d2b77161a52d2b347a31cf3', '[Num Enter][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:16:11'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:16:12'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:18:00'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:18:01'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down][Down]', '2015-12-30 18:18:03'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:18:05'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Down]', '2015-12-30 18:18:09'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Down][Down][Down][Down][Down][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:18:12'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Down][Down][Down][Up][Up][Up][Up][Up][Down]', '2015-12-30 18:19:51'),
('7515c8626d2b77161a52d2b347a31cf3', '[Down][Down][Down][Down][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:21:05'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:21:06'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:21:07'),
('7515c8626d2b77161a52d2b347a31cf3', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-30 18:21:09'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Backspace][Num Enter][SHIFT][Delete][Num Enter]keylogger[Home]g[Backspace]g', '2015-12-31 09:11:28'),
('8956c8ed7e2818bbae8979b404cd68c6', 'od[Space][End][Space][Shift]C[Shift]++[Num Enter][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl]', '2015-12-31 09:11:37'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl][Ctrl]', '2015-12-31 09:11:40'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Ctrl][Ctrl][Ctrl][Ctrl]simpelthuw[Backspace][]s[Backspace][][Space]5[Space]', '2015-12-31 09:13:32'),
('8956c8ed7e2818bbae8979b404cd68c6', 'gayf[Backspace][Backspace][][][Space]18[Backspace][Backspace]31/12/2014[Backspace]', '2015-12-31 09:13:42'),
('8956c8ed7e2818bbae8979b404cd68c6', ',[Space]ngayf[Backspace][Backspace][][][Space]cuoo[Backspace][]is[Backspace]', '2015-12-31 09:13:43'),
('8956c8ed7e2818bbae8979b404cd68c6', '[][][Space]cungf[Backspace][Backspace][Backspace][][][][Space]cuar[Backspace]', '2015-12-31 09:13:45'),
('8956c8ed7e2818bbae8979b404cd68c6', '[][][Space]naw[Backspace][2]m[Space]2015,[Space]laf[Backspace][][Space]naw[Backspace]', '2015-12-31 09:13:49'),
('8956c8ed7e2818bbae8979b404cd68c6', 'm[Space]sau[Space]cuar[Backspace][Backspace][][][Space]naw[Backspace][2]m[Space]', '2015-12-31 09:13:55'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Num Enter]print[Backspace][Backspace][Backspace][Backspace][Backspace][Shift]', '2015-12-31 09:22:37'),
('8956c8ed7e2818bbae8979b404cd68c6', 'utput[Ctrl][Space][Shift]D[Down][Num Enter][Shift][Shift](final.c[Shift]_[Num Enter]', '2015-12-31 09:22:45'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Ctrl]thus[Backspace][]w[Backspace][][Space]naw[Backspace][2]m[Space][Space]', '2015-12-31 09:23:19'),
('8956c8ed7e2818bbae8979b404cd68c6', 'gayf[Backspace][Backspace][][][Space][Space][Space][Backspace][Backspace]31/', '2015-12-31 09:23:44'),
('8956c8ed7e2818bbae8979b404cd68c6', '2/2015,[Space]o[Backspace]laf[Backspace][]n[Backspace][Space]ngayf[Backspace]', '2015-12-31 09:23:57'),
('8956c8ed7e2818bbae8979b404cd68c6', '[][][Space]sau[Space]ngayf[Backspace][Backspace][][][Down][End][Num Enter][Shift]', '2015-12-31 09:24:28'),
('8956c8ed7e2818bbae8979b404cd68c6', 'utpt[Backspace]ut[Shift][Ctrl][Space][Shift]De[Down][Num Enter][Shift]()[Left]', '2015-12-31 09:24:33'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Ctrl]thuw[Backspace][]s[Backspace][][Space]naw[Backspace][2]m[Space]ngayf[Backspace]', '2015-12-31 09:24:51'),
('8956c8ed7e2818bbae8979b404cd68c6', '[][]//[Down][Left][Left][Left][Right]//[Up][Ctrl][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 09:25:05'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Up][Up][Up][Up][Up][Ctrl]\Z\Z[Ctrl][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up]', '2015-12-31 09:25:08'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Up][Down][Down]', '2015-12-31 09:25:09'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Down][Down][Down][Down][Down][Down][Left][Left][Left][Left][Num Enter][Ctrl]', '2015-12-31 09:25:13'),
('8956c8ed7e2818bbae8979b404cd68c6', '[Ctrl]\Z[Up][Up][Shift][Down][End][Ctrl][Down][Num Enter][Ctrl][Home][Tab][Down]', '2015-12-31 09:25:23');

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

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`bot_id`, `url`, `user`, `pass`) VALUES
('0', 'http://sis.hust.edu.vn', '20121111', '123456'),
('ccc34129b9e49a3e21af7392cb76bf6c', 'http://sis.hust.edu.vn', '20121234', '123456'),
('ccc34129b9e49a3e21af7392cb76bf6c', 'http://gmail.com', 'hoan@gmail.com', 'daylapass'),
('ccc34129b9e49a3e21af7392cb76bf6c', 'http://me.zing.vn', 'gacon', 'nongtraivuive'),
('aaaa', 'http://mail.yahoo.com.vn', 'congtu@yahoo.com.vn', '123456789'),
('aaaa', 'http://facebook.com', 'hainh@gmail.com', '444400000'),
('asdad', 'url', 'user', 'pass');

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

--
-- Dumping data for table `resultcmd`
--

INSERT INTO `resultcmd` (`id`, `bot_id`, `cmd`, `result`) VALUES
(1, 'ccc34129b9e49a3e21af7392cb76bf6c', 'ping', 'reply from 192.168.1.1 ...........'),
(2, 'ccc34129b9e49a3e21af7392cb76bf6c', 'ipconfig', 'IPAddress : 192.168.1.1'),
(3, 'aaaa', 'ping', 'reply from .............. ');

-- --------------------------------------------------------

--
-- Table structure for table `screenshots`
--

CREATE TABLE IF NOT EXISTS `screenshots` (
  `bot_id` varchar(45) NOT NULL,
  `screen_id` varchar(45) NOT NULL,
  `path` text NOT NULL,
  `time_upload` datetime DEFAULT NULL,
  PRIMARY KEY (`bot_id`,`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `screenshots`
--

INSERT INTO `screenshots` (`bot_id`, `screen_id`, `path`, `time_upload`) VALUES
('aaaa', '4', 'data/victim/aaaa/screenshots/slide1.png', '2015-10-20 18:09:49'),
('aaaa', '5', 'data/victim/aaaa/screenshots/slide2.png', '2015-10-20 18:10:07'),
('ccc34129b9e49a3e21af7392cb76bf6c', '2', 'data/victim/ccc34129b9e49a3e21af7392cb76bf6c/screenshots/slide2.png', '2015-10-20 17:17:54'),
('ccc34129b9e49a3e21af7392cb76bf6c', '2015-09-28 16:18:32', 'data/victim/ccc34129b9e49a3e21af7392cb76bf6c/screenshots/slide1.png', '2015-09-28 11:03:28'),
('ccc34129b9e49a3e21af7392cb76bf6c', '3', 'data/victim/ccc34129b9e49a3e21af7392cb76bf6c/screenshots/slide3.png', '2015-10-20 18:00:42');

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

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `email`, `created`, `modified`) VALUES
(1, 'hoan', '123', 'Nguyễn Công Hoan', 'hoannc54@gmail.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'haihoang', '1', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
