-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 09:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab-appointment-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `apid` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `test` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`apid`, `patient_name`, `date`, `time`, `test`) VALUES
(1, 'Tamasha', '2024-03-17', '14:41', 'bloodTests'),
(2, 'Tamasha', '2024-03-19', '21:29', 'bloodTests'),
(3, 'Chamalka', '2024-03-27', '13:00', 'liverFunctionTests'),
(4, 'Tharindu', '2024-03-25', '16:10', 'urinalysis'),
(5, 'Yasara', '2024-03-26', '06:20', 'imagingTests'),
(7, 'Moneesha', '2024-03-26', '06:20', 'bloodTests'),
(9, 'Tamasha', '2024-03-27', '13:43', 'urinalysis'),
(10, 'Chethiya', '2024-03-28', '17:00', 'bloodTests'),
(11, 'Tamasha', '2024-03-30', '06:00', 'microbiologyTests'),
(12, 'Chamalka', '2024-03-27', '08:15', 'liverFunctionTests'),
(13, 'Senusha', '2024-04-02', '17:50', 'imagingTests');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(10) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `p_name`, `dob`, `gender`, `email`, `password`, `contact`) VALUES
(1, 'Tamasha', '2024-03-18', 'Female', 'tamashakavindi674@gmail.com', 'tama', '0764243675'),
(2, 'Chethiya', '2001-03-09', 'Male', 'chethiyanimesha19@gmail.com', 'aaaa', '076240098'),
(6, 'Chamalka', '2024-03-04', 'Female', 'chamalkag@gmail.com', '123', '0765457625'),
(7, 'Tharindu', '2024-03-12', 'Male', 'tharindu@gmail.com', '345', '0764243674'),
(8, 'Chamudi', '2024-03-06', 'Female', 'chamudi@gmail.com', '123', '0764243674'),
(9, 'Sheron', '2024-03-06', 'Male', 'sheron@gmail.com', '123', '0765457625'),
(14, 'Damidu', '2024-03-05', 'Male', 'damidu@gmail.com', '123', '0765457625'),
(15, 'Moneesha', '2024-03-22', 'Female', 'moneesha@gmail.com', '123', '0764243674'),
(16, 'Senusha', '2024-03-06', 'Female', 'senu@gmail.com', '123', '0764243674');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payid` int(11) NOT NULL,
  `patient_name` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  `cardno` varchar(200) NOT NULL,
  `exdate` varchar(200) NOT NULL,
  `cvv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payid`, `patient_name`, `amount`, `cardno`, `exdate`, `cvv`) VALUES
(1, 'Tamasha', '4000', '1200 4598 5637 5287', '09/24', 456),
(2, 'Senusha', '3456', '1234 1234 1234 1234', '12/31', 123),
(3, 'Chamalka', '2900', '1234 5678 5367 7357', '07/15', 123),
(4, 'Sheron', '2300', '1234 5675 3472 3828', '09/16', 234),
(5, 'Senusha', '1900', '2345 3456 4242 3431', '12/23', 211),
(6, 'Moneesha', '1300', '6783 7386 2572 8268', '07/25', 321),
(7, 'Chamalka', '4560', '2567 3782 3762 3872', '09/18', 222),
(8, 'Chethiya', '4567', '1457 2736 3762 3762', '06/27', 332),
(9, 'Tamasha', '3900', '1565 3625 3752 3752', '06/31', 654),
(11, 'Chamalka', '435', '2676 2673 4863 4762', '07/26', 554),
(14, 'Yasara', '1200', '6433 4536 7777 2457', '10/16', 876),
(18, 'Sheron', '3800', '2678 2567 2871 3782', '10/29', 342);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `rid` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `pdf_file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`rid`, `patient_name`, `pdf_file`) VALUES
(390, 'Chethiya', 'C:fakepathMedical Report.pdf'),
(490, 'Yasara', 'C:fakepathMedical Report.pdf'),
(900, 'Chethiya', 'C:fakepathMedical Report.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `technician`
--

CREATE TABLE `technician` (
  `tid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technician`
--

INSERT INTO `technician` (`tid`, `name`, `gender`, `email`, `username`, `password`) VALUES
(1, 'John', 'Male', 'j@gmail.com', 'abclab', '123');

-- --------------------------------------------------------

--
-- Table structure for table `test_details`
--

CREATE TABLE `test_details` (
  `test_id` int(10) NOT NULL,
  `patient_name` varchar(200) NOT NULL,
  `test_type` varchar(200) NOT NULL,
  `test_date` varchar(200) NOT NULL,
  `test_time` varchar(200) NOT NULL,
  `technician_name` varchar(200) NOT NULL,
  `referring_doctor` varchar(200) NOT NULL,
  `result_DETAILS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_details`
--

INSERT INTO `test_details` (`test_id`, `patient_name`, `test_type`, `test_date`, `test_time`, `technician_name`, `referring_doctor`, `result_DETAILS`) VALUES
(1, 'Tamasha', 'Liver Function Tests', '2024-03-18', '08:00', 'P.Anuththara', 'Dr.Lakshman', 'good'),
(2, 'Chethiya', 'Genetic Tests', '2024-03-14', '07:30', 'Y.K.Alwis', 'Dr.Lakshman', 'good'),
(5, 'Senusha', 'Imaging Tests', '2024-03-27', '10:26', 'P.Anuththara', 'Dr.Senadi', 'good'),
(6, 'Monee', 'Microbiology Tests', '2024-04-02', '10:40', 'C.T.Attanayaka', 'Dr.Senadi', 'good'),
(7, 'Sandali', 'Liver Function Tests', '2024-03-26', '10:00', 'P.Anuththara', 'Dr.Lakshman', 'good'),
(8, 'john', 'Microbiology Tests', '2024-03-27', '07:12', 'P.Anuththara', 'Dr.Ananda', 'bad'),
(9, 'yash', 'Urinalysis', '2024-03-27', '08:15', 'D.I.K.Thilakarathna', 'Dr.Lakshman', 'bad'),
(10, 'iru', 'Liver Function Tests', '2024-03-26', '10:20', 'D.I.K.Thilakarathna', 'Dr.Ananda', 'good'),
(11, 'dias', 'Microbiology Tests', '2024-03-05', '11:24', 'D.I.K.Thilakarathna', 'Dr.Ananda', 'good');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`apid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payid`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `technician`
--
ALTER TABLE `technician`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `test_details`
--
ALTER TABLE `test_details`
  ADD PRIMARY KEY (`test_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `apid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
