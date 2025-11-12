-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2025 at 03:18 PM
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
-- Database: `findflights`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('sarb', 'singh');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `name` varchar(20) NOT NULL,
  `passport_no` varchar(20) NOT NULL,
  `flight_no` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `to` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `company` varchar(20) NOT NULL,
  `class` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`name`, `passport_no`, `flight_no`, `from`, `to`, `date`, `company`, `class`) VALUES
('Sarb', 'Z9876543', 'FL192', 'Mumbai', 'Beijing', '2025-03-17', 'Air China', 'Business'),
('jeet', 'Z9876543', 'FL130', 'Kolkata', 'Bali', '2025-04-30', 'Garuda Indonesia', 'First class'),
('dar', 'Z9876545', 'FL192', 'Mumbai', 'Beijing', '2025-03-17', 'Air China', 'First class'),
('jasif', 'Z9876544', 'FL005', 'mukundnagar', 'delhigate', '2025-04-21', 'Mi', 'First class'),
('singh', 'Z9876544', 'FL005', 'mukundnagar', 'delhigate', '2025-04-21', 'Mi', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`name`, `phone`, `email`, `message`) VALUES
('rajnish', '8329764439', 'rajnish3256@gmail.com', 'delay FL001\r\n'),
('rajnish', '8329764439', 'rajnish3256@gmail.com', 'Delay flight 1010'),
('rajnish', '8329764439', 'rajnish3256@gmail.com', 'Delay flight 1010'),
('sarbjeet', '8482834379', 'sarbjeet8482@gmail.com', 'lougage lost in FL105'),
('sarbjeet', '8482834379', 'sarbjeet8482@gmail.com', 'lougage lost in FL105'),
('raj', '253214154465', 'raj123@gmail.com', 'Ac not working in FL125'),
('jasif', '8482834379', 'jasif123@gmail.com', 'DElay flight FL001'),
('jasif', '8482834379', 'jasif123@gmail.com', 'delay fight 0041'),
('singh', '8482834379', 'Singh123@gmail.com', 'Staff behaviour is not good'),
('dar', '8329764439', 'dar123@gmail.com', 'Staff is not good in FL005'),
('jeet', '8010051388', 'jeet123@gmail.com', 'pakit gum gaya flighte ne FL005'),
('Sarbjeet', '08482834379', 'sarbjeet8482@gmail.com', 'ascdfv');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) NOT NULL,
  `to_city` varchar(20) NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `company_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `price`, `company_name`) VALUES
('FL102', 'Dubai', 'Pune', '2025-02-20', '2025-02-25', 40000, 'Air India'),
('FL103', 'Bangalore', 'Dubai', '2025-04-03', '2025-04-03', 38000, 'Emirates'),
('FL104', 'Hyderabad', 'Sydney', '2025-04-04', '2025-04-06', 72000, 'Qantas'),
('FL105', 'Chennai', 'Paris', '2025-04-05', '2025-04-06', 62000, 'Air France'),
('FL106', 'Pune', 'Tokyo', '2025-04-06', '2025-04-08', 68000, 'Japan Airlines'),
('FL107', 'Jaipur', 'Singapore', '2025-04-07', '2025-04-07', 27000, 'Singapore Airlines'),
('FL108', 'Ahmedabad', 'Hong Kong', '2025-04-08', '2025-04-09', 48000, 'Cathay Pacific'),
('FL109', 'Lucknow', 'Rome', '2025-04-09', '2025-04-10', 67000, 'Alitalia'),
('FL110', 'Kolkata', 'Frankfurt', '2025-04-10', '2025-04-11', 68000, 'Lufthansa'),
('FL111', 'Lakhnow', 'Mumbai', '2025-03-18', '2025-03-18', 7820, 'Air India'),
('FL112', 'Mumbai', 'Los Angeles', '2025-04-12', '2025-04-14', 80000, 'Delta Airlines'),
('FL113', 'Bangalore', 'Chicago', '2025-04-13', '2025-04-15', 78000, 'United Airlines'),
('FL114', 'Hyderabad', 'Bangkok', '2025-04-14', '2025-04-14', 28000, 'Thai Airways'),
('FL115', 'Chennai', 'Madrid', '2025-04-15', '2025-04-16', 69000, 'Iberia'),
('FL116', 'Pune', 'Berlin', '2025-04-16', '2025-04-18', 65000, 'Lufthansa'),
('FL117', 'Jaipur', 'Seoul', '2025-04-17', '2025-04-18', 54000, 'Korean Air'),
('FL118', 'Ahmedabad', 'Cape Town', '2025-04-18', '2025-04-20', 72000, 'South African Airway'),
('FL119', 'Lucknow', 'Moscow', '2025-04-19', '2025-04-20', 58000, 'Aeroflot'),
('FL120', 'Kolkata', 'Bali', '2025-04-20', '2025-04-21', 40000, 'Garuda Indonesia'),
('FL121', 'Delhi', 'Singapore', '2025-04-21', '2025-04-21', 27000, 'Singapore Airlines'),
('FL122', 'Mumbai', 'Hong Kong', '2025-04-22', '2025-04-23', 48000, 'Cathay Pacific'),
('FL123', 'Bangalore', 'Bangkok', '2025-04-23', '2025-04-23', 28000, 'Thai Airways'),
('FL124', 'Hyderabad', 'Rome', '2025-04-24', '2025-04-25', 67000, 'Alitalia'),
('FL125', 'Chennai', 'Madrid', '2025-04-25', '2025-04-26', 69000, 'Iberia'),
('FL126', 'Pune', 'Frankfurt', '2025-04-26', '2025-04-27', 68000, 'Lufthansa'),
('FL127', 'Jaipur', 'Seoul', '2025-04-27', '2025-04-28', 54000, 'Korean Air'),
('FL128', 'Ahmedabad', 'Cape Town', '2025-04-28', '2025-04-30', 72000, 'South African Airway'),
('FL129', 'Lucknow', 'Moscow', '2025-04-29', '2025-04-30', 58000, 'Aeroflot'),
('FL130', 'Kolkata', 'Bali', '2025-04-30', '2025-05-01', 36000, 'Garuda Indonesia'),
('FL131', 'Delhi', 'Toronto', '2025-05-01', '2025-05-02', 67000, 'Air Canada'),
('FL132', 'Mumbai', 'Los Angeles', '2025-05-02', '2025-05-04', 80000, 'Delta Airlines'),
('FL133', 'Bangalore', 'Chicago', '2025-05-03', '2025-05-05', 78000, 'United Airlines'),
('FL134', 'Hyderabad', 'Dubai', '2025-05-04', '2025-05-04', 37000, 'Emirates'),
('FL135', 'Chennai', 'London', '2025-05-05', '2025-05-06', 56000, 'British Airways'),
('FL136', 'Pune', 'Paris', '2025-05-06', '2025-05-07', 62000, 'Air France'),
('FL137', 'Jaipur', 'New York', '2025-05-07', '2025-05-09', 75000, 'Air India'),
('FL138', 'Ahmedabad', 'Tokyo', '2025-05-08', '2025-05-10', 59000, 'Japan Airlines'),
('FL139', 'Lucknow', 'Sydney', '2025-05-09', '2025-05-11', 71000, 'Qantas'),
('FL140', 'Kolkata', 'Bangkok', '2025-05-10', '2025-05-10', 28000, 'Thai Airways'),
('FL141', 'Delhi', 'Dubai', '2025-05-01', '2025-05-02', 35000, 'Emirates'),
('FL142', 'Mumbai', 'London', '2025-05-03', '2025-05-04', 56000, 'British Airways'),
('FL143', 'Bangalore', 'New York', '2025-05-05', '2025-05-07', 78000, 'Air India'),
('FL144', 'Hyderabad', 'Singapore', '2025-05-06', '2025-05-07', 27000, 'Singapore Airlines'),
('FL145', 'Chennai', 'Paris', '2025-05-08', '2025-05-09', 62000, 'Air France'),
('FL146', 'Pune', 'Tokyo', '2025-05-10', '2025-05-11', 68000, 'Japan Airlines'),
('FL147', 'Jaipur', 'Bangkok', '2025-05-12', '2025-05-13', 28000, 'Thai Airways'),
('FL148', 'Ahmedabad', 'Hong Kong', '2025-05-14', '2025-05-15', 48000, 'Cathay Pacific'),
('FL149', 'Lucknow', 'Rome', '2025-05-16', '2025-05-17', 67000, 'Alitalia'),
('FL150', 'Kolkata', 'Berlin', '2025-05-18', '2025-05-19', 65000, 'Lufthansa'),
('FL151', 'Delhi', 'Toronto', '2025-05-20', '2025-05-21', 67000, 'Air Canada'),
('FL152', 'Mumbai', 'Los Angeles', '2025-05-22', '2025-05-24', 80000, 'Delta Airlines'),
('FL153', 'Bangalore', 'Chicago', '2025-05-25', '2025-05-27', 78000, 'United Airlines'),
('FL154', 'Hyderabad', 'Bangkok', '2025-05-28', '2025-05-28', 28000, 'Thai Airways'),
('FL155', 'Chennai', 'Madrid', '2025-05-29', '2025-05-30', 69000, 'Iberia'),
('FL156', 'Pune', 'Frankfurt', '2025-06-01', '2025-06-02', 68000, 'Lufthansa'),
('FL157', 'Jaipur', 'Seoul', '2025-06-03', '2025-06-04', 54000, 'Korean Air'),
('FL158', 'Ahmedabad', 'Cape Town', '2025-06-05', '2025-06-07', 72000, 'South African Airway'),
('FL159', 'Lucknow', 'Moscow', '2025-06-08', '2025-06-09', 58000, 'Aeroflot'),
('FL160', 'Kolkata', 'Bali', '2025-06-10', '2025-06-11', 40000, 'Garuda Indonesia'),
('FL161', 'Delhi', 'Singapore', '2025-06-12', '2025-06-12', 27000, 'Singapore Airlines'),
('FL162', 'Mumbai', 'Hong Kong', '2025-06-13', '2025-06-14', 48000, 'Cathay Pacific'),
('FL163', 'Bangalore', 'Bangkok', '2025-06-15', '2025-06-15', 28000, 'Thai Airways'),
('FL164', 'Hyderabad', 'Rome', '2025-06-16', '2025-06-17', 67000, 'Alitalia'),
('FL165', 'Chennai', 'Madrid', '2025-06-18', '2025-06-19', 69000, 'Iberia'),
('FL166', 'Pune', 'Frankfurt', '2025-06-20', '2025-06-21', 68000, 'Lufthansa'),
('FL167', 'Jaipur', 'Seoul', '2025-06-22', '2025-06-23', 54000, 'Korean Air'),
('FL168', 'Ahmedabad', 'Cape Town', '2025-06-24', '2025-06-26', 72000, 'South African Airway'),
('FL169', 'Lucknow', 'Moscow', '2025-06-27', '2025-06-28', 58000, 'Aeroflot'),
('FL170', 'Kolkata', 'Bali', '2025-06-29', '2025-06-30', 40000, 'Garuda Indonesia'),
('FL171', 'Delhi', 'Abu Dhabi', '2025-03-01', '2025-03-02', 36000, 'Etihad'),
('FL172', 'Mumbai', 'Sydney', '2025-03-03', '2025-03-04', 75000, 'Qantas'),
('FL173', 'Bangalore', 'San Francisco', '2025-03-05', '2025-03-07', 82000, 'Air India'),
('FL174', 'Hyderabad', 'Kuala Lumpur', '2025-03-08', '2025-03-09', 25000, 'Malaysia Airlines'),
('FL175', 'Chennai', 'Amsterdam', '2025-03-10', '2025-03-11', 64000, 'KLM'),
('FL176', 'Pune', 'Shanghai', '2025-03-12', '2025-03-13', 71000, 'China Eastern'),
('FL177', 'Jaipur', 'Doha', '2025-03-14', '2025-03-15', 29000, 'Qatar Airways'),
('FL178', 'Ahmedabad', 'Istanbul', '2025-03-16', '2025-03-17', 55000, 'Turkish Airlines'),
('FL179', 'Lucknow', 'Vienna', '2025-03-18', '2025-03-19', 60000, 'Austrian Airlines'),
('FL180', 'Kolkata', 'Zurich', '2025-03-20', '2025-03-21', 63000, 'Swiss Air'),
('FL181', 'Delhi', 'Johannesburg', '2025-03-22', '2025-03-23', 72000, 'South African Airway'),
('FL182', 'Mumbai', 'Washington', '2025-03-24', '2025-03-26', 88000, 'United Airlines'),
('FL183', 'Bangalore', 'Melbourne', '2025-03-27', '2025-03-29', 77000, 'Qantas'),
('FL184', 'Hyderabad', 'Brussels', '2025-03-30', '2025-03-31', 68000, 'Brussels Airlines'),
('FL185', 'Chennai', 'Toronto', '2025-03-02', '2025-03-03', 74000, 'Air Canada'),
('FL186', 'Pune', 'Los Angeles', '2025-03-04', '2025-03-05', 86000, 'Delta Airlines'),
('FL187', 'Jaipur', 'Dubai', '2025-03-06', '2025-03-07', 31000, 'Emirates'),
('FL188', 'Ahmedabad', 'New York', '2025-03-08', '2025-03-10', 91000, 'American Airlines'),
('FL189', 'Lucknow', 'Berlin', '2025-03-11', '2025-03-12', 62000, 'Lufthansa'),
('FL190', 'Kolkata', 'Seoul', '2025-03-13', '2025-03-14', 51000, 'Korean Air'),
('FL191', 'Delhi', 'Copenhagen', '2025-03-15', '2025-03-16', 65000, 'SAS'),
('FL192', 'Mumbai', 'Beijing', '2025-03-17', '2025-03-18', 70000, 'Air China'),
('FL193', 'Bangalore', 'Madrid', '2025-03-19', '2025-03-20', 69000, 'Iberia'),
('FL194', 'Hyderabad', 'Rome', '2025-03-21', '2025-03-22', 66000, 'Alitalia'),
('FL195', 'Chennai', 'Stockholm', '2025-03-23', '2025-03-24', 71000, 'SAS'),
('FL196', 'Pune', 'Helsinki', '2025-03-25', '2025-03-26', 74000, 'Finnair'),
('FL197', 'Jaipur', 'Oslo', '2025-03-27', '2025-03-28', 68000, 'Norwegian Air'),
('FL198', 'Ahmedabad', 'Lisbon', '2025-03-29', '2025-03-31', 69000, 'TAP Portugal'),
('FL199', 'Lucknow', 'Moscow', '2025-03-02', '2025-03-03', 59000, 'Aeroflot'),
('FL005', 'mukundnagar', 'delhigate', '2025-04-21', '2025-04-22', 50000, 'Mi'),
('FL005', 'mukundnagar', 'delhigate', '2025-04-21', '2025-04-22', 50000, 'Mi');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offer_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `discount` int(5) NOT NULL,
  `valid_until` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offer_id`, `title`, `discount`, `valid_until`) VALUES
(10, 'diwali', 25, '2025-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `passanger_details`
--

CREATE TABLE `passanger_details` (
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passanger_details`
--

INSERT INTO `passanger_details` (`username`, `email`, `phone_no`, `password`, `gender`) VALUES
('jeet', 'singh8482@gmail.com', '8482834379', 'rehan8482', 'male'),
('sarb', 'sarb7575@gmail.com', '8546253614', '000000009', 'male'),
('jasif', 'jasif7575@gmail.com', '8546253658', '12341234', 'female'),
('dar', 'dar@gmail.com', '8329764439', '123456', 'female'),
('', '', '', '', 'male'),
('', '', '', '', 'male'),
('', '', '', '', 'male'),
('', '', '', '', 'male'),
('', '', '', '', 'male'),
('', '', '', '', 'male'),
('', '', '', '', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
