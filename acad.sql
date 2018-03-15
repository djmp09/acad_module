-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 09:03 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acad`
--

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
-- Table structure for table `businessadministration_businesseconomics`
--

CREATE TABLE `businessadministration_businesseconomics` (
  `id` int(100) NOT NULL,
  `term` int(100) NOT NULL,
  `subjectcode` varchar(99) NOT NULL,
  `subjectname` varchar(99) NOT NULL,
  `units` int(20) NOT NULL,
  `prerequisite` varchar(99) NOT NULL,
  `corequisite` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businessadministration_businesseconomics`
--

INSERT INTO `businessadministration_businesseconomics` (`id`, `term`, `subjectcode`, `subjectname`, `units`, `prerequisite`, `corequisite`) VALUES
(1, 1, 'GE101', 'Understanding the Self', 3, '', ''),
(2, 1, 'GE102', 'Readings in Philippine History ', 3, '', ''),
(3, 1, 'GE103', 'The Contemporary World', 3, '', ''),
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
(24, 4, 'BEP101', 'Basic Macroeconomics', 3, '', 'BEP102,BEP103'),
(25, 4, 'BEC103', 'Taxation', 3, 'BEC101,BEC102', 'BEC104,BEC105,BEC106'),
(26, 4, 'PE4', 'Physical Education 4', 2, 'PE3', ''),
(27, 5, 'BEP102', 'History of Economic Thoughts', 3, 'BEP101', 'BEP104,BEP105,BEP106'),
(28, 5, 'BEP103', 'Advanced Microeconomics', 3, 'BEP101', 'BEP104,BEP105,BEP106'),
(31, 5, 'BEC104', 'Good Governance & SR', 3, 'BEC103', 'BEC107'),
(32, 5, 'BEC105', 'Human Resource Management', 3, 'BEC103', 'BEC107'),
(33, 5, 'BEC106', 'International Business & Trade', 3, 'BEC103', 'BEC107'),
(34, 6, 'BEP104', 'Project Development Management', 3, 'BEP102,BEP103', 'BEP107,BEP108'),
(35, 6, 'BEP105', 'Advanced Macroeconomics', 3, 'BEP102,BEP103', 'BEP107,BEP108'),
(36, 6, 'BEP106', 'International Economics', 3, 'BEP102,BEP103', 'BEP107,BEP108'),
(37, 6, 'BAE101', 'Economic Development', 3, '', 'BAE107'),
(38, 6, 'BAE105', 'Special Topics in Business Mgt.', 3, '', 'BAE107'),
(39, 7, 'BEC107', 'Business Research 1; Methodology', 3, 'BEC104,BEC105,BEC106', 'BEC108'),
(40, 7, 'BEP107', 'Managerial Economics', 3, 'BEP104,BEP105,BEP106', ''),
(41, 7, 'BEP108', 'Monetary & Fiscal Economics', 3, 'BEP104,BEP105,BEP106', ''),
(42, 8, 'BEC108', 'Business Research 2: Final Output', 3, 'BEC107', ''),
(43, 8, 'BAE103', 'Labor Economics', 3, 'BAE107', ''),
(44, 8, 'PRAC', 'Internship (600Hrs) BE Major', 6, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `num_prof`
--

CREATE TABLE `num_prof` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(99) NOT NULL,
  `num_of_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `num_prof`
--

INSERT INTO `num_prof` (`id`, `subject_code`, `num_of_prof`) VALUES
(1, 'GE101', 3);

-- --------------------------------------------------------

--
-- Table structure for table `subj_prof`
--

CREATE TABLE `subj_prof` (
  `id` int(11) NOT NULL,
  `subject_code` varchar(99) NOT NULL,
  `professors` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subj_prof`
--

INSERT INTO `subj_prof` (`id`, `subject_code`, `professors`) VALUES
(1, 'GE101', 'qweqw,sdf,cbvcb,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
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
-- Indexes for table `num_prof`
--
ALTER TABLE `num_prof`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `subject_code` (`subject_code`);

--
-- Indexes for table `subj_prof`
--
ALTER TABLE `subj_prof`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businessadministration_businesseconomics`
--
ALTER TABLE `businessadministration_businesseconomics`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `num_prof`
--
ALTER TABLE `num_prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `subj_prof`
--
ALTER TABLE `subj_prof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
