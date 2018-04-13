-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2018 at 06:13 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounting`
--

CREATE TABLE `accounting` (
  `application_id` varchar(20) NOT NULL,
  `ORnumber` varchar(20) NOT NULL,
  `ORdate` date NOT NULL,
  `TransactionNumber` varchar(20) NOT NULL,
  `AmountPaid` varchar(20) NOT NULL,
  `SubjectPaid` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `id` int(11) NOT NULL,
  `dateaccepted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounting`
--

INSERT INTO `accounting` (`application_id`, `ORnumber`, `ORdate`, `TransactionNumber`, `AmountPaid`, `SubjectPaid`, `status`, `id`, `dateaccepted`) VALUES
('2018-1-00001', '56789', '2018-02-21', '2018-00001', '18000', 'Analytic Geomety, Advance Java, Software Engineering, Game Development, Technopreneurship, TechCom', 1, 1, '2018-02-21'),
('2018-1-00002', '12345', '0000-00-00', '', '18000', 'Analytic Geomety, Advance Java, Software Engineering, Game Development, Technopreneurship, TechCom-', 0, 2, '2018-02-25'),
('2018-1-00001', '56789', '2018-02-21', '2018-00001', '18000', 'Analytic Geomety, Advance Java, Software Engineering, Game Development, Technopreneurship, TechCom', 1, 1, '2018-02-21'),
('2018-1-00002', '12345', '0000-00-00', '', '18000', 'Analytic Geomety, Advance Java, Software Engineering, Game Development, Technopreneurship, TechCom-', 0, 2, '2018-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `account_admission`
--

CREATE TABLE `account_admission` (
  `a_id` varchar(13) NOT NULL,
  `subjects` varchar(500) NOT NULL,
  `or_num` varchar(20) DEFAULT NULL,
  `or_date` date DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `idnum` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `birth` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `idnum`, `password`, `fname`, `lname`, `mname`, `birth`, `status`, `gender`) VALUES
(1, 'admin', '1234', 'MG', 'Feb', 'wala', 'March 13 1992', 's', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `admission_address`
--

CREATE TABLE `admission_address` (
  `a_id` varchar(13) NOT NULL,
  `country` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_address`
--

INSERT INTO `admission_address` (`a_id`, `country`, `region`, `province`, `city`, `street`) VALUES
('2018022700001', 'PHILIPPINES', 'NCR', '', 'Caloocan', 'SDFGHJ'),
('2018022800002', 'PHILIPPINES', 'NCR', '', 'Caloocan', 'asdfghjkl');

-- --------------------------------------------------------

--
-- Table structure for table `admission_counter`
--

