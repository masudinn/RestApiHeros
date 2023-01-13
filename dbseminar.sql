-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2023 at 11:25 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbseminar`
--

-- --------------------------------------------------------

--
-- Table structure for table `heros`
--

CREATE TABLE `heros` (
  `id` int(4) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(100) NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `heros`
--

INSERT INTO `heros` (`id`, `name`, `description`, `date`, `image`) VALUES
(10, 'Implementation Of WorkAgreement And Outsourcing and The Impact To The Workers', 'Oleh\nIbu Dr. Ratna Juwita, M.Si\nDosen Manajemen Universitas MDP\n\nDan\n\nBapak Alden Nelson, ST., MM\nDosen Manajemen Universitas Internasional Batam', '2 April 2022 pukul 13.30 - 15.00', 'webinarsatu.png'),
(11, 'WEBINAR INTERNASIONAL', 'Dengan judul:\nInternet of Things And Business Survivability: Catching Up To An Accelerating Opportunity', 'Selasa, 12 April 2022\nPukul 10.00-11.00 pagi', 'webinardua.png'),
(12, 'Universitas MDP x Universiti Utara Malaysia (UUM) Webinar Collaboration', 'Let\'s join international webinar\n\nTopic :\nWomen Entrepreneurship & resilience : current and future research\n\nInvited Speaker :\nNurwahida binti Fuad, B.B.A., M.B.A & P.hd (candidate)\n\nSpeaker :\nYulistia, S.Kom., M.T.I\nWakil Rektor IV Universitas MDP', '19 April 2022 Pukul 10.00 - 11.00 AM', 'webinartiga.png'),
(13, 'International Webinar\n\"Strategy Management And Company Sustainabilitty : Imperatives And Paradoxes\"', 'Jangan ketinggalan ya! ????????', '26 April 2022\nPukul: 10.00-11.00', 'webinarempat.png'),
(14, 'Join International Webinar\n\nSocial Science Research Beyond The Academy', 'Speaker :\nDr. Anton Arisman, M.Si\nUniversitas MDP\n\nInvited Speaker :\nAssociate Professor Gs. Dr. Abdul Manaf Bohari\nUniversiti Utara Malaysia', '24 Mei 2022\n10 - 11 AM', 'webinarlima.png'),
(15, 'Join International Webinar\n\nHuman Resources Management In Academic & Practises And Human Resource Technology Research & Trends', 'Invited Speaker :\nAssociate Professor Gs. Dr. Abdul Manaf Bohari\nUniversiti Utara Malaysia\n\n&\n\nProfessor Dr Abdul Halim Majid\nUniversiti Utara Malaysia\n', '31 Mei 2022\n10 - 11 AM', 'webinarnam.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heros`
--
ALTER TABLE `heros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heros`
--
ALTER TABLE `heros`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