CREATE TABLE `admission_counter` (
  `ctr` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_counter`
--

INSERT INTO `admission_counter` (`ctr`) VALUES
('0'),
('1'),
('2');

-- --------------------------------------------------------

--
-- Table structure for table `admission_course`
--

CREATE TABLE `admission_course` (
  `a_id` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `major` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_course`
--

INSERT INTO `admission_course` (`a_id`, `course`, `major`) VALUES
('2018022700001', 'Bachelor of Arts in Information Technology', 'Programming'),
('2018022800002', 'Bachelor of Science in Business Administration', 'Business Economics');

-- --------------------------------------------------------

--
-- Table structure for table `admission_info`
--

CREATE TABLE `admission_info` (
  `a_id` varchar(13) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `citizenship` varchar(50) NOT NULL,
  `other_cit` varchar(50) DEFAULT NULL,
  `acr` varchar(50) DEFAULT NULL,
  `tel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_info`
--

INSERT INTO `admission_info` (`a_id`, `lname`, `fname`, `mname`, `citizenship`, `other_cit`, `acr`, `tel`) VALUES
('2018022700001', 'DE VILLA', 'RACHELLE ANNE', 'GILLADO', 'FILIPINO', 'NA', 'NA', '9014299'),
('2018022800002', 'TUMLOS', 'CEDRIX', 'BIAY', 'FILIPINO', 'NA', 'NA', '901299');

-- --------------------------------------------------------

--
-- Table structure for table `admission_requirements`
--

CREATE TABLE `admission_requirements` (
  `a_id` varchar(13) NOT NULL,
  `hs_card` varchar(20) DEFAULT NULL,
  `tor` varchar(20) DEFAULT NULL,
  `honorable_dis` varchar(20) DEFAULT NULL,
  `id_pic` varchar(20) DEFAULT NULL,
  `others` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_requirements`
--

INSERT INTO `admission_requirements` (`a_id`, `hs_card`, `tor`, `honorable_dis`, `id_pic`, `others`) VALUES
('2018022700001', '', 'tor', '', '', ''),
('2018022800002', '', 'tor', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `term` varchar(30) NOT NULL,
  `week` varchar(30) NOT NULL,
  `idnumber` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `score` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`id`, `term`, `week`, `idnumber`, `subject`, `score`) VALUES
(1, 'Prelim', '1', '09-0001', 'ENG 03', '90'),
(2, 'Prelim', '1', '09-0002', 'ENG 03', '90'),
(3, 'Prelim', '2', '09-0001', 'ENG 03', '98'),
(4, 'Prelim', '2', '09-0002', 'ENG 03', '98'),
(5, 'Prelim', '3', '09-0001', 'ENG 03', '89'),
(6, 'Prelim', '3', '09-0002', 'ENG 03', '89'),
(7, 'Prelim', '4', '09-0001', 'ENG 03', '88'),
(8, 'Prelim', '4', '09-0002', 'ENG 03', '88'),
(9, 'Prelim', '5', '09-0001', 'ENG 03', '99'),
(10, 'Prelim', '5', '09-0002', 'ENG 03', '99'),
(11, 'Prelim', '6', '09-0001', 'ENG 03', '88'),
(12, 'Prelim', '6', '09-0002', 'ENG 03', '88'),
(13, 'Midterm', '7', '09-0001', 'ENG 03', '99'),
(14, 'Midterm', '7', '09-0002', 'ENG 03', '99'),
(15, 'Midterm', '8', '09-0001', 'ENG 03', '99'),
(16, 'Midterm', '8', '09-0002', 'ENG 03', '99'),
(17, 'Midterm', '9', '09-0001', 'ENG 03', '88'),
(18, 'Midterm', '9', '09-0002', 'ENG 03', '88'),
(19, 'Midterm', '10', '09-0001', 'ENG 03', '88'),
(20, 'Midterm', '10', '09-0002', 'ENG 03', '88'),
(21, 'Midterm', '11', '09-0001', 'ENG 03', '99'),
(22, 'Midterm', '11', '09-0002', 'ENG 03', '99'),
(23, 'Midterm', '12', '09-0001', 'ENG 03', '77'),
(24, 'Midterm', '12', '09-0002', 'ENG 03', '77'),
(25, 'Endterm', '13', '09-0001', 'ENG 03', '88'),
(26, 'Endterm', '13', '09-0002', 'ENG 03', '88'),
(27, 'Endterm', '14', '09-0001', 'ENG 03', '99'),
(28, 'Endterm', '14', '09-0002', 'ENG 03', '99'),
(29, 'Endterm', '15', '09-0001', 'ENG 03', '88'),
(30, 'Endterm', '15', '09-0002', 'ENG 03', '88'),
(31, 'Endterm', '16', '09-0001', 'ENG 03', '88'),
(32, 'Endterm', '16', '09-0002', 'ENG 03', '88'),
(33, 'Endterm', '17', '09-0001', 'ENG 03', '88'),
(34, 'Endterm', '17', '09-0002', 'ENG 03', '88'),
(35, 'Endterm', '18', '09-0001', 'ENG 03', '88'),
(36, 'Endterm', '18', '09-0002', 'ENG 03', '88'),
(37, 'Prelim', '1', 'p', 'ENG-000', '99'),
(38, 'Prelim', '2', 'p', 'ENG-000', '88'),
(39, 'Prelim', '3', 'p', 'ENG-000', '77'),
(40, 'Prelim', '4', 'p', 'ENG-000', '99'),
(41, 'Prelim', '5', 'p', 'ENG-000', '89'),
(42, 'Prelim', '6', 'p', 'ENG-000', '98'),
(43, 'Midterm', '7', 'p', 'ENG-000', '90'),
(44, 'Midterm', '8', 'p', 'ENG-000', '98'),
(45, 'Midterm', '9', 'p', 'ENG-000', '99'),
(46, 'Midterm', '10', 'p', 'ENG-000', '99'),
(47, 'Midterm', '11', 'p', 'ENG-000', '78'),
(48, 'Midterm', '12', 'p', 'ENG-000', '99'),
(49, 'Endterm', '13', 'p', 'ENG-000', '88'),
(50, 'Endterm', '14', 'p', 'ENG-000', '90'),
(51, 'Endterm', '15', 'p', 'ENG-000', '98'),
(52, 'Endterm', '16', 'p', 'ENG-000', '90'),
(53, 'Endterm', '17', 'p', 'ENG-000', '88'),
(54, 'Endterm', '18', 'p', 'ENG-000', '88');

-- --------------------------------------------------------

--
-- Table structure for table `assignmentpercentage`
--

CREATE TABLE `assignmentpercentage` (
  `id` int(11) NOT NULL,
  `tid` varchar(30) NOT NULL,
  `apercentage` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignmentpercentage`
--

INSERT INTO `assignmentpercentage` (`id`, `tid`, `apercentage`) VALUES
(1, '00-2222', '.10'),
(2, 'TID-RXK0RUM0', '.10'),
(3, 'TID-IHS3ZDS5', '.10'),
(4, 'TID-7EDD4ESH', '.10'),
(5, 'TID-GQ6ZOHYI', '.10'),
(6, 'TID-MQDSLKZ7', '.10'),
(7, 'TID-CVAWWJNE', '.10'),
(8, 'TID-HVJXWFVE', '.10'),
(9, 'TID-GCUHT4P2', '.10'),
(10, 'TID-GH2JT57J', '.10'),
(11, 'TID-FNOCMP20', '.10'),
(12, 'TID-D7MRVGPO', '.10'),
(13, 'TID-OKTD4AD7', '.10'),
(14, 'TID-45V2C4R3', '.10'),
(15, 'TID-4KPORC0M', '.10'),
(16, 'TID-AVIQH4LZ', '.10'),
(17, 'TID-B0NJGY3V', '.10'),
(18, 'TID-J3MOMY5C', '.10'),
(19, 'TID-K3BIR524', '.10'),
(20, 'TID-EYKPS44F', '.10'),
(21, 'TID-ZGQL35QR', '.10'),
(22, 'TID-ZNTLTWZB', '.10'),
(23, 'TID-YR73WMIN', '.10'),
(24, 'TID-N6REH3X0', '.10'),
(25, 'TID-YRJARGMT', '.10'),
(26, 'TID-6KHHJXNO', '.10'),
(27, 'TID-Q7PM0VD5', '.10'),
(28, 'TID-Q7PM0VD5', '.10'),
(29, 'TID-SEXXWG3Y', '.10'),
(30, 'TID-5P2K2NJT', '.10'),
(31, 'TID-FO23SXDC', '.10'),
(32, 'TID-XR0WNJ4M', '.10'),
(33, 'TID-B4FGAXWT', '.10'),
(34, 'TID-KBYPBO2E', '.10'),
(35, 'TID-KBYPBO2E', '.10');

-- --------------------------------------------------------

--
-- Table structure for table `businessadministration_businesseconomics`
--

CREATE TABLE `businessadministration_businesseconomics` (
  `id` int(100) NOT NULL,
  `term` int(100) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL,
  `class_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_businesseconomics`
--

INSERT INTO `businessadministration_businesseconomics` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`, `class_num`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', '', 0),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', '', 0),
(3, 1, 'GE103', 'The Contemporary World', 3, '', '', 0),
(4, 1, 'GE104', 'Mathematics in the Modern World ', 3, '', '', 0),
(5, 1, 'CBM101', 'Operations Management', 3, '', 'CBM102', 0),
(6, 1, 'PE1', 'Physical Education 1', 2, '', 'PE2', 0),
(7, 1, 'NSTP1', 'CWTS 1', 3, '', 'NSTP2', 0),
(8, 2, 'GE105', 'Purposive Communication ', 3, '', '', 0),
(9, 2, 'GE106', 'Art Appreciation', 3, '', '', 0),
(10, 2, 'GE107', 'Science, Technology and Society ', 3, '', '', 0),
(11, 2, 'GE108', 'Ethics', 3, '', '', 0),
(12, 2, 'CBM102', 'Strategic Management', 3, 'CBM101', '', 0),
(13, 2, 'PE2', 'Physical Education 2', 2, 'PE1', 'PE3', 0),
(14, 2, 'NSTP2', 'CWTS 2', 3, 'NSTP1', '', 0),
(15, 3, 'GE109', 'The Life and Works of Jose Rizal', 3, '', '', 2),
(16, 3, 'GE110', 'Mathematics, Science and Technology', 3, '', '', 0),
(17, 3, 'GE11', 'Komunikasyon sa Pilipino', 3, '', '', 0),
(18, 3, 'BEC101', 'Basic Microeconomics', 3, '', 'BEC103', 0),
(19, 3, 'BEC102', 'Business Law', 3, '', 'BEC103', 0),
(20, 3, 'PE3', 'Physical Education 3', 2, 'PE2', 'PE4', 0),
(21, 4, 'GE112', 'Social Science and Philosophy', 3, '', '', 0),
(22, 4, 'GE113', 'Arts and Humanities', 3, '', '', 0),
(23, 4, 'GE114', 'Retorika', 3, '', '', 0),
(24, 4, 'BEP101', 'Basic Macroeconomics', 3, '', 'BEP102,BEP103', 0),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106', 0),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', '', 0),
(27, 5, 'BEP102', 'History of Economic Thoughts', 3, 'BEP101', 'BEP104,BEP105,BEP106', 0),
(28, 5, 'BEP103', 'Advanced Microeconomics', 3, 'BEP101', 'BEP104,BEP105,BEP106', 0),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107', 0),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107', 0),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107', 0),
(34, 6, 'BEP104', 'Project Development Management', 3, 'BEP102,BEP103', 'BEP107,BEP108', 0),
(35, 6, 'BEP105', 'Advanced Macroeconomics', 3, 'BEP102,BEP103', 'BEP107,BEP108', 0),
(36, 6, 'BEP106', 'International Economics', 3, 'BEP102,BEP103', 'BEP107,BEP108', 0),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107', 0),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107', 0),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108', 0),
(40, 7, 'BEP107', 'Managerial Economics', 3, 'BEP104,BEP105,BEP106', '', 0),
(41, 7, 'BEP108', 'Monetary & Fiscal Economics', 3, 'BEP104,BEP105,BEP106', '', 0),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', '', 0),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', '', 0),
(44, 8, 'PRAC', 'Internship (600Hrs) BE Major', 6, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `businessadministration_financialmanagement`
--

CREATE TABLE `businessadministration_financialmanagement` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_financialmanagement`
--

INSERT INTO `businessadministration_financialmanagement` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', ''),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', ''),
(3, 1, 'GE103', 'The Contemporary World ', 3, '', ''),
(4, 1, 'GE104', 'Mathematics in the Modern World ', 3, '', ''),
(5, 1, 'CBM101', 'Operations Management', 3, '', 'CBM102'),
(6, 1, 'PE1', 'Physical Education 1', 2, '', 'PE2'),
(7, 1, 'NSTP1', 'CWTS 1', 3, '', 'NSTP2'),
(8, 2, 'GE105', 'Purposive Communication ', 3, '', ''),
(9, 2, 'GE106', 'Art Appreciation', 3, '', ''),
(10, 2, 'GE107', 'Science, Technology and Society ', 3, '', ''),
(11, 2, 'GE108', 'Ethics', 3, '', ''),
(12, 2, 'CBM102', 'Strategic Management', 3, 'CBM101', ''),
(13, 2, 'PE2', 'Physical Education 2', 2, 'PE1', 'PE3'),
(14, 2, 'NSTP2', 'CWTS 2', 3, 'NSTP1', ''),
(15, 3, 'GE109', 'The Life and Works of Jose Rizal', 3, '', ''),
(16, 3, 'GE110', 'Mathematics, Science and Technology', 3, '', ''),
(17, 3, 'GE11', 'Komunikasyon sa Pilipino', 3, '', ''),
(18, 3, 'BEC101', 'Basic Microeconomics', 3, '', 'BEC103'),
(19, 3, 'BEC102', 'Business Law', 3, '', 'BEC103'),
(20, 3, 'PE3', 'Physical Education 3', 2, 'PE2', 'PE4'),
(21, 4, 'GE112', 'Social Science and Philosophy', 3, '', ''),
(22, 4, 'GE113', 'Arts and Humanities', 3, '', ''),
(23, 4, 'GE114', 'Retorika', 3, '', ''),
(24, 4, 'FMP101', 'Financial Management', 3, '', 'FMP102,FMP103'),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106'),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', ''),
(27, 5, 'FMP102', 'Financial Analysis & Reporting', 3, 'FMP101', 'FMP104,FMP105,FMP106'),
(28, 5, 'FMP103', 'Banking & Financial Institutions', 3, 'FMP101', 'FMP104,FMP105,FMP106'),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107'),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107'),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107'),
(34, 6, 'FMP104', 'Monetary Policy & Central Banking', 3, 'FMP102,FMP103', 'FMP107,FMP108'),
(35, 6, 'FMP105', 'Investment & Portfolio Management ', 3, 'FMP102,FMP103', 'FMP107,FMP108'),
(36, 6, 'FMP106', 'Credit & Collections', 3, 'FMP102,FMP103', 'FMP107,FMP108'),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107'),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107'),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108'),
(40, 7, 'FMP107', 'Capital Market', 3, 'FMP104,FMP105,FMP106', ''),
(41, 7, 'FMP108', 'Special Topics in Financial Mgt.', 3, 'FMP104,FMP105,FMP106', ''),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', ''),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', ''),
(44, 8, 'PRAC', 'Internship (600Hrs) FM Major', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `businessadministration_humanresourcemanagement`
--

CREATE TABLE `businessadministration_humanresourcemanagement` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_humanresourcemanagement`
--

INSERT INTO `businessadministration_humanresourcemanagement` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', ''),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', ''),
(3, 1, 'GE103', 'The Contemporary World ', 3, '', ''),
(4, 1, 'GE104', 'Mathematics in the Modern World ', 3, '', ''),
(5, 1, 'CBM101', 'Operations Management', 3, '', 'CBM102'),
(6, 1, 'PE1', 'Physical Education 1', 2, '', 'PE2'),
(7, 1, 'NSTP1', 'CWTS 1', 3, '', 'NSTP2'),
(8, 2, 'GE105', 'Purposive Communication ', 3, '', ''),
(9, 2, 'GE106', 'Art Appreciation', 3, '', ''),
(10, 2, 'GE107', 'Science, Technology and Society ', 3, '', ''),
(11, 2, 'GE108', 'Ethics', 3, '', ''),
(12, 2, 'CBM102', 'Strategic Management', 3, 'CBM101', ''),
(13, 2, 'PE2', 'Physical Education 2', 2, 'PE1', 'PE3'),
(14, 2, 'NSTP2', 'CWTS 2', 3, 'NSTP1', ''),
(15, 3, 'GE109', 'The Life and Works of Jose Rizal', 3, '', ''),
(16, 3, 'GE110', 'Mathematics, Science and Technology', 3, '', ''),
(17, 3, 'GE11', 'Komunikasyon sa Pilipino', 3, '', ''),
(18, 3, 'BEC101', 'Basic Microeconomics', 3, '', 'BEC103'),
(19, 3, 'BEC102', 'Business Law', 3, '', 'BEC103'),
(20, 3, 'PE3', 'Physical Education 3', 2, 'PE2', 'PE4'),
(21, 4, 'GE112', 'Social Science and Philosophy', 3, '', ''),
(22, 4, 'GE113', 'Arts and Humanities', 3, '', ''),
(23, 4, 'GE114', 'Retorika', 3, '', ''),
(24, 4, 'HRP101', 'Admin & Office Management', 3, '', 'HRP102,HRP103'),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106'),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', ''),
(27, 5, 'HRP102', 'Labor Law & Legislation', 3, 'HRP101', 'HRP104,HRP105,HRP106'),
(28, 5, 'HRP103', 'Recruitment & Selection', 3, 'HRP101', 'HRP104,HRP105,HRP106'),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107'),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107'),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107'),
(34, 6, 'HRP104', 'Training & Development', 3, 'HRP102,HRP103', 'HRP107,HRP108'),
(35, 6, 'HRP105', 'Compensation Administration', 3, 'HRP102,HRP103', 'HRP107,HRPP108'),
(36, 6, 'HRP106', 'Labor Relations & Negotiations', 3, 'HRP102,HRP103', 'HRP107,HRP108'),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107'),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107'),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108'),
(40, 7, 'HRP107', 'Special Topics in Human Resources', 3, 'HRP104,HRP105,HRP106', ''),
(41, 7, 'HRP108', 'Organizational Development', 3, 'HRP104,HRP105,HRP106', ''),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', ''),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', ''),
(44, 8, 'PRAC', 'Internship (600Hrs) HRM Major', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `businessadministration_marketingmanagement`
--

CREATE TABLE `businessadministration_marketingmanagement` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_marketingmanagement`
--

INSERT INTO `businessadministration_marketingmanagement` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', ''),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', ''),
(3, 1, 'GE103', 'The Contemporary World ', 3, '', ''),
(4, 1, 'GE104', 'Mathematics in the Modern World ', 3, '', ''),
(5, 1, 'CBM101', 'Operations Management', 3, '', 'CBM102'),
(6, 1, 'PE1', 'Physical Education 1', 2, '', 'PE2'),
(7, 1, 'NSTP1', 'CWTS 1', 3, '', 'NSTP2'),
(8, 2, 'GE105', 'Purposive Communication ', 3, '', ''),
(9, 2, 'GE106', 'Art Appreciation', 3, '', ''),
(10, 2, 'GE107', 'Science, Technology and Society ', 3, '', ''),
(11, 2, 'GE108', 'Ethics', 3, '', ''),
(12, 2, 'CBM102', 'Strategic Management', 3, 'CBM101', ''),
(13, 2, 'PE2', 'Physical Education 2', 2, 'PE1', 'PE3'),
(14, 2, 'NSTP2', 'CWTS 2', 3, 'NSTP1', ''),
(15, 3, 'GE109', 'The Life and Works of Jose Rizal', 3, '', ''),
(16, 3, 'GE110', 'Mathematics, Science and Technology', 3, '', ''),
(17, 3, 'GE11', 'Komunikasyon sa Pilipino', 3, '', ''),
(18, 3, 'BEC101', 'Basic Microeconomics', 3, '', 'BEC103'),
(19, 3, 'BEC102', 'Business Law', 3, '', 'BEC103'),
(20, 3, 'PE3', 'Physical Education 3', 2, 'PE2', 'PE4'),
(21, 4, 'GE112', 'Social Science and Philosophy', 3, '', ''),
(22, 4, 'GE113', 'Arts and Humanities', 3, '', ''),
(23, 4, 'GE114', 'Retorika', 3, '', ''),
(24, 4, 'MMP101', 'Professional Salesmanship', 3, '', 'MMP102,MMP103'),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106'),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', ''),
(27, 5, 'MMPP102', 'Marketing Psychology', 3, 'MMP101', 'MMP104,MMP105,MMP106'),
(28, 5, 'MMP103', 'Marketing Management', 3, 'MMP101', 'MMP104,MMP105,MMP106'),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107'),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107'),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107'),
(34, 6, 'MMP104', 'Distribution Management', 3, 'MMP102,MMP103', 'MMP107,MMP108'),
(35, 6, 'MMP105', 'Advertising', 3, 'MMP102,MMP103', 'MMP107,MMP108'),
(36, 6, 'MM106', 'Product Management', 3, 'MMP102,MMP103', 'MMP107,MMP108'),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107'),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107'),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108'),
(40, 7, 'MMP107', 'Retail Management', 3, 'MMP104,MMP105,MMP106', ''),
(41, 7, 'MMP108', 'Pricing Strategy', 3, 'MMP104,MMP105,MMP106', ''),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', ''),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', ''),
(44, 8, 'PRAC', 'Internship (600Hrs) MM Major', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `businessadministration_operationsmanagement`
--

CREATE TABLE `businessadministration_operationsmanagement` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(100) NOT NULL,
  `prerequisite` varchar(100) NOT NULL,
  `corequisite` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_operationsmanagement`
--

INSERT INTO `businessadministration_operationsmanagement` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', ''),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', ''),
(3, 1, 'GE103', 'The Contemporary World ', 3, '', ''),
(4, 1, 'GE104', 'Mathematics in the Modern World ', 3, '', ''),
(5, 1, 'CBM101', 'Operations Management', 3, '', 'CBM102'),
(6, 1, 'PE1', 'Physical Education 1', 2, '', 'PE2'),
(7, 1, 'NSTP1', 'CWTS 1', 3, '', 'NSTP2'),
(8, 2, 'GE105', 'Purposive Communication ', 3, '', ''),
(9, 2, 'GE106', 'Art Appreciation', 3, '', ''),
(10, 2, 'GE107', 'Science, Technology and Society ', 3, '', ''),
(11, 2, 'GE108', 'Ethics', 3, '', ''),
(12, 2, 'CBM102', 'Strategic Management', 3, 'CBM101', ''),
(13, 2, 'PE2', 'Physical Education 2', 2, 'PE1', 'PE3'),
(14, 2, 'NSTP2', 'CWTS 2', 3, 'NSTP1', ''),
(15, 3, 'GE109', 'The Life and Works of Jose Rizal', 3, '', ''),
(16, 3, 'GE110', 'Mathematics, Science and Technology', 3, '', ''),
(17, 3, 'GE11', 'Komunikasyon sa Pilipino', 3, '', ''),
(18, 3, 'BEC101', 'Basic Microeconomics', 3, '', 'BEC103'),
(19, 3, 'BEC102', 'Business Law', 3, '', 'BEC103'),
(20, 3, 'PE3', 'Physical Education 3', 2, 'PE2', 'PE4'),
(21, 4, 'GE112', 'Social Science and Philosophy', 3, '', ''),
(22, 4, 'GE113', 'Arts and Humanities', 3, '', ''),
(23, 4, 'GE114', 'Retorika', 3, '', ''),
(24, 4, 'OMP101', 'Environmental Management System', 3, '', 'OMP102,OMP103'),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106'),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', ''),
(27, 5, 'OMP102', 'Inventory Management & Control', 3, 'OMP101', 'OMP104,OMP105,OMP106'),
(28, 5, 'OMP103', 'Product Management', 3, 'OMP101', 'OMP104,OMP105,OMP106'),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107'),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107'),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107'),
(34, 6, 'OMP104', 'Costing & Pricing', 3, 'OMP102,OMP103', 'OMP107,OMP108'),
(35, 6, 'OMP105', 'Logistics Management', 3, 'OMP102,OMP103', 'OMP107,OMP108'),
(36, 6, 'OMP106', 'Productivity & Quality Tools', 3, 'OMP102,OMP103', 'OMP107,OMP108'),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107'),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107'),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108'),
(40, 7, 'OMP107', 'Facilities Management', 3, 'OMP104,OMP105,OMP106', ''),
(41, 7, 'OMP108', 'Special Topics in Operations Mgt.', 3, 'OMP104,OMP105,OMP106', ''),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', ''),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', ''),
(44, 8, 'PRAC', 'Internship (600Hrs) OM Major', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(9) NOT NULL,
  `class` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(11) NOT NULL,
  `faculty` varchar(99) NOT NULL,
  `studentnum` varchar(99) NOT NULL,
  `studentname` varchar(99) NOT NULL,
  `studentstatus` varchar(99) NOT NULL,
  `course` varchar(99) NOT NULL,
  `major` varchar(99) NOT NULL,
  `gradestatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class`, `subjectcode`, `subjectname`, `units`, `faculty`, `studentnum`, `studentname`, `studentstatus`, `course`, `major`, `gradestatus`) VALUES
(1, 1, 'GE109', 'The Life and Works of Jose Rizal', 3, 'Toshinori Allmight', '3-20132015', 'midoriya izuku', 'active', 'Bachelor of Science in Business Administration', 'Business Economics', 0),
(2, 1, 'GE109', 'The Life and Works of Jose Rizal', 3, 'Toshinori Allmight', '1-20132015', 'daniel james merencillo punzalan', 'active', 'Bachelor of Science in Business Administration', 'Business Economics', 0),
(3, 2, 'GE109', 'The Life and Works of Jose Rizal', 3, 'Toshinori Allmight', '2-20132015', 'justine sanvictores crisostomo', 'grace period', 'Bachelor of Science in Business Administration', 'Business Economics', 0),
(4, 3, 'GE110', 'Mathematics, Science and Technology', 3, 'Toshinori Allmight', '2-20132015', 'justine sanvictores crisostomo', 'active', 'Bachelor of Science in Business Administration', 'Business Economics', 0),
(5, 1, 'GE11', 'Komunikasyon sa Pilipino', 3, 'Toshinori Allmight', '2-20132015', 'justine sanvictores crisostomo', 'lapse', 'Bachelor of Science in Business Administration', 'Economics', 0),
(6, 2, 'BEC101', 'Basic Microeconomics', 3, 'Toshinori Allmight', '1-20132015', 'daniel james merencillo punzalan', 'grace period', 'Bachelor of Science in Business Administration', 'Business Economics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_subject_count`
--

CREATE TABLE `class_subject_count` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(99) NOT NULL,
  `class_name` varchar(99) NOT NULL,
  `class_num` int(11) NOT NULL,
  `class_limit` int(11) NOT NULL,
  `class_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_subject_count`
--

INSERT INTO `class_subject_count` (`id`, `subject_code`, `class_name`, `class_num`, `class_limit`, `class_count`) VALUES
(1, 'GE109', 'ge109_class1', 1, 3, 2),
(2, 'GE109', 'ge109_class2', 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_subject` varchar(250) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `coursecode` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `coursecode`, `description`) VALUES
(1, 'BSIT', '11111');

-- --------------------------------------------------------

--
-- Table structure for table `creditedsubject`
--

CREATE TABLE `creditedsubject` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `subjectCode` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `validations` int(11) NOT NULL,
  `student_number` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `units` int(2) NOT NULL,
  `course` varchar(100) NOT NULL,
  `major` int(11) NOT NULL,
  `verdict` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditedsubject`
--

INSERT INTO `creditedsubject` (`id`, `name`, `subject`, `subjectCode`, `grade`, `validations`, `student_number`, `status`, `units`, `course`, `major`, `verdict`, `year`, `month`, `week`) VALUES
(1, 'Electives 3', 'Electives 3', 'COEN1123', '1.0', 0, '2018-00001- MN-1', 0, 6, 'BS Computer Engineer', 0, '', 2018, 'April', 0),
(2, 'Electives 3   ', 'Electives 3   ', 'COEN1123    ', '1.0     ', 1, '2018-00001- MN-1 ', 0, 6, 'BS Computer Engineer  ', 0, '', 2018, 'April', 0),
(3, 'gjl', 'gjl', '`ertyiop', 'ertyuiop', 1, 'weyuiopDGHJKL;e', 0, 0, 'ertyuiop', 0, '', 2018, 'April', 0),
(4, 'tyjl;', 'tyjl;', 'ey;', 'fghjkl', 0, '123456', 0, 0, 'fghjkl', 0, '', 2018, 'April', 0);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `id` int(10) NOT NULL,
  `Term` varchar(20) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Major` varchar(150) NOT NULL,
  `prerequisite` varchar(50) NOT NULL,
  `corequisite` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `Units` int(5) NOT NULL,
  `numofmodules` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`id`, `Term`, `Course`, `Major`, `prerequisite`, `corequisite`, `Subject`, `Code`, `Units`, `numofmodules`) VALUES
(1, '1', 'Bachelor of Science in Business Administration', 'Business Economics', '', '', 'The Life and Works of Jose Rizal', 'GE109', 3, 4),
(2, '1', 'Bachelor of Science in Business Administration', 'Business Economics', '', '', 'Mathematics, Science and Technology', 'GE110', 3, 7),
(3, '1', 'Bachelor of Science in Business Administration', 'Business Economics', 'lkjh', 'kjhg', 'Komunikasyon sa Pilipino	', 'GE11', 9, 1),
(4, '1', 'Bachelor of Science in Business Administration', 'Business Economics', '', '', 'Basic Microeconomics', 'BEC101', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dismiss`
--

CREATE TABLE `dismiss` (
  `id` int(4) NOT NULL,
  `studentname` varchar(100) NOT NULL,
  `studentnum` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `major` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dismiss`
--

INSERT INTO `dismiss` (`id`, `studentname`, `studentnum`, `course`, `major`) VALUES
(1, 'lakas', '986535', 'business', 'administration'),
(1, 'lakas', '986535', 'business', 'administration'),
(1, 'lakas', '986535', 'business', 'administration');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_new_address`
--

CREATE TABLE `enrollment_new_address` (
  `s_id` varchar(13) NOT NULL,
  `current` varchar(100) NOT NULL,
  `provincial` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_new_course`
--

CREATE TABLE `enrollment_new_course` (
  `s_id` varchar(13) NOT NULL,
  `entry_level` varchar(20) NOT NULL,
  `course` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_new_education`
--

CREATE TABLE `enrollment_new_education` (
  `s_id` varchar(13) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `last_address` varchar(100) NOT NULL,
  `last_course` varchar(50) NOT NULL,
  `last_grad` varchar(50) NOT NULL,
  `college_name` varchar(50) DEFAULT NULL,
  `college_address` varchar(100) DEFAULT NULL,
  `college_course` varchar(50) DEFAULT NULL,
  `college_grad` varchar(50) DEFAULT NULL,
  `hs_name` varchar(50) DEFAULT NULL,
  `hs_address` varchar(100) DEFAULT NULL,
  `hs_grad` varchar(50) DEFAULT NULL,
  `elem_name` varchar(50) DEFAULT NULL,
  `elem_address` varchar(100) DEFAULT NULL,
  `elem_grad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_new_employment`
--

CREATE TABLE `enrollment_new_employment` (
  `s_id` varchar(13) NOT NULL,
  `years` varchar(20) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_new_info`
--

CREATE TABLE `enrollment_new_info` (
  `s_id` varchar(13) NOT NULL,
  `title` varchar(5) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `bday` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  `citizenship` varchar(50) NOT NULL,
  `acr` varchar(50) DEFAULT NULL,
  `tel` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `dlc` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `enrollment_new_info`
--

INSERT INTO `enrollment_new_info` (`s_id`, `title`, `lname`, `fname`, `mname`, `bday`, `gender`, `citizenship`, `acr`, `tel`, `mobile`, `email`, `dlc`, `status`) VALUES
('', 'MR', 'Adami', 'Carlos Jonathan', 'Abedes', '1993-11-07', 'MALE', 'FILIPINO', 'NA', '901299', 'NA', 'cjadami@yahoo.com.ph', 'dlc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `examprogress`
--

CREATE TABLE `examprogress` (
  `id` int(11) NOT NULL,
  `studentname` varchar(50) NOT NULL,
  `subjectname` varchar(50) NOT NULL,
  `activity` varchar(50) NOT NULL,
  `datenow` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_monitoring`
--

CREATE TABLE `exam_monitoring` (
  `id` int(11) NOT NULL,
  `personnel` varchar(99) NOT NULL,
  `refnum` varchar(99) NOT NULL,
  `exam_name` varchar(99) NOT NULL,
  `student_number` varchar(99) NOT NULL,
  `exam_taken` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_returned` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_monitoring`
--

INSERT INTO `exam_monitoring` (`id`, `personnel`, `refnum`, `exam_name`, `student_number`, `exam_taken`, `exam_returned`) VALUES
(1, 'Pogi', '9482E0', 'w', 'w', '2018-04-01 05:54:55', '2018-04-01 05:55:13'),
(2, 'Pogi', '4C7152', 'e', 'e', '2018-04-01 05:55:07', NULL),
(3, 'Pogi', '2894A9', 'r', 'r', '2018-04-01 05:56:24', NULL),
(4, 'Pogi', 'F56B8C', 'qwe', 'qwe', '2018-04-02 09:51:31', '2018-04-02 09:52:36'),
(5, 'admin', '986250', 'qwer', '2013-00819-MN-0', '2018-04-13 19:14:55', '2018-04-13 19:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(7) NOT NULL,
  `fac_num` varchar(99) NOT NULL,
  `facultyname` varchar(60) NOT NULL,
  `contactnum` varchar(60) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `username` varchar(99) NOT NULL,
  `password` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `fac_num`, `facultyname`, `contactnum`, `subject`, `subjectcode`, `username`, `password`) VALUES
(1, 'F-00001', 'Toshinori Allmight', '7999999', 'Understanding the Self,Readings in Philippine History,The Contemporary World,', 'GE109,GE110,GE11,', 'allmight', 'allmight');

-- --------------------------------------------------------

--
-- Table structure for table `ge109_class1`
--

CREATE TABLE `ge109_class1` (
  `id` int(11) NOT NULL,
  `student_id` varchar(99) NOT NULL,
  `professor_id` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ge109_class1`
--

INSERT INTO `ge109_class1` (`id`, `student_id`, `professor_id`) VALUES
(1, '2-20132015', ''),
(2, '1-20132015', '');

-- --------------------------------------------------------

--
-- Table structure for table `ge109_class2`
--

CREATE TABLE `ge109_class2` (
  `id` int(11) NOT NULL,
  `student_id` varchar(99) NOT NULL,
  `professor_id` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(7) NOT NULL,
  `studentnum` varchar(88) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subject` varchar(88) NOT NULL,
  `units` int(11) NOT NULL,
  `course` varchar(88) NOT NULL,
  `major` varchar(55) NOT NULL,
  `faculty` varchar(99) NOT NULL,
  `module1` varchar(11) NOT NULL,
  `module2` varchar(11) NOT NULL,
  `module3` varchar(11) NOT NULL,
  `module4` varchar(11) NOT NULL,
  `module5` varchar(11) NOT NULL,
  `module6` varchar(11) NOT NULL,
  `module7` varchar(11) NOT NULL,
  `module8` varchar(11) NOT NULL,
  `module9` varchar(11) NOT NULL,
  `module10` varchar(11) NOT NULL,
  `SLAR` varchar(11) NOT NULL,
  `FE` varchar(11) NOT NULL,
  `OE` varchar(11) NOT NULL,
  `Grade` varchar(5) NOT NULL,
  `Remark` varchar(1) NOT NULL,
  `gradestatus` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `file_path` varchar(50) NOT NULL,
  `file_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `file_path`, `file_type`) VALUES
(0, 'uploads/Module_Grade/39b81bd12e46dc8c09d64f6de62cc', 'Module');

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-economics`
--

CREATE TABLE `liberal_arts-economics` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-english`
--

CREATE TABLE `liberal_arts-english` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` int(99) NOT NULL,
  `corequisite` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-history`
--

CREATE TABLE `liberal_arts-history` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `units` int(9) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-it`
--

CREATE TABLE `liberal_arts-it` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(99) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-journalism`
--

CREATE TABLE `liberal_arts-journalism` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corerequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-mathematics`
--

CREATE TABLE `liberal_arts-mathematics` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-pastoralstudies`
--

CREATE TABLE `liberal_arts-pastoralstudies` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-politicalscience`
--

CREATE TABLE `liberal_arts-politicalscience` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` int(99) NOT NULL,
  `subjectname` int(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-psychology`
--

CREATE TABLE `liberal_arts-psychology` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectcode` int(99) NOT NULL,
  `subjectname` int(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liberal_arts-sociology`
--

CREATE TABLE `liberal_arts-sociology` (
  `id` int(9) NOT NULL,
  `term` int(9) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(9) NOT NULL,
  `studentname` varchar(99) DEFAULT NULL,
  `Subjectcode` varchar(99) NOT NULL,
  `Subject` varchar(99) NOT NULL,
  `module1` varchar(50) DEFAULT NULL,
  `module2` varchar(50) DEFAULT NULL,
  `module3` varchar(50) DEFAULT NULL,
  `module4` varchar(50) DEFAULT NULL,
  `module5` varchar(50) DEFAULT NULL,
  `module6` varchar(50) DEFAULT NULL,
  `module7` varchar(50) DEFAULT NULL,
  `module8` varchar(50) DEFAULT NULL,
  `module9` varchar(50) DEFAULT NULL,
  `module10` varchar(50) DEFAULT NULL,
  `SLAR` varchar(50) DEFAULT NULL,
  `FE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `new_applicants`
--

CREATE TABLE `new_applicants` (
  `id` int(3) NOT NULL,
  `AID` int(10) NOT NULL,
  `ornumber` int(100) NOT NULL,
  `Subjects` varchar(50) NOT NULL,
  `Units` int(5) NOT NULL,
  `SNO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `num_prof`
--

CREATE TABLE `num_prof` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(99) NOT NULL,
  `num_of_prof` int(11) NOT NULL,
  `assigned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studentacademic`
--

CREATE TABLE `studentacademic` (
  `studentnum` varchar(10) NOT NULL,
  `Term` int(2) NOT NULL,
  `section` int(2) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `course` varchar(99) NOT NULL,
  `major` varchar(99) NOT NULL,
  `status` varchar(99) NOT NULL,
  `address` varchar(99) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` int(55) NOT NULL,
  `birthday` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentacademic`
--

INSERT INTO `studentacademic` (`studentnum`, `Term`, `section`, `student_name`, `course`, `major`, `status`, `address`, `email`, `contact`, `birthday`) VALUES
('1', 7, 1, 'Milano, Roland A.', '', '', '', '', '', 0, ''),
('2', 2, 2, 'Alliah', 'Business', 'Economics', 'active', 'pasig', 'email@email.com', 909900, 'nov. 6'),
('3', 4, 1, 'xtine', 'IT', 'Game Dev', 'inactive', 'cavite', 'xtinegaming@gmail.com', 2147483647, 'january 31'),
('1', 7, 1, 'Milano, Roland A.', '', '', '', '', '', 0, ''),
('2', 2, 2, 'Alliah', 'Business', 'Economics', 'active', 'pasig', 'email@email.com', 909900, 'nov. 6'),
('3', 4, 1, 'xtine', 'IT', 'Game Dev', 'inactive', 'cavite', 'xtinegaming@gmail.com', 2147483647, 'january 31'),
('1', 7, 1, 'Milano, Roland A.', '', '', '', '', '', 0, ''),
('2', 2, 2, 'Alliah', 'Business', 'Economics', 'active', 'pasig', 'email@email.com', 909900, 'nov. 6'),
('3', 4, 1, 'xtine', 'IT', 'Game Dev', 'inactive', 'cavite', 'xtinegaming@gmail.com', 2147483647, 'january 31');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(7) NOT NULL,
  `studentfname` varchar(60) NOT NULL,
  `studentmname` varchar(60) NOT NULL,
  `studentlname` varchar(60) NOT NULL,
  `studentnum` varchar(60) NOT NULL,
  `Term` int(2) NOT NULL,
  `course` varchar(60) NOT NULL,
  `major` varchar(60) NOT NULL,
  `status` varchar(50) NOT NULL,
  `enrolledsubjects` varchar(100) NOT NULL,
  `paidsubjects` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contactnum` varchar(25) NOT NULL,
  `gender` varchar(22) NOT NULL,
  `birthday` varchar(50) NOT NULL,
  `placeofbirth` varchar(99) NOT NULL,
  `nationality` varchar(99) NOT NULL,
  `religion` varchar(99) NOT NULL,
  `prevschool` varchar(55) NOT NULL,
  `civilstatus` varchar(55) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `UnitsTaken` int(99) NOT NULL,
  `date_enrolled` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `studentfname`, `studentmname`, `studentlname`, `studentnum`, `Term`, `course`, `major`, `status`, `enrolledsubjects`, `paidsubjects`, `address`, `email`, `contactnum`, `gender`, `birthday`, `placeofbirth`, `nationality`, `religion`, `prevschool`, `civilstatus`, `username`, `password`, `UnitsTaken`, `date_enrolled`) VALUES
(1, 'daniel james', 'merencillo', 'punzalan', '1-20132015', 3, 'Bachelor of Science in Business Administration', 'Business Economics', 'active', 'GE109,', '', 'pasig city', 'juandelacruz@yahoo.com', '09753724217', 'female', '9/08/1990', 'cebu', 'american', 'roman catholic', 'hogwarts', 'widowed', 'djmp', 'djmp', 3, '2017-03-03'),
(2, 'justine', 'sanvictores', 'crisostomo', '2-20132015', 3, 'Bachelor of Science in Business Administration', 'Business Economics', 'active', 'GE109,', '', 'a', 'a', 'a', 'female', '13/03/1996', 'a', 'a', 'a', 'a', 'separated', 'panget', 'panget', 3, '2017-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `subjectperterm`
--

CREATE TABLE `subjectperterm` (
  `id` int(99) NOT NULL,
  `studentnum` varchar(100) NOT NULL,
  `enrolledsubjects` varchar(100) NOT NULL,
  `sy` varchar(99) NOT NULL,
  `units` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectperterm`
--

INSERT INTO `subjectperterm` (`id`, `studentnum`, `enrolledsubjects`, `sy`, `units`) VALUES
(1, '1-20132015', 'GE109,GE110,GE11,PE1,', '3-2018-2019', 11),
(2, '1-20132015', 'GE109,GE110,GE11,BEC101,', '3-2018-2019', 12),
(3, '1-20132015', 'GE109,BEC102,GE101,', '3-2018-2019', 9),
(4, '1-20132015', 'GE109,GE110,GE11,', '3-2018-2019', 9),
(5, '1-20132015', 'GE109,GE110,GE11,BEC101,BEC102,CBM101,', '3-2018-2019', 18),
(6, '1-20132015', 'GE109,GE110,GE11,BEC101,BEC102,CBM101,', '3-2018-2019', 18),
(7, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(8, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(9, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(10, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(11, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(12, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(13, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(14, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(15, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(16, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6),
(17, '1-20132015', 'GE109,GE110,', '3-2018-2019', 6);

-- --------------------------------------------------------

--
-- Table structure for table `subj_prof`
--

CREATE TABLE `subj_prof` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(99) NOT NULL,
  `class_num` int(11) NOT NULL,
  `professors` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbcredited`
--

CREATE TABLE `tbcredited` (
  `id` int(3) NOT NULL,
  `studentname` varchar(60) NOT NULL,
  `SNO` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Units` int(5) NOT NULL,
  `course` varchar(50) NOT NULL,
  `major` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcredited`
--

INSERT INTO `tbcredited` (`id`, `studentname`, `SNO`, `Subject`, `Units`, `course`, `major`) VALUES
(1, '', '', '', 0, '', ''),
(2, '', '', '', 0, '', ''),
(3, '', '', '', 0, '', ''),
(4, '', '', '', 0, '', ''),
(5, '', '', '', 0, '', ''),
(6, '', '', '', 0, '', ''),
(7, '', '', '', 0, '', ''),
(8, '', '', '', 0, 'Course', ''),
(9, '', '', '', 0, 'Course', ''),
(10, '', '', '', 0, 'Course', ''),
(11, '', '', '', 0, 'Course', ''),
(12, '', '', '', 0, 'Course', ''),
(13, '', '', '', 0, 'Course', ''),
(14, '', '', '', 0, 'Course', ''),
(15, '', '', '', 0, 'Course', ''),
(16, '', '', '', 0, 'Course', ''),
(17, '', '', '', 0, 'Course', ''),
(18, '', '', 'Subject1', 1, 'BS Business Administration', ''),
(19, '', '', 'Subject1', 1, 'BS Business Administration', ''),
(1, '', '', '', 0, '', ''),
(2, '', '', '', 0, '', ''),
(3, '', '', '', 0, '', ''),
(4, '', '', '', 0, '', ''),
(5, '', '', '', 0, '', ''),
(6, '', '', '', 0, '', ''),
(7, '', '', '', 0, '', ''),
(8, '', '', '', 0, 'Course', ''),
(9, '', '', '', 0, 'Course', ''),
(10, '', '', '', 0, 'Course', ''),
(11, '', '', '', 0, 'Course', ''),
(12, '', '', '', 0, 'Course', ''),
(13, '', '', '', 0, 'Course', ''),
(14, '', '', '', 0, 'Course', ''),
(15, '', '', '', 0, 'Course', ''),
(16, '', '', '', 0, 'Course', ''),
(17, '', '', '', 0, 'Course', ''),
(18, '', '', 'Subject1', 1, 'BS Business Administration', ''),
(19, '', '', 'Subject1', 1, 'BS Business Administration', ''),
(1, '', '', '', 0, '', ''),
(2, '', '', '', 0, '', ''),
(3, '', '', '', 0, '', ''),
(4, '', '', '', 0, '', ''),
(5, '', '', '', 0, '', ''),
(6, '', '', '', 0, '', ''),
(7, '', '', '', 0, '', ''),
(8, '', '', '', 0, 'Course', ''),
(9, '', '', '', 0, 'Course', ''),
(10, '', '', '', 0, 'Course', ''),
(11, '', '', '', 0, 'Course', ''),
(12, '', '', '', 0, 'Course', ''),
(13, '', '', '', 0, 'Course', ''),
(14, '', '', '', 0, 'Course', ''),
(15, '', '', '', 0, 'Course', ''),
(16, '', '', '', 0, 'Course', ''),
(17, '', '', '', 0, 'Course', ''),
(18, '', '', 'Subject1', 1, 'BS Business Administration', ''),
(19, '', '', 'Subject1', 1, 'BS Business Administration', '');

-- --------------------------------------------------------

--
-- Table structure for table `teachersubject`
--

CREATE TABLE `teachersubject` (
  `id` int(11) NOT NULL,
  `fac_num` varchar(99) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `course` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachersubject`
--

INSERT INTO `teachersubject` (`id`, `fac_num`, `subject`, `section`, `course`, `level`) VALUES
(1, 'F-00001', 'GE109', '1', 'Business Administration', '1'),
(2, 'F-00001', 'GE110', '1', 'Business Administration', '1'),
(3, 'F-00001', 'GE11', '1', 'Business Administration', '1');

-- --------------------------------------------------------

--
-- Table structure for table `withcomreq`
--

CREATE TABLE `withcomreq` (
  `id` int(3) NOT NULL,
  `StudentName` varchar(60) NOT NULL,
  `student_num` varchar(50) NOT NULL,
  `Course` varchar(60) NOT NULL,
  `Major` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withcomreq`
--

INSERT INTO `withcomreq` (`id`, `StudentName`, `student_num`, `Course`, `Major`) VALUES
(1, 'sikatuna', '001', 'business', 'econ'),
(1, 'sikatuna', '001', 'business', 'econ'),
(1, 'sikatuna', '001', 'business', 'econ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `admission_course`
--
ALTER TABLE `admission_course`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `a_id` (`a_id`);

--
-- Indexes for table `businessadministration_businesseconomics`
--
ALTER TABLE `businessadministration_businesseconomics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businessadministration_financialmanagement`
--
ALTER TABLE `businessadministration_financialmanagement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businessadministration_humanresourcemanagement`
--
ALTER TABLE `businessadministration_humanresourcemanagement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businessadministration_marketingmanagement`
--
ALTER TABLE `businessadministration_marketingmanagement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businessadministration_operationsmanagement`
--
ALTER TABLE `businessadministration_operationsmanagement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subject_count`
--
ALTER TABLE `class_subject_count`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `creditedsubject`
--
ALTER TABLE `creditedsubject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_monitoring`
--
ALTER TABLE `exam_monitoring`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ge109_class1`
--
ALTER TABLE `ge109_class1`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ge109_class2`
--
ALTER TABLE `ge109_class2`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-economics`
--
ALTER TABLE `liberal_arts-economics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-english`
--
ALTER TABLE `liberal_arts-english`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-history`
--
ALTER TABLE `liberal_arts-history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-it`
--
ALTER TABLE `liberal_arts-it`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-journalism`
--
ALTER TABLE `liberal_arts-journalism`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-mathematics`
--
ALTER TABLE `liberal_arts-mathematics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-pastoralstudies`
--
ALTER TABLE `liberal_arts-pastoralstudies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-politicalscience`
--
ALTER TABLE `liberal_arts-politicalscience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-psychology`
--
ALTER TABLE `liberal_arts-psychology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liberal_arts-sociology`
--
ALTER TABLE `liberal_arts-sociology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `num_prof`
--
ALTER TABLE `num_prof`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjectperterm`
--
ALTER TABLE `subjectperterm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `subj_prof`
--
ALTER TABLE `subj_prof`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `teachersubject`
--
ALTER TABLE `teachersubject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `businessadministration_businesseconomics`
--
ALTER TABLE `businessadministration_businesseconomics`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `businessadministration_financialmanagement`
--
ALTER TABLE `businessadministration_financialmanagement`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `businessadministration_humanresourcemanagement`
--
ALTER TABLE `businessadministration_humanresourcemanagement`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `businessadministration_marketingmanagement`
--
ALTER TABLE `businessadministration_marketingmanagement`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `businessadministration_operationsmanagement`
--
ALTER TABLE `businessadministration_operationsmanagement`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `class_subject_count`
--
ALTER TABLE `class_subject_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `creditedsubject`
--
ALTER TABLE `creditedsubject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exam_monitoring`
--
ALTER TABLE `exam_monitoring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ge109_class1`
--
ALTER TABLE `ge109_class1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ge109_class2`
--
ALTER TABLE `ge109_class2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-economics`
--
ALTER TABLE `liberal_arts-economics`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-english`
--
ALTER TABLE `liberal_arts-english`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-history`
--
ALTER TABLE `liberal_arts-history`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-it`
--
ALTER TABLE `liberal_arts-it`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-journalism`
--
ALTER TABLE `liberal_arts-journalism`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-mathematics`
--
ALTER TABLE `liberal_arts-mathematics`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-pastoralstudies`
--
ALTER TABLE `liberal_arts-pastoralstudies`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-politicalscience`
--
ALTER TABLE `liberal_arts-politicalscience`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-psychology`
--
ALTER TABLE `liberal_arts-psychology`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `liberal_arts-sociology`
--
ALTER TABLE `liberal_arts-sociology`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `num_prof`
--
ALTER TABLE `num_prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subjectperterm`
--
ALTER TABLE `subjectperterm`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `subj_prof`
--
ALTER TABLE `subj_prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teachersubject`
--
ALTER TABLE `teachersubject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
