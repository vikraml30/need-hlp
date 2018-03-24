-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 24, 2018 at 09:39 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpingc_admin_panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `name`, `image_url`) VALUES
(2, 'Banner1', '/uploads/1507623490_banner.png'),
(3, 'Banner 2', '/uploads/1507623467_bus_banner.png'),
(4, 'Banner 3', '/uploads/1507623876_food_banner.png'),
(8, 'Banner 4', '/uploads/1519122946_food.png'),
(12, 'Test2', '/uploads/1520272839_pic_1.png'),
(11, 'Test1', '/uploads/1520272798_banner copy 2 - Copy.png');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(20) NOT NULL,
  `user_mobile` varchar(20) NOT NULL,
  `requirement` varchar(255) NOT NULL,
  `dateofvisit` date NOT NULL,
  `timeofvisit` time NOT NULL,
  `noofperson` int(10) NOT NULL,
  `serviceaddress` text NOT NULL,
  `status` enum('active','completed','canceled') DEFAULT 'active',
  `sent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_mobile`, `requirement`, `dateofvisit`, `timeofvisit`, `noofperson`, `serviceaddress`, `status`, `sent`) VALUES
(1, '8237272827', 'SS', '2017-09-20', '09:37:00', 2, 'pune', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(20) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `description`, `user_id`, `image_url`) VALUES
(1, 'Honda City', '56463285', 2, '/uploads/1506878821_banner.png'),
(2, 'Civic', 'fine car with high comfort', 2, '/uploads/1516207894_car.png'),
(3, 'Renault', 'small sized car', 2, '/uploads/1521479743_scooter-clipart-home-delivery-13.png');

-- --------------------------------------------------------

--
-- Table structure for table `car_booking`
--

CREATE TABLE `car_booking` (
  `id` int(20) NOT NULL,
  `user_mobile` varchar(20) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `time` time NOT NULL,
  `noofperson` int(10) NOT NULL,
  `car_type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','completed','canceled') NOT NULL DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_booking`
--

INSERT INTO `car_booking` (`id`, `user_mobile`, `destination`, `from_address`, `from_date`, `to_date`, `time`, `noofperson`, `car_type`, `created_date`, `sent`, `status`) VALUES
(1, '8237272827', 'nashik', 'nashik', '2017-09-15', '2017-09-15', '17:00:00', 5, 'sedan', '2017-09-28 05:57:37', 1, ''),
(31, '8237272827', 'aurangabad', 'pune', '2017-10-12', '2018-01-10', '01:00:00', 3, 'sedan', '2018-02-20 05:51:00', 1, 'active'),
(32, '8763164644', 'srgada', 'rrpur', '2018-03-07', '2018-03-23', '17:20:00', 60, 'SUV', '2018-03-05 05:17:00', 1, 'active'),
(6, '9438831220', 'Khandagiri ', 'patrapada', '2017-10-14', '2017-10-14', '22:31:00', 3, 'SEDDAN', '2017-10-14 02:01:46', 0, ''),
(8, '7205586281', 'saragada', 'bbsr', '2017-11-04', '2017-11-04', '00:00:00', 2, 'SUV', '2017-11-04 04:38:44', 1, ''),
(9, '8237272827', 'aurangaad', 'pume', '2017-11-08', '2017-11-08', '04:50:00', 2, 'SEDDAN', '2017-11-07 07:19:52', 1, ''),
(10, '8908532061', 'puri', 'sum hospital', '2017-12-14', '2017-12-14', '00:00:00', 4, 'SEDDAN', '2017-12-14 11:38:45', 0, ''),
(11, '8237272827', 'aurangabad', 'pune', '2018-01-04', '2018-01-04', '13:41:00', 2, 'HATCHBACK', '2018-01-04 08:11:08', 1, ''),
(14, '7745024760', 'aurangaad', 'pune', '2018-01-16', '2018-01-16', '16:47:00', 2, 'SEDDAN', '2018-01-16 11:17:40', 1, 'active'),
(15, '7745024760', 'pune', 'jath', '2018-01-16', '2018-01-16', '00:00:00', 3, 'SEDDAN', '2018-01-16 11:33:39', 1, 'active'),
(39, '7205586281', 'kolkatq', 'bbsr', '2018-03-20', '2018-03-22', '09:15:00', 90, 'SUV', '2018-03-19 05:22:00', 0, 'active'),
(38, '7205586281', 'kolkata', 'jagamara', '2018-03-20', '2018-03-23', '00:00:00', 4, 'HATCHBACK', '2018-03-19 05:16:00', 0, 'active'),
(21, '8895192839', 'Bhubaneswar3', 'Bonaigarh', '2018-01-30', '2018-01-31', '06:17:00', 2, 'SEDDAN', '2018-01-22 11:48:30', 0, 'active'),
(37, '8763164644', 'hshsu', 'hdhe', '2018-03-05', '2018-03-05', '15:10:00', 2, 'SEDDAN', '2018-03-05 05:42:00', 0, 'active'),
(23, '7205586281', 'rekela', 'bbsr', '2018-02-08', '2018-02-09', '07:45:00', 5, 'SUV', '2018-02-06 08:17:19', 1, 'active'),
(25, '9665504639', 'sangali', 'pune', '2018-02-14', '2018-02-16', '00:00:00', 5, 'SEDDAN', '2018-02-14 08:08:14', 1, 'active'),
(26, '7205586281', 'balsore', 'bbsr', '2018-02-15', '2018-02-15', '17:14:00', 6, 'SUV', '2018-02-15 03:44:57', 1, 'active'),
(36, '8763164644', 'hhshw', 'bbrh', '2018-03-22', '2018-03-05', '23:10:00', 2, 'SEDDAN', '2018-03-05 05:41:00', 0, 'active'),
(35, '8763164644', 'rrpur', 'bbs', '2018-03-05', '2018-03-05', '22:56:00', 2, 'SEDDAN', '2018-03-05 05:27:00', 0, 'active'),
(34, '8763164644', 'hd we hd', 'syxy', '2018-03-05', '2018-03-05', '13:52:00', 2, 'SEDDAN', '2018-03-05 05:22:00', 0, 'active'),
(33, '7205586281', 'dbsbs', 'jdbd', '2018-03-15', '2018-03-21', '16:30:00', 52, 'SUV', '2018-03-05 05:22:00', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(100) NOT NULL,
  `user_id` int(20) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `user_id`, `image_url`) VALUES
(4, 'Electrician', 'This is regarding plumbing work', 2, '/uploads/1505502051_pngelectrician.png'),
(6, 'Car Mechanic', 'This is regarding repair work', 2, '/uploads/1505545982_carmmm.jpg'),
(9, 'Carpenter', 'This service is regarding to carpenter', 2, '/uploads/1505502772_carpenter-1453880_960_720.png'),
(11, 'Labour', 'This service is regarding to labour', 2, '/uploads/1505561493_wrkr2.jpg'),
(12, 'Car Booking', 'This service is regarding to car booking', 2, '/uploads/1505502892_car1.png'),
(13, 'Food', 'This service is regarding to food', 2, '/uploads/1505503532_food1.gif'),
(22, 'Ac Service', 'installation and repair', 2, '/uploads/1505552727_ac1.jpg'),
(16, ' Personal Trainer', 'dance', 2, '/uploads/1505500691_trainer-gif.gif'),
(17, 'Photographer', 'also vdo graphy', 2, '/uploads/1505545905_poto3.jpeg'),
(18, 'Packers And Movers', ' home ', 2, '/uploads/1505495229_pnm.png'),
(19, 'Astrology', 'all astrology work', 2, '/uploads/1505554044_astrology.jpg'),
(20, 'Painter', 'home based service', 2, '/uploads/1505503692_painter123.jpg'),
(21, 'Laundry', 'yufuy', 2, '/uploads/1505552603_landry1.png'),
(25, 'Home Cleaning', 'full house cleaning', 2, '/uploads/1505558545_housecleaning-clipart-13.jpg'),
(26, 'Interior Designing', 'house and corporate office designs ', 2, '/uploads/1505553826_id1.png'),
(27, 'Pest Controll', 'all types of pest controll', 2, '/uploads/1505558053_Killer-Bill-LOGO.png'),
(28, 'Refridgerator Repair', 'fridge repair', 2, '/uploads/1505553938_refrigerator-repair-services.png'),
(29, 'Bridal Mackup', 'for marriage', 2, '/uploads/1505558486_makup1.jpg'),
(30, 'Yoga Trainer', 'yoga training', 2, '/uploads/1505558796_yoga1.png'),
(31, 'Dance Trainer', 'bollywood', 2, '/uploads/1505558888_dance1.png'),
(32, 'Consultancy Service', 'about registration and charted acoounting', 2, '/uploads/1505559255_icons-1cs-v3-06.png'),
(33, 'Physiotherapy', 'desi and modern both', 2, '/uploads/1505559054_physical-therapy-icon-23.jpg'),
(34, 'Bar Tender', 'for party bar boy', 2, '/uploads/1505560758_images.jpg'),
(54, 'Plumber', 'hgfhyufyh', 2, '/uploads/1518848526_th.jfif'),
(36, 'Pc & Laptop Repair', 'repair', 2, '/uploads/1505560996_computer-and-laptop-repair.png'),
(37, 'Florist And Decoration', 'party decoration', 2, '/uploads/1505561441_Screen-Shot-2016-02-20-at-7.51.50-AM.png'),
(38, 'Washing Machine Repair', 'same', 2, '/uploads/1505561469_wm2.jpg'),
(39, 'Charted Accountant', 'for small business', 2, '/uploads/1505562467_main-banner-1.png'),
(40, 'Mehendi Artist', 'for girls', 2, '/uploads/1505561708_474704349.jpg'),
(41, 'Dj', 'dj for party', 2, '/uploads/1505562118_Icon.png'),
(42, 'Cctv Installation', 'repair also', 2, '/uploads/1505563388_pict--security-camera-1-tv,-photo-and-video---vector-stencils-library.png--diagram-flowchart-example.png'),
(43, 'Insurance Agents', 'all', 2, '/uploads/1505563447_insurance-icon.png'),
(44, 'Lawer', 'legalities', 2, '/uploads/1505563491_avatar2-512.png'),
(45, 'Web Developer', 'designing also', 2, '/uploads/1505563614_61-512.png'),
(46, 'Android App Dev', 'app developer', 2, '/uploads/1505581650_seo-and-web-development-04-512.png'),
(47, 'Car Wash', 'car wash', 2, '/uploads/1505582699_CarWashIcon.png'),
(48, 'Dry Cleaner', 'good cloths', 2, '/uploads/1505582597_l1.png'),
(50, 'T-shirt Print', 'all types of tshirt branding', 2, '/uploads/1505636088_tshirtIcon_3.png'),
(51, 'Branding', 'all types of work like card ,mug,glass,tshirt,id etc ', 2, '/uploads/1505638451_4e2ab486f4b354b798e6e82a79d1e6c3.png'),
(52, 'Veterinary Doctor', '', 2, '/uploads/1505639080_veterinarian.png');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `category`, `item`, `price`) VALUES
(1, 'breakfast', 'pohe', 20),
(3, 'lunch', 'Methi', 25),
(4, 'breakfast', 'Upma', 18),
(5, 'lunch', 'Alo gobi', 35),
(6, 'dinner', 'Shev bhaji', 100),
(7, 'dinner', 'Kaju masala', 120),
(8, 'breakfast', 'Tea', 10),
(9, 'lunch', 'jeera rice', 30),
(10, 'lunch', 'rice half plate', 20),
(11, 'lunch', 'chicken curry', 60),
(12, 'lunch', 'dal fry', 20),
(13, 'lunch', 'alu gobi bhaja', 20);

-- --------------------------------------------------------

--
-- Table structure for table `food_booking`
--

CREATE TABLE `food_booking` (
  `id` int(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  `total_price` varchar(20) NOT NULL,
  `user_mobile` varchar(15) NOT NULL,
  `repeate_order` tinyint(1) NOT NULL,
  `created_date` date NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('active','completed','canceled') NOT NULL DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_booking`
--

INSERT INTO `food_booking` (`id`, `category`, `item`, `quantity`, `price`, `total_price`, `user_mobile`, `repeate_order`, `created_date`, `sent`, `status`) VALUES
(1, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2017-10-02', 0, ''),
(2, 'Lunch', 'rice half plate', '1', '20', '20', '7205586281', 0, '2017-10-02', 0, ''),
(3, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-10-02', 0, ''),
(4, 'Breakfast', 'Tea', '1', '10', '10', '7205586281', 0, '2017-10-02', 0, ''),
(5, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-10-02', 0, ''),
(6, 'Lunch', 'dal fry', '1', '20', '20', '7205586281', 0, '2017-10-02', 0, ''),
(7, 'Lunch', 'rice half plate', '1', '20', '20', '7205586281', 0, '2017-10-04', 0, ''),
(8, 'Lunch', 'dal fry', '1', '20', '20', '7205586281', 0, '2017-10-04', 0, ''),
(9, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2017-10-04', 0, ''),
(10, 'Breakfast', 'Tea', '1', '10', '10', '7205586281', 0, '2017-10-04', 0, ''),
(11, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-10-04', 0, ''),
(12, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2017-10-04', 0, ''),
(13, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-10-04', 0, ''),
(14, 'Lunch', 'Methi', '4', '25', '100', '8237272827', 1, '2017-10-13', 0, ''),
(15, 'Lunch', 'jeera rice', '1', '30', '30', '8237272827', 1, '2017-10-13', 0, ''),
(16, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-11-06', 0, ''),
(17, 'Lunch', 'rice half plate', '1', '20', '20', '7205586281', 0, '2017-11-06', 0, ''),
(18, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2017-11-06', 0, ''),
(19, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-11-06', 0, ''),
(20, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-11-06', 0, ''),
(21, 'Breakfast', 'Tea', '1', '10', '10', '7205586281', 0, '2017-11-06', 0, ''),
(22, 'Lunch', 'dal fry', '1', '20', '20', '7205586281', 0, '2017-11-06', 0, ''),
(23, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2017-11-06', 0, ''),
(24, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2017-11-06', 0, ''),
(25, 'Lunch', 'rice half plate', '2', '20', '40', '7205586281', 0, '2017-11-06', 0, ''),
(26, 'Breakfast', 'Tea', '1', '10', '10', '8237272827', 0, '2017-12-13', 0, ''),
(27, 'Breakfast', 'pohe', '1', '20', '20', '8237272827', 0, '2017-12-13', 0, ''),
(28, 'Breakfast', 'Upma', '1', '18', '18', '8237272827', 0, '2017-12-13', 0, ''),
(29, 'Lunch', 'dal fry', '1', '20', '20', '7205586281', 0, '2017-12-13', 0, ''),
(30, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-12-13', 0, ''),
(31, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-12-13', 0, ''),
(32, 'Breakfast', 'Tea', '1', '10', '10', '7205586281', 0, '2017-12-13', 0, ''),
(33, 'Lunch', 'rice half plate', '1', '20', '20', '7205586281', 0, '2017-12-13', 0, ''),
(34, 'Lunch', 'rice half plate', '2', '20', '40', '7205586281', 0, '2017-12-13', 0, ''),
(35, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2017-12-13', 0, ''),
(36, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2017-12-13', 0, ''),
(37, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2017-12-13', 0, ''),
(38, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2017-12-13', 0, ''),
(39, 'Lunch', 'chicken curry', '1', '60', '60', '7205586281', 0, '2017-12-13', 0, ''),
(40, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2017-12-13', 0, ''),
(41, 'Lunch', 'Alo gobi', '1', '35', '35', '7205586281', 0, '2017-12-13', 0, ''),
(42, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(43, 'Breakfast', 'Tea', '1', '10', '10', '7205586281', 0, '2018-01-04', 0, ''),
(44, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2018-01-04', 0, ''),
(45, 'Lunch', 'dal fry', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(46, 'Lunch', 'Alo gobi', '1', '35', '35', '7205586281', 0, '2018-01-04', 0, ''),
(47, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2018-01-04', 0, ''),
(48, 'Dinner', 'Kaju masala', '1', '120', '120', '7205586281', 0, '2018-01-04', 0, ''),
(49, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(50, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2018-01-04', 0, ''),
(51, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(52, 'Lunch', 'rice half plate', '2', '20', '40', '7205586281', 0, '2018-01-04', 0, ''),
(53, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(54, 'Lunch', 'rice half plate', '1', '20', '20', '7205586281', 0, '2018-01-04', 0, ''),
(55, 'Lunch', 'Alo gobi', '1', '35', '35', '7205586281', 0, '2018-01-04', 0, ''),
(56, 'Lunch', 'chicken curry', '1', '60', '60', '7205586281', 0, '2018-01-04', 0, ''),
(57, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2018-01-04', 0, ''),
(58, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2018-01-04', 0, ''),
(59, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-17', 0, 'active'),
(60, 'Lunch', 'Methi', '1', '25', '25', '7205586281', 0, '2018-01-17', 0, 'active'),
(61, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2018-01-17', 0, 'active'),
(62, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-17', 0, 'active'),
(63, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-01-17', 0, 'active'),
(64, 'Lunch', 'Methi', '1', '25', '25', '7205586281', 0, '2018-01-17', 0, 'active'),
(65, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2018-01-17', 0, 'active'),
(66, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2018-01-17', 0, 'active'),
(67, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2018-01-17', 0, 'active'),
(68, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2018-01-17', 0, 'active'),
(69, 'Dinner', 'Shev bhaji', '1', '100', '100', '8093715005', 0, '2018-01-18', 0, 'active'),
(70, 'Breakfast', 'pohe', '1', '20', '20', '8249007313', 0, '2018-02-04', 0, 'active'),
(71, 'Breakfast', 'Tea', '1', '10', '10', '8249007313', 0, '2018-02-04', 0, 'active'),
(72, 'Lunch', 'chicken curry', '1', '60', '60', '8249007313', 0, '2018-02-04', 0, 'active'),
(73, 'Breakfast', 'Upma', '1', '18', '18', '8249007313', 0, '2018-02-04', 0, 'active'),
(74, 'Breakfast', 'Upma', '1', '18', '18', '8280776293', 0, '2018-02-07', 0, 'active'),
(75, 'Lunch', 'chicken curry', '1', '60', '60', '7226878010', 0, '2018-02-07', 0, 'active'),
(76, 'Dinner', 'Shev bhaji', '1', '100', '100', '8093715005', 0, '2018-02-12', 0, 'active'),
(77, 'Dinner', 'Shev bhaji', '1', '100', '100', '8093715005', 0, '2018-02-12', 0, 'active'),
(78, 'Lunch', 'rice half plate', '1', '20', '20', '8763164644', 0, '2018-03-05', 0, 'active'),
(79, 'Lunch', 'Alo gobi', '1', '35', '35', '8763164644', 0, '2018-03-05', 0, 'active'),
(80, 'Lunch', 'rice half plate', '1', '20', '20', '8763164644', 0, '2018-03-05', 0, 'active'),
(81, 'Lunch', 'Alo gobi', '1', '35', '35', '8763164644', 0, '2018-03-05', 0, 'active'),
(82, 'Dinner', 'Shev bhaji', '6', '100', '600', '8763164644', 0, '2018-03-05', 0, 'active'),
(83, 'Dinner', 'Shev bhaji', '6', '100', '600', '8763164644', 0, '2018-03-08', 0, 'active'),
(84, 'Lunch', 'Alo gobi', '1', '35', '35', '8763164644', 0, '2018-03-08', 0, 'active'),
(85, 'Lunch', 'rice half plate', '1', '20', '20', '8763164644', 0, '2018-03-08', 0, 'active'),
(86, 'Lunch', 'Methi', '1', '25', '25', '8763164644', 0, '2018-03-10', 0, 'active'),
(87, 'Lunch', 'rice half plate', '1', '20', '20', '8763164644', 0, '2018-03-10', 0, 'active'),
(88, 'Breakfast', 'pohe', '1', '20', '20', '8763164644', 0, '2018-03-10', 0, 'active'),
(89, 'Lunch', 'Alo gobi', '1', '35', '35', '8763164644', 0, '2018-03-10', 0, 'active'),
(90, 'Dinner', 'Shev bhaji', '6', '100', '600', '8763164644', 0, '2018-03-10', 0, 'active'),
(91, 'Lunch', 'chicken curry', '1', '60', '60', '7226878010', 0, '2018-03-14', 0, 'active'),
(92, 'Dinner', 'Kaju masala', '1', '120', '120', '7226878010', 0, '2018-03-14', 0, 'active'),
(93, 'Lunch', 'chicken curry', '1', '60', '60', '7226878010', 0, '2018-03-14', 0, 'active'),
(94, 'Lunch', 'rice half plate', '1', '20', '20', '7226878010', 0, '2018-03-14', 0, 'active'),
(95, 'Breakfast', 'pohe', '1', '20', '20', '7205586281', 0, '2018-03-19', 0, 'active'),
(96, 'Breakfast', 'Upma', '1', '18', '18', '7205586281', 0, '2018-03-19', 0, 'active'),
(97, 'Dinner', 'Shev bhaji', '1', '100', '100', '7205586281', 0, '2018-03-19', 0, 'active'),
(98, 'Lunch', 'jeera rice', '1', '30', '30', '7205586281', 0, '2018-03-19', 0, 'active'),
(99, 'Dinner', 'Shev bhaji', '6', '100', '600', '8763164644', 0, '2018-03-19', 0, 'active'),
(100, 'Lunch', 'Alo gobi', '1', '35', '35', '8763164644', 0, '2018-03-19', 0, 'active'),
(101, 'Breakfast', 'pohe', '1', '20', '20', '8763164644', 0, '2018-03-19', 0, 'active'),
(102, 'Breakfast', 'pohe', '1', '20', '20', '8763164644', 0, '2018-03-19', 0, 'active'),
(103, 'Lunch', 'Methi', '1', '25', '25', '8763164644', 0, '2018-03-19', 0, 'active'),
(104, 'Lunch', 'rice half plate', '1', '20', '20', '8763164644', 0, '2018-03-19', 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `notification_to_user`
--

CREATE TABLE `notification_to_user` (
  `id` int(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_to_user`
--

INSERT INTO `notification_to_user` (`id`, `mobile`, `title`, `description`, `created_date`) VALUES
(1, '8237272827', 'Your bookings', 'Mahaveer will come to pick you up', '2017-11-03'),
(2, '7205586281', 'booking confirm ', 'thank u for choosing us.it will be great journey ahead. happy journey .', '2017-11-04'),
(3, '7205586281', 'booking confirm ', 'thank u for choosing us.it will be great journey ahead. happy journey .', '2017-11-04'),
(4, '7205586281', 'bookiing confrm    test 1', 'no descriptio of this things book your self', '2017-11-04'),
(5, '7205586281', 'bookiing confrm    test 1', 'no descriptio of this things book your self', '2017-11-04'),
(6, '7205586281', 'THANK U FOR CHOOSING US', 'UR SELECTIoN IS  GUD ', '2017-11-04'),
(7, '7205586281', 'heyy', 'description', '2017-11-05'),
(8, '8237272827', 'Thanks For Intrest', 'Naresh will come for your service', '2017-11-07'),
(9, '8237272827', 'Thanks For Intrest', 'Naresh will come for your service', '2017-11-07'),
(10, '8237272827', 'Thanks For Intrest', 'Naresh will come for your service', '2017-11-07'),
(11, '8237272827', 'Thanks', 'Naresh will come for your service', '2017-11-07'),
(12, '8237272827', 'Hey', 'Dipak Will come', '2017-11-08'),
(13, '8237272827', 'Hey', 'Dipak Will come', '2017-11-08'),
(14, '8237272827', 'Booking Confirmation', 'Hey Dipak will come to you', '2017-11-08'),
(15, '8237272827', 'Booking Confirmation', 'Hey Dipak will come to you', '2017-11-08'),
(16, '8237272827', 'Booking Confirmation', 'Hey Dipak will come to you', '2017-11-08'),
(17, '8237272827', 'Booking Confirmation', 'Hey Dipak will come to you', '2017-11-08'),
(18, '8237272827', 'Booking Confirmation', 'Hey Dipak will come to you', '2017-11-08'),
(19, '7205586281', 'shjfswg', 'dgfghrg', '2017-11-09'),
(20, '7205586281', 'yfhgcvfkyug', 'oihiughihio', '2017-11-24'),
(21, '8237272827', 'Dipak is coming', 'Test', '2018-01-04'),
(22, '8237272827', 'Booking Confirmation', 'Test', '2018-01-04'),
(23, '8237272827', 'Booking Confirmation', 'Test', '2018-01-04'),
(24, '8237272827', 'Booking Confirmation', 'Test', '2018-01-04'),
(25, '8237272827', 'Booking Confirmation', 'Test', '2018-01-04'),
(26, '8237272827', 'Booking Confirmation', 'dd', '2018-01-08'),
(27, '8237272827', 'Booking Confirmation', 'vg', '2018-01-10'),
(28, '7745024760', 'Thanks For Intrest', 'thank you', '2018-01-16'),
(29, '7745024760', 'Thanks For Intrest', 'thank you', '2018-01-16'),
(30, '7205586281', 'responeded from the s provider', 'thnx for choosing us here u can find every thing', '2018-01-17'),
(31, '7205586281', 'booking confirm ', 'hey thnk u for choosing us hope you will enjoy the ride', '2018-01-17'),
(32, '7205586281', 'booking confirm ', 'hey thnk u for choosing us hope you will enjoy the ride', '2018-01-17'),
(33, '7205586281', 'booking cancelled', 'thank u for choosing us.it will be great journey ahead. happy journey .', '2018-01-17'),
(34, '7205586281', 'your booking confirm by sagar ranjan', 'thanks for choosing helpingcart hope yor ride will be as good as you', '2018-02-06'),
(35, '7205586281', 'thanx for chhosing us', '', '2018-02-07'),
(36, '9665504639', 'Booking Confirmation', 'Your car will arrived at 2.30 pm', '2018-02-14'),
(37, '8093715005', 'BOOKING CONFIRM BY ASHUTOSH NAYAK', 'THANK  SIR BOOKING FROM HELPINGCART.', '2018-02-15'),
(38, '7205586281', 'kugkgkgkgkgkgk', 'fdsdgdytdhttddgdgdgdd', '2018-02-19'),
(39, '8763164644', 'rinku pagal ', 'thnx for choosing ius . hehe', '2018-03-05'),
(40, '8237272827', 'Test', 'Test', '2018-03-14'),
(41, '8237272827', 'Your ride is ready', 'Ready for ride', '2018-03-19'),
(42, '8237272827', 'Your ride is ready', 'Ready for ride', '2018-03-19'),
(43, '8237272827', 'Your ride is ready', 'Ready for ride', '2018-03-19'),
(44, '7205586281', 'thanx for booking..', 'thanx for booking ashutosh nayak..our expert will conat ct you soon.', '2018-03-19'),
(45, '8763164644', 'bhakk', 'kichii darkar nai', '2018-03-19'),
(46, '8237272827', 'ty', 'test1', '2018-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(20) NOT NULL,
  `resource_id` int(20) NOT NULL,
  `ratings` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `service_type` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `user_id` int(20) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `first_name`, `last_name`, `address`, `service_type`, `email`, `city`, `state`, `mobile`, `user_id`, `image_url`) VALUES
(69, 'Brundaban', 'Sahoo', 'KALPANA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9437245358', 2, '/uploads/1519227287_ELECTRICIAN[1].jpg'),
(68, 'Prashant', 'Mohanty', 'SUNDARPADA', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9337596030', 2, '/uploads/1519227325_PLUMBER[1].jpg'),
(66, 'Youdhistria', 'Pradhan', 'KALPANA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9778192967', 2, '/uploads/1519226796_ELECTRICIAN.jpg'),
(31, 'Prasant Kumar', 'Mohapatra', 'BARAMUNDA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '7008375756', 2, '/uploads/1518793440_ELECTRICIAN.jpg'),
(32, 'Priti Kanta', 'Karan', 'BARAMUNDA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9776782520', 2, '/uploads/1518793522_ELECTRICIAN.jpg'),
(30, 'Panchanan', 'Panda', 'NAYAPALLI', 'Electrician', 'panchananp124@gmail.com', 'BHUBANESWAR', 'ODISHA', '7684004640', 2, '/uploads/1518793321_ELECTRICIAN.jpg'),
(55, 'Silan', 'Tarai', 'JAYDEV VIHAR', 'Android App Dev', '', 'BHUBANESWAR', 'ODISHA', '7609948257', 2, '/uploads/1519831289_SILAN TECH.jpg'),
(26, 'Udaya Kumar', 'Sethy', 'MANCHESWAR', 'Electrician', 'udayasethy2@gmail.com', 'BHUBANESWAR', 'ODISHA', '9658582040', 2, '/uploads/1518792794_ELECTRICIAN.jpg'),
(22, 'Sanjay', 'Mirkap', 'BHUBANESWAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9583304825', 2, '/uploads/1518791202_ELECTRICIAN.jpg'),
(28, 'Bhabani Sankar', 'Panigrahi', 'POKHARIPUT', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '8018340411', 2, '/uploads/1518793028_ELECTRICIAN.jpg'),
(29, 'Nilamani', 'Nayak', 'C.S PUR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9556005077', 2, '/uploads/1518793144_ELECTRICIAN.jpg'),
(27, 'Rohit Kumar', 'Das', 'NEAR SUM HOSPITAL', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '7381805814', 2, '/uploads/1518792911_ELECTRICIAN.jpg'),
(33, 'Jutan', 'Das', 'LAXMI SAGAR', 'Plumber', 'dpsolution1989@gmail.com', 'BHUBANESWAR', 'ODISHA', '9040776472', 2, '/uploads/1518848932_plumber.jfif'),
(34, 'Satya Ranjan', 'Samal', 'RUCHIKA MARKET', 'Plumber', 'stsupplyagency@gmail.com', 'BHUBANESWAR', 'ODISHA', '7606923134', 2, '/uploads/1518849201_th.jfif'),
(35, 'Satya Ranjan', 'Samal', 'BARAMUNDA', 'Carpenter', 'satyaranjansamal250@gmail.com', 'BHUBANESWAR', 'ODISHA', '9438166987', 2, '/uploads/1518849209_carpenter.jpg'),
(36, 'Rakesh', 'Balbantray', 'GHATIKIA', 'Plumber', 'rakeshbalbantray@gmail.com', 'BHUBANESWAR', 'ODISHA', '7873338887', 2, '/uploads/1518853420_PLUMBER.jpg'),
(37, 'Vairab', 'Nayak', 'POKHARI PUT', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9853760273', 2, '/uploads/1518853525_PLUMBER.jpg'),
(38, 'Umesh', 'Das', 'LAXMI SAGAR', 'Plumber', 'umeshdas516@gmail.com', 'BHUBANESWAR', 'ODISHA', '9861905023', 2, '/uploads/1518853688_PLUMBER.jpg'),
(39, 'Bharat Bhusan', 'Jena', 'KESURA CHHAK', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9853062606', 2, '/uploads/1518853791_PLUMBER.jpg'),
(40, 'Jutan', 'Das', 'LAXMI SAGAR', 'Plumber', 'dpsolution1989@gmail.com', 'BHUBANESWAR', 'ODISHA', '9040776472', 2, '/uploads/1518853942_PLUMBER.jpg'),
(41, 'Upendra', 'Rath', 'BAPUJI NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9337100537', 2, '/uploads/1518881944_ELECTRICIAN.jpg'),
(42, 'E', 'Pavithran', 'BAPUJI NAGAR', 'Ac Service', '', 'BHUBANESWAR', 'ODISHA', '9337100537', 2, '/uploads/1519114535_gfgf.jpg'),
(43, 'E', 'Pavithran', 'BAPUJI NAGAR', 'Refridgerator Repair', '', 'BHUBANESWAR', 'ODISHA', '9337100537', 2, '/uploads/1519114359_sagar.png'),
(44, 'Bhagaban', 'Sahu', 'BAPUJI NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9937142826', 2, '/uploads/1519105886_ELECTRICIAN.jpg'),
(45, 'Sudarsan', 'Lenka', 'BAPUJI NAGAR', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9937337672', 2, '/uploads/1519106273_PLUMBER.jpg'),
(46, 'Debasis', 'Padhi', 'PATIA', 'Electrician', 'padhidebasis105@gmail.com', 'BHUBANESWAR', 'ODISHA', '9777296441', 2, '/uploads/1519106973_ELECTRICIAN.jpg'),
(47, 'Sudhansu Sekhar', 'Das', 'SAHID NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9938756632', 2, '/uploads/1519107109_ELECTRICIAN.jpg'),
(50, 'S.k', 'Naquib', 'NAYAPALLI', 'Ac Service', '', 'BHUBANESWAR', 'ODISHA', '9861070609', 2, '/uploads/1519114581_gfgf.jpg'),
(49, 'S.k', 'Naquib', 'NAYAPALLI', 'Refridgerator Repair', '', 'BHUBANESWAR', 'ODISHA', '9861070609', 2, '/uploads/1519114406_sagar.png'),
(52, 'S.k', 'Naquib', 'NAYAPALLI', 'Washing Machine Repair', '', 'BHUBANESWAR', 'ODISHA', '9861070609', 2, '/uploads/1519114477_ranjan.jpg'),
(60, 'Prasan Kumar', 'Praharaj', 'KHARVEL NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9437278158', 2, '/uploads/1519130156_ELECTRICIAN.jpg'),
(53, 'Satya Ranjan', 'Samal', 'BARAMUNDA', 'Interior Designing', '', 'BHUBANESWAR', 'ODISHA', '7606923134', 2, '/uploads/1519108175_3d-designing-services-interior-design-children-room.jpg'),
(54, 'Silan', 'Tarai', 'JAYDEV VIHAR', 'Web Developer', '', 'BHUBANESWAR', 'ODISHA', '7609948257', 2, '/uploads/1519831261_SILAN TECH.jpg'),
(88, 'Balankeswar', 'Pradhan', 'BARAMUNDA', 'Painter', '', 'BHUBANESWAR', 'ODISHA', '9238523350', 2, '/uploads/1520242725_painter.jpg'),
(56, 'Sudeep', 'Sahoo', 'PATIA', 'Web Developer', 'info@sjsoftwaretechnology.com', 'BHUBANESWAR', 'ODISHA', '7992716118', 2, '/uploads/1519114280_turnup-web-development.png'),
(57, 'Sudeep', 'Sahoo', 'PATIA', 'Android App Dev', 'info@sjsoftwaretechnology.com', 'BHUBANESWAR', 'ODISHA', '7992716118', 2, '/uploads/1519109231_main-qimg-09ef047c56a950f6ce00a4e40bd05893-c.jpg'),
(58, 'Biswajit', 'Nayak', 'SAHID NAGAR', 'Pc & Laptop Repair', '', 'BHUBANESWAR', 'ODISHA', '9777369934', 2, '/uploads/1519113176_pc&laptop.jpg'),
(59, 'Rajendra Kumar', 'Lenka', 'SAHID NAGAR', 'Pc & Laptop Repair', 'bestech.solutions@gmail.com', 'BHUBANESWAR', 'ODISHA', '9237145514', 2, '/uploads/1519113653_pc&laptop.jpg'),
(61, 'Babaji ', 'Sahoo', 'SATYA NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9338280074', 2, '/uploads/1519129551_ELECTRICIAN.jpg'),
(62, 'Sudarsan', 'Nayak', 'DHARMA VIHAR', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '8637213700', 2, '/uploads/1519142787_PLUMBER.jpg'),
(63, 'Prakash', 'Swain', 'KHANDAGIRI', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9658688106', 2, '/uploads/1519142881_PLUMBER.jpg'),
(64, 'Tapas Kumar', 'Jena', 'PRAKRUTI VIHAR', 'Dry Cleaner', '', 'BHUBANESWAR', 'ODISHA', '7008590185', 2, '/uploads/1519188471_stock-vector-dry-cleaning-service-logo-template-405215104.jpg'),
(65, 'Tiki', 'Jena', 'BARAMUNDA', 'Dry Cleaner', '', 'BHUBANESWAR', 'ODISHA', '9437232032', 2, '/uploads/1519188559_stock-vector-dry-cleaning-service-logo-template-405215104.jpg'),
(70, 'Niranjan', 'Swain', 'KALPANA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9338297403', 2, '/uploads/1519310609_DYMOON SERVICES.jpg'),
(71, 'Babuli', 'Sahoo', 'JANPATH', 'Dj', '', 'BHUBANESWAR', 'ODISHA', '9861066901', 2, '/uploads/1519310699_IMG_20180222_180947.jpg'),
(72, 'Niranjan', 'Swain', 'KALPANA', 'Painter', '', 'BHUBANESWAR', 'ODISHA', '9338297403', 2, '/uploads/1519310793_DYMOON SERVICES.jpg'),
(73, 'Jagabandhu', 'Sahoo', 'KHARVEL NAGAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9090957879', 2, '/uploads/1519311118_IMG-20180222-WA0001_(2)[1].jpg'),
(74, 'Vairab', 'Nayak', 'BHIMATANGI', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '8895384324', 2, '/uploads/1519570095_PLUMBER.jpg'),
(75, 'G ', 'Ganesh', 'BAPUJI NAGAR', 'Dj', '', 'BHUBANESWAR', 'ODISHA', '7683864060', 2, '/uploads/1519570401_2773204-dj-wallpapers.png'),
(77, 'Kishore', 'Barik', 'NAYAPALLI', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9439372928', 2, '/uploads/1519570593_PLUMBER.jpg'),
(78, 'Pitabash', 'Bhaimal', 'NAYAPALLI', 'Carpenter', '', 'BHUBANESWAR', 'ODISHA', '9853726665', 2, '/uploads/1519571589_CARPENTER.jpg'),
(79, 'Kanhu Charan', 'Sahoo', 'PATRAPADA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9937523081', 2, '/uploads/1519721465_sri ram electrical.jpg'),
(80, 'Biswajit', 'Pradhan', 'PATRAPADA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '7064674381', 2, '/uploads/1519721591_biswanath electrical.jpg'),
(81, 'Bibekananda', 'Mallik', 'PATRAPADA', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9040840880', 2, '/uploads/1519721827_shree ganesh electrical&plumber.jpg'),
(82, 'Bibekananda', 'Mallik', 'PATRAPADA', 'Plumber', '', 'BHUBANESWAR', 'ODISHA', '9040840880', 2, '/uploads/1519721891_shree ganesh electrical&plumber.jpg'),
(83, 'Bijaya Kumar', 'Senapati', 'OLD TOWN', 'Electrician', 'senapatielectronics.service@gmail.com', 'BHUBANESWAR', 'ODISHA', '9437100241', 2, '/uploads/1519805724_senapati electrical.jpg'),
(84, 'Manoranjan', 'Biswal', 'POKHARIPUT', 'Plumber', 'sai.enterprise.bbsr@gmail.com', 'BHUBANESWAR', 'ODISHA', '9337833747', 2, '/uploads/1519805999_sai plumber.jpg'),
(85, 'Saroj Kumar', 'Panda', 'OLD TOWN', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9937139314', 2, '/uploads/1519806155_panda electronics.jpg'),
(86, 'Paramananda', 'Moharana', 'CHANDRASEKHARPUR', 'Carpenter', '', 'BHUBANESWAR', 'ODISHA', '9438101164', 2, '/uploads/1519831071_c.penter.JPG'),
(87, 'Ranjit', 'Sahu', 'SAILASHREE VIHAR', 'Electrician', '', 'BHUBANESWAR', 'ODISHA', '9438803525', 2, '/uploads/1519831199_appolo elec.jpg'),
(89, 'Gajendra Kumar', 'Sahoo', 'BARAMUNDA', 'Labour', '', 'BHUBANESWAR', 'ODISHA', '7978735041', 2, '/uploads/1520242817_lebour.jpg'),
(91, 'Vikram', 'Lahamge', 'clg road, d\'souza colony', 'Car Booking', 'vikram.lahamge@gmail.com', 'Pune', 'maharashtra', '8600616748', 2, '/uploads/1520931708_71-x0qqr2-L._UL1500_.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes`
--

CREATE TABLE `sms_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_codes`
--

INSERT INTO `sms_codes` (`id`, `user_id`, `code`, `status`, `created_at`) VALUES
(10, 5, '167554', 1, '2017-10-02 05:53:31'),
(12, 7, '385188', 0, '2017-10-04 13:57:35'),
(13, 8, '524497', 0, '2017-10-04 14:05:00'),
(15, 10, '822894', 1, '2017-10-04 14:10:19'),
(18, 11, '300954', 1, '2017-10-11 03:46:57'),
(34, 12, '161747', 1, '2018-01-04 03:56:32'),
(36, 9, '469746', 1, '2018-01-04 05:12:42'),
(45, 3, '572622', 1, '2018-01-10 17:08:05'),
(50, 18, '551478', 1, '2018-01-16 15:42:13'),
(51, 19, '712656', 1, '2018-01-16 17:01:36'),
(63, 21, '434333', 0, '2018-02-02 11:51:27'),
(66, 22, '649168', 1, '2018-02-04 15:35:24'),
(67, 23, '215547', 0, '2018-02-05 09:03:10'),
(69, 24, '866656', 1, '2018-02-05 09:05:50'),
(71, 25, '580387', 1, '2018-02-07 06:52:57'),
(72, 26, '613037', 1, '2018-02-07 07:06:21'),
(77, 17, '469065', 1, '2018-02-17 08:32:31'),
(78, 28, '628186', 1, '2018-02-23 14:09:06'),
(80, 27, '322697', 1, '2018-02-28 07:42:49'),
(81, 29, '500000', 1, '2018-03-05 17:12:11'),
(82, 30, '186299', 0, '2018-03-09 15:00:41'),
(85, 31, '395128', 1, '2018-03-09 16:16:28'),
(87, 20, '530957', 1, '2018-03-09 17:15:06'),
(88, 32, '804932', 1, '2018-03-10 08:57:17'),
(89, 1, '913924', 1, '2018-03-14 17:59:04'),
(90, 6, '229728', 1, '2018-03-19 14:27:35'),
(91, 33, '856474', 1, '2018-03-23 15:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_items`
--

CREATE TABLE `tbl_items` (
  `itemId` int(11) NOT NULL,
  `itemHeader` varchar(512) NOT NULL COMMENT 'Heading',
  `itemSub` varchar(1021) NOT NULL COMMENT 'sub heading',
  `itemDesc` text COMMENT 'content or description',
  `itemImage` varchar(80) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_items`
--

INSERT INTO `tbl_items` (`itemId`, `itemHeader`, `itemSub`, `itemDesc`, `itemImage`, `isDeleted`, `createdBy`, `createdDtm`, `updatedDtm`, `updatedBy`) VALUES
(1, 'jquery.validation.js', 'Contribution towards jquery.validation.js', 'jquery.validation.js is the client side javascript validation library authored by Jörn Zaefferer hosted on github for us and we are trying to contribute to it. Working on localization now', 'validation.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL),
(2, 'CodeIgniter User Management', 'Demo for user management system', 'This the demo of User Management System (Admin Panel) using CodeIgniter PHP MVC Framework and AdminLTE bootstrap theme. You can download the code from the repository or forked it to contribute. Usage and installation instructions are provided in ReadMe.MD', 'cias.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reset_password`
--

CREATE TABLE `tbl_reset_password` (
  `id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `roleId` tinyint(4) NOT NULL COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`roleId`, `role`) VALUES
(1, 'System Administrator'),
(2, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userId` int(11) NOT NULL,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) DEFAULT '0',
  `createdBy` int(11) DEFAULT NULL,
  `createdDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
(2, 'manager@needhlp.com', '$2y$10$UD4GGG.KVeoxo/3EV0ua8OyLWQnMcr2tO7Q5MPxcBNTGdTeq1dhMK', 'Manager', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 2, '2017-11-28 16:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` text,
  `apikey` varchar(32) NOT NULL,
  `device_registration_id` text,
  `status` int(1) NOT NULL DEFAULT '0',
  `referal_code` varchar(50) NOT NULL,
  `reffered_by` varchar(50) DEFAULT NULL,
  `points` int(100) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `address`, `apikey`, `device_registration_id`, `status`, `referal_code`, `reffered_by`, `points`, `created_date`) VALUES
(1, 'dipak', 's@gmail.com', '8237272827', 'pune', 'a1315c9292128ae90b1ba2d7d7559181', 'feQiJJfG_yo:APA91bHjzf0qlNCJIDodqGOHmeWvLFMxSEwh2i9IakRJZoERjKPguNaO5URFPQ4UlixGnOPrKC3Dkip7NKu-nYS6R37JXQLgKsCvPfH5-Psdx9hs5bMa3xVeoaDg9zltXueROK-g5bIs', 1, 'UIQTLAPD', NULL, 0, '2017-09-27 17:33:02'),
(3, 'vikram', 'test@test.com', '9970743434', NULL, '5c142874635b860c03fec05fd93183fb', 'abcdefg', 1, 'EPUREHLF', NULL, 100, '2017-09-27 17:41:48'),
(5, 'basanta', 'moharana.basanta@gmail.com', '9861870811', NULL, '08d827881c7e76eed2fa17984c9e5644', NULL, 1, 'SPPKAFKP', NULL, 0, '2017-10-02 05:49:14'),
(6, 'ashutosh nayak', 'ashutosh.nayak.30@gmail.com', '7205586281', 'patrapada bbsr', '68dddc8fe9d6e35c34f882ed2b411e4a', 'dVwYC3Z0aI4:APA91bENbx9rG1qQ02X-sI7NM7VH3g58EwZGE2dYabKi6hGj_9pR6U-vi-doiR9r9A7pf_M-sdcY938JOYs78gbASDiJ-Em-GsloNyB1lagH8ix0luyexeWtxg5r7mnMIVBYrikT_bG4', 1, 'SQZVYLXC', NULL, 50, '2017-10-02 05:59:27'),
(7, 'hdd', 'a@gmail.com', '6446494949', NULL, '933067651b52c9608f409d01a0ca0713', NULL, 0, 'WKRVYEEN', NULL, 0, '2017-10-04 13:57:35'),
(8, 'shekhar suman nayak', 'shekharsuman.nayak.37@gmail.com', '9438831220', NULL, 'c60368110d9e08ff21ef16093cbceacb', NULL, 0, 'OMRGRXHT', NULL, 0, '2017-10-04 14:05:00'),
(9, 'shekharsuman nayak', 'shekharsuman.nayak.37@gmail.com', '8763133499', NULL, '699ba5faca85820e74721a76a054151d', NULL, 1, 'QGBEKIFB', NULL, 0, '2017-10-04 14:07:13'),
(10, 'santosh kumar nayak', 'nsantoshkumar50@gmail.com', '8895192839', NULL, 'f3317cd08cf5326c130e75f16dd2a865', NULL, 1, 'OTSMONYP', NULL, 0, '2017-10-04 14:10:19'),
(11, '', '', '9960886753', '', '531e8d589d9e20e40f12f9417565a9a0', NULL, 1, 'ORYTCCPC', NULL, 0, '2017-10-11 03:34:32'),
(12, 'shekhar suman', 'shekharsuman.nayak.37@gmail.com', '9438831220', NULL, '32a843bd57d9c8834070466985cb0517', NULL, 1, 'PNFKKSRW', NULL, 0, '2017-10-14 13:56:31'),
(13, 'dipak', 's@gmail.com', '9665504639', NULL, '2cd9b4b5a6b65e6ff1a4d9c2d9551626', 'abcdefg', 0, 'KJLVLHKI', NULL, 0, '2018-01-06 17:29:05'),
(14, 'Priyanshu Barik', 'lytton.barik@gmail.com', '9583943537', NULL, '184eb9c851ca37eeeee6fc11fa250c69', 'dLBm7YTzGr4:APA91bGLee7hLbvh8nuJqbIDQxBdKrNTeTra9HvPz9FbhkhWH1YfPNB1snfKj-12G1z6DkPyaOKLWkozNoRFQroBT-ivlpJMY9TccqwH7chYsi_tPo5lW_gK0skzo5-twwMLXfeAerk9', 0, 'LFROQXID', NULL, 0, '2018-01-08 14:58:30'),
(15, 'manjiri', 'manemanjiri@gmail.com', '7745024760', NULL, 'f0a054260ccbdda8384f4338e84aaa35', 'fduLsy0hBys:APA91bEBvV-ElX4_hly_3nzvsuvsH8PhewzCpv3M9c5HFVc5nMKZQytwmgng5Lhpg7C-vkfhvSOcN_l9ejGEiyw5znFGg23MAYB2d895v3lyAWt194WxqyeOHiIAMSIKZhcse0TqI-GE', 0, 'BEVUEUBU', NULL, 0, '2018-01-16 06:43:00'),
(17, 'vikram', 'vikram.lahamge@gmail.com', '8600616748', NULL, '9438183f758d3edc096c20e4209109f6', 'ekpPIuP5TgU:APA91bFVZS6fRzABXBZabSXQUvJMrng1yLYmV3KU2Umfkh81PFLkBzTOKr5dQEfSP3lKIy-rfPYp5rbLxtonjQCEa26Zmuab7KSOb1mwPKp_naaEeZd4KlPhPgVJrtecB2elsh_HffYK', 1, 'PFTZPKCK', NULL, 0, '2018-01-16 07:30:45'),
(18, 'manjiri mane', 'manemanjiri@gmail.com', '7745024760', 'jath sangli', '7008056b9ad7a2c01ce4e7caad0081b0', 'fduLsy0hBys:APA91bEBvV-ElX4_hly_3nzvsuvsH8PhewzCpv3M9c5HFVc5nMKZQytwmgng5Lhpg7C-vkfhvSOcN_l9ejGEiyw5znFGg23MAYB2d895v3lyAWt194WxqyeOHiIAMSIKZhcse0TqI-GE', 1, 'IEESDKLZ', NULL, 0, '2018-01-16 07:32:25'),
(19, 'mahi', 's@gmail.com', '9049712506', NULL, '80648dcff328ca3d98f4295b2f56dad0', 'e_IBIgc8tjc:APA91bGo63tHnAH_-ADKSNFCDk9W5ZL3p8qqiowpkDaRQZ2YfwKflVQjN4pqnXCr2p6r2HxltK8YM7FT5F4GkVBCSKpNdJQo5esJXlNIyWfGv3oyuNGjdROVGl2mfksha5f2dZ82qcdl', 1, 'YYDCMBUZ', NULL, 0, '2018-01-16 17:01:36'),
(20, 'sarbeswar sahoo', 'sarbeswar.sp@gmail.com', '8093715005', 'null', '7733f07e77b4b1fbf018e559a9f2964c', 'dUTTRTsi1Eo:APA91bGr5dwC1kBEIAb8mjOcfdPiFzodVZo0qwVTnKrJJna7a---1xEJLFV83wXeVr0Xha37RcAbDs7Sbx9Sd_4yDFRGqCpFUKx1LWtcS-XZYSSquTETBugXv8GcZDvVJNnmnjhbo_8_', 1, 'JLROVNXZ', NULL, 0, '2018-01-17 10:39:55'),
(21, 'dipak', 's@gmail.com', '9665504639', NULL, 'b3ca287000187626c8c04ca7865eb29e', 'abcdefg', 0, 'ALGYSOBY', NULL, 0, '2018-02-02 11:51:27'),
(22, 'Prasanjit Das', 'pdasjit@gmail.com', '8249007313', 'patia', 'b8e98d8320720ae7a7cda6333954a970', 'dOoxAS1MTb8:APA91bF85RebFziAbmW0WJlZnYbaN-WZhZopPgn8b1G1araNH2B4s1EMsPRO5vasChMWxE8KA86pr7vYhjrkMuf0FtTSfRyCKMaw9oUrNwatIXZTY_0wyB2rS0CWuhjrrzRfCxhTdscJ', 1, 'QDJQHLUN', NULL, 0, '2018-02-04 15:35:24'),
(23, 'Biswojit das', 'dasbiswojit39@gmail.com', '7540813555', NULL, '6ff29efae11d4018bf01711022cc5334', 'f1CPfsCu_qM:APA91bH69atEVC7q6FE5WZ84LSu8AwRCTMbRyJdP-cKIrp3h5CE9byUEzwE8QQVoByQbv0Ew9EJnucB54RcUXtaE0q5_pnX77Q6jlxcQCnaG8kAZH2aavxkAErSZImtpmXe2Fh58fSwq', 0, 'ZESXSAYQ', NULL, 0, '2018-02-05 09:03:10'),
(24, 'Biswojit das', 'dasbiswojit39@gmail.com', '7540813555', NULL, 'e1b85c086767af117648b504594db00b', 'f1CPfsCu_qM:APA91bH69atEVC7q6FE5WZ84LSu8AwRCTMbRyJdP-cKIrp3h5CE9byUEzwE8QQVoByQbv0Ew9EJnucB54RcUXtaE0q5_pnX77Q6jlxcQCnaG8kAZH2aavxkAErSZImtpmXe2Fh58fSwq', 1, 'NYQLBQBL', NULL, 0, '2018-02-05 09:03:24'),
(25, 'sagar ranjan sahoo', 'sagarrsahoo@gmail.com', '7226878010', NULL, '2f6915d1ca420b02247968294331324a', 'fG_UKAOko0I:APA91bFsTd_VHRhFLuPWoF6qFzjyzMKMkvK887cC0eK2LhhV90z5-NKv1w8RSScaC5CPwtEitTcZbDFN3Rj6Kizjb7eas_NzIut-xICiq7qyKa0uEruf9zvi8HQgnREikW8r8U0Bs5uj', 1, 'IGCGZEWD', NULL, 0, '2018-02-07 06:52:57'),
(26, 'Aiswaryamayee barik', 'aiswaryamayee.barik@gmail.com', '8280776293', NULL, '336212a126828d22132c43fb7bdb07c3', 'eku6yjH3_2c:APA91bFqQz5QNl9B4PEf-qKchrzBdKDrepgloz6iAfEU27iLofpzBdM3fJePD9bMmrp9Hzeokqenn-ME2X3s4BnZMvSjG6kCGbb9cdLgIcpBitzBVv1CUdUjfWVrwTtQl1HPEY9rH7Nb', 1, 'VCFZXIWT', NULL, 0, '2018-02-07 07:06:21'),
(27, 'manjiri mane', 'manemanjiri@gmail.com', '9665504639', 'pune', '676810d95f5dcdcef62f1596e2073f3b', 'cHiQ7dkJNLk:APA91bENKlZ-KZlKsHoCdHhO41xtCEsnl3rRVbndUi09gdK02-z-UYOuztHxmbhXUgPf9nm5uJcMfSoJsVmh_9JVB30xxYTgc6lc3fjd1Jr6XXU1jK5Qec0WkLO4EDWYoQwzyzDuCN0j', 1, 'ASACYDWD', NULL, 0, '2018-02-14 07:58:17'),
(28, 'asish', 'apasish100@gmail.com', '7381412238', NULL, '58ec3914361584f6a1d6b2a5fac0d77f', 'cGO7cruRjTw:APA91bGtQZ9PgJQmJrTZ4-iXwF8FAY4EwHI_HbAh5-XXTe0VCizgsOd6Gq2-aidPTx2XojekVqRqqEwj46MKLjsWM5DjB08MephH1ukljJQ_A1nUtiYnuZpIrIj_JiM5WGkFta2EpqKX', 1, 'HUTVLTNC', NULL, 0, '2018-02-23 14:09:06'),
(29, 'rinku', 'rinkunayak264@gmail.com', '8763164644', NULL, 'ef3a4ff29d2af82713af53a780779823', 'ev1xblndBj8:APA91bFwjXhXJIRWTrS_ACaSgo0UMVNKb6JYZQbf8YBKixaDjXjJPCT10klECbqHYXhtwDERaPUFwwmXygDCWv4N_EnoQB0DnzTsk-D0TGtm9BBojNzldOvhr-suyCK8gvvAoJy_Gjhb', 1, 'VQVYXRDE', NULL, 0, '2018-03-05 17:12:11'),
(30, 'Akash', 'aakashswain001@gmail.com', '7327884690', NULL, '383a926b24606204ddd9427acf07b1fa', 'eNmpIpVYuNk:APA91bEOJTAxXMdmAOF563CrErLE0VMnMqn6rP1_9fIg_HpAuaTXDqL5th9Oo8008FUd02NUvcdBrWzYRb-565YAFiF9ZKWAwesJZXew6oqcDcXtAg0cncrk3VpuqKk4b8dRZxpQYIv9', 0, 'VSYSRHKF', NULL, 0, '2018-03-09 15:00:41'),
(31, 'Akash', 'aakashswain001@gmail.com', '7327884690', NULL, '542818f1be5ab9862cf9472f133fa971', 'cQM_94fhSQo:APA91bGbeJmg2VJGJm6m3-2-qu56fp-blPSQSIQyY_vj-Gucgk1rSKIeNrFcDUooXeQ11k7VUHzx6oErRiwtc3CJq5iR8yInjJLTWXlJcZ69tWead1Q83h5QpflK1Vff46jsH9wj0yf5', 1, 'FHLVODRB', NULL, 0, '2018-03-09 15:02:14'),
(32, 'Bhanjaratna Mahanta', 'mahantabhanjaratna@gmail.com', '7894621677', NULL, 'd9787dd9e7885335c3b02802cfac0437', 'dXIDYfPgwoM:APA91bH3ztKrKWgOdLFNQOYIo9hNBVJmx6KSsMEb7jQrtyWLWaRlVvPjr2zCyrV5U5fJh96G7ovsy8TRTF7AAw2G7fftQNCuw36npMc9TGUNpB_B7jL-HUDqEibFrm8gfwzbiuWr7nB5', 1, 'NNLQYLTQ', NULL, 0, '2018-03-10 08:57:17'),
(33, 'Yogi', 'artististysn@gmail.com', '7205987432', NULL, 'fb44508d07c41820a90467a3d1c8bcdb', 'creNpetOlT0:APA91bGqjjJ-lpGEB8mIjIk2ya4PG03i8rYjTN4aCnIC7O5aJH8auPSmLAUeNVsbbN_XqNUl7gFAMdTmTd2acyppW9RdXnnHmzdxAvgpxPBALUuwTU8Sd1LF-BcLY7mMCnhpg1VgsvSz', 1, 'QOYBKALE', '6', 0, '2018-03-23 15:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_mechanic`
--

CREATE TABLE `vehicle_mechanic` (
  `id` int(20) NOT NULL,
  `user_mobile` varchar(20) NOT NULL,
  `requirement` varchar(100) NOT NULL,
  `service_date` date NOT NULL,
  `service_time` time NOT NULL,
  `service_address` varchar(100) NOT NULL,
  `created_date` date NOT NULL,
  `status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `sent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_mechanic`
--

INSERT INTO `vehicle_mechanic` (`id`, `user_mobile`, `requirement`, `service_date`, `service_time`, `service_address`, `created_date`, `status`, `sent`) VALUES
(1, '2147483647', 'djdj', '2017-09-06', '20:10:00', 'pune', '2017-09-06', '', 0),
(2, '2147483647', 'djdj', '2017-09-06', '20:10:00', 'pune', '2017-09-06', '', 0),
(3, '2147483647', 'djdj', '2017-09-06', '20:10:00', 'pune', '2017-09-06', '', 0),
(4, '1234567890', 'aks', '2017-09-06', '00:40:00', 'pue', '2017-09-06', '', 0),
(5, '1234567890', 'aks', '2017-09-06', '00:40:00', 'pue', '2017-09-06', '', 0),
(6, '1234567890', 'dd', '2017-09-07', '11:06:00', 'pune', '2017-09-07', '', 0),
(7, '1234567890', 'gb', '2017-09-07', '11:50:00', 'ddddd', '2017-09-07', '', 0),
(8, '1234567890', 'ddd', '2017-09-07', '04:12:00', 'pune', '2017-09-07', '', 0),
(9, '1234567890', 'ddd', '2017-09-07', '04:12:00', '', '2017-09-07', '', 0),
(10, '1234567890', 'ddd', '2017-09-07', '04:12:00', '', '2017-09-07', '', 0),
(11, '2147483647', 'dipak', '2017-09-07', '00:02:00', 'pune', '2017-09-07', '', 0),
(12, '2147483647', 'ggh', '2017-09-08', '01:53:00', 'hg', '2017-09-08', '', 0),
(13, '2147483647', 'plumbings', '2017-09-08', '06:39:00', 'pune', '2017-09-08', '', 0),
(14, '2147483647', 'usjene', '2017-09-08', '05:10:00', 'sjsmsnenr', '2017-09-08', '', 0),
(15, '2147483647', 'punchure', '2017-09-09', '10:11:00', 'sudarshan nagar', '2017-09-09', '', 0),
(16, '2147483647', '', '2017-09-10', '00:00:00', '', '2017-09-10', '', 0),
(17, '9178513535', 'yfhj', '2017-09-11', '01:11:00', 'gfjn\n', '2017-09-11', '', 0),
(18, '7205586281', 'shshjs', '2017-09-15', '09:06:00', 'sjsvdbdksns', '2017-09-15', '', 0),
(19, '8237272827', 'plumber', '2017-09-15', '00:39:00', 'pune', '2017-09-15', '', 0),
(20, '7205586281', 'hdgj', '2017-09-17', '02:46:00', 'uxcucjcjc\n', '2017-09-17', '', 0),
(21, '8237272827', '', '2017-09-20', '03:52:00', 'pune', '2017-09-20', '', 0),
(22, '8895470097', '', '2017-09-21', '01:18:00', 'sjsvejwks', '2017-09-21', '', 0),
(23, '9861870811', 'hihfjndvd\n\n', '2017-10-02', '02:21:00', 'hdhhdvhd\n', '2017-10-02', '', 0),
(24, '7205586281', 'jshejwbe', '2017-10-02', '11:31:00', 'eiebenekeneke', '2017-10-02', '', 0),
(25, '7205586281', 'jshehe', '2017-10-02', '11:33:00', 'hshsbsksnwjw', '2017-10-02', '', 0),
(26, '7205586281', 'gudhk', '2017-10-02', '00:29:00', 'gidfkdhk', '2017-10-02', '', 0),
(27, '7205586281', '', '2017-10-02', '10:53:00', 'sjdbd', '2017-10-02', '', 0),
(28, '9960886753', 'yes', '2017-10-11', '00:05:00', 'fhfhfhcbcv', '2017-10-11', '', 0),
(29, '8237272827', 'electric ', '2017-10-12', '11:11:00', 'pune', '2017-10-12', '', 0),
(30, '8237272827', 'electric ', '2017-10-12', '11:11:00', 'pune', '2017-10-12', '', 0),
(31, '7205586281', 'jsbsns', '2017-10-13', '10:21:00', 'sjdvdmsne', '2017-10-13', '', 0),
(32, '7205586281', 'yhrj', '2017-10-13', '08:11:00', 'difjc', '2017-10-13', '', 0),
(33, '8237272827', 'gsgsh', '2017-10-17', '02:56:00', 'pune', '2017-10-17', '', 0),
(34, '7205586281', 'hfgh', '2017-10-21', '05:30:00', 'hig 15 amri', '2017-10-21', '', 0),
(35, '8237272827', 'electrician', '2017-10-22', '06:22:00', 'pune', '2017-10-22', '', 0),
(36, '7205586281', 'rjdvjdd', '2017-11-17', '01:58:00', 'sjsbshss', '2017-11-17', '', 0),
(37, '7205586281', 'sjvsnss', '2017-11-17', '03:59:00', 'nsbsnsnndkdksjshd', '2017-11-17', '', 0),
(38, '7205586281', 'jsvsjs', '2017-11-17', '04:21:00', 'eijwbwjebebdkeenejehejw', '2017-11-17', '', 0),
(39, '8237272827', 'gg\n', '2017-12-05', '05:47:00', 'vv', '2017-12-05', '', 0),
(40, '8237272827', 'hah', '2017-12-13', '03:47:00', 'pune', '2017-12-13', '', 0),
(41, '7205586281', '', '2017-12-16', '09:11:00', 'rhdndnjsks', '2017-12-16', '', 0),
(42, '7205586281', 'fhh', '2018-01-02', '09:17:00', 'patrapada ahahagaab', '2018-01-02', '', 0),
(43, '7205586281', '', '2018-01-04', '09:11:00', 'sjsbssjs', '2018-01-04', '', 0),
(44, '7205586281', 'gcbbcj\n', '2018-01-04', '01:13:00', 'tshfvbb', '2018-01-04', '', 0),
(45, '7205586281', 'ggjh', '2018-01-04', '11:16:00', 'ggjfcjjj', '2018-01-04', '', 0),
(46, '9438831220', '', '2018-01-04', '09:27:00', 'Kalinga Vihar, Patrapada, Bhubaneswar, Odisha 751019, India', '2018-01-04', '', 0),
(47, '7205586281', '', '2018-01-04', '10:30:00', 'gufugigig', '2018-01-04', '', 0),
(48, '8237272827', 'gg', '2018-01-04', '01:39:00', '112/2B, Virbhadra Nagar Rd, Rajyog Cooperative Housing Society, Veerbhadra Nagar, Baner, Pune, Mahar', '2018-01-04', '', 0),
(49, '7745024760', '', '2018-01-16', '01:39:00', 'pune', '2018-01-16', 'active', 0),
(50, '7205586281', 'znsbs', '2018-01-17', '05:11:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-01-17', 'active', 0),
(51, '7205586281', '', '2018-01-17', '05:11:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-01-17', 'active', 0),
(52, '7205586281', '', '2018-01-17', '06:12:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-01-17', 'active', 0),
(53, '7205586281', '', '2018-01-17', '05:33:00', 'Kalinga Vihar, Patrapada, Bhubaneswar, Odisha 751019, India', '2018-01-17', 'active', 0),
(54, '7205586281', 'hsgwhs', '2018-01-17', '05:34:00', 'hssbs', '2018-01-17', 'active', 0),
(55, '7205586281', 'hssv', '2018-01-17', '07:34:00', 'National Highway 5, Plot No. 99, Kalinga Vihar, Patrapada, Bhubaneswar, Odisha 751019, India', '2018-01-17', 'active', 0),
(56, '7205586281', '', '2018-01-17', '06:15:00', 'Kalinga Vihar, Patrapada, Bhubaneswar, Odisha 751019, India', '2018-01-17', 'active', 0),
(57, '7205586281', 'nxbd', '2018-01-18', '06:12:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-01-18', 'active', 0),
(58, '8093715005', 'ddbbd', '2018-01-27', '05:14:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-01-27', 'active', 0),
(59, '7205586281', 'hff', '2018-02-04', '10:06:00', 'bdhjffnjg', '2018-02-04', 'active', 0),
(60, '7205586281', 'ndbd', '2018-02-04', '09:01:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-02-04', 'active', 0),
(61, '8237272827', '', '2018-02-05', '05:15:00', '112/2B, Virbhadra Nagar Rd, Rajyog Cooperative Housing Society, Veerbhadra Nagar, Baner, Pune, Mahar', '2018-02-05', 'active', 0),
(62, '7205586281', 'jdvds', '2018-02-06', '01:52:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-02-06', 'active', 0),
(63, '7226878010', 'sagar ranjan sahoo', '2018-02-07', '00:40:00', 'patrapada', '2018-02-07', 'active', 0),
(64, '9665504639', 'leakage of water', '2018-02-14', '03:00:00', '112/2B, Virbhadra Nagar Rd, Rajyog Cooperative Housing Society, Veerbhadra Nagar, Baner, Pune, Mahar', '2018-02-14', 'active', 0),
(65, '7205586281', '', '2018-02-15', '08:46:00', 'hfhhfhjuh', '2018-02-15', 'active', 0),
(66, '7205586281', 'crctc', '2018-02-15', '06:12:00', 'yvych j h hvhvy', '2018-02-15', 'active', 0),
(67, '8763164644', 'jrjeh', '2018-03-05', '10:44:00', '312, Jagamara-Baramunda Rd, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-03-05', 'active', 0),
(68, '8237272827', 'electrical', '2018-03-13', '01:49:00', 'yes', '2018-03-13', 'active', 0),
(69, '8237272827', 'pune', '2018-03-13', '01:50:00', 'test', '2018-03-13', 'active', 0),
(70, '7205586281', 'service requirement....test1\n', '2018-03-22', '09:20:00', '312, Jagamara-Baramunda Rd, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-03-19', 'active', 1),
(71, '8763164644', 'mate naina darkar', '2018-03-19', '00:00:00', 'HIG-75, Jagamara-Baramunda Rd, Dharam Vihar, Jagamara, Bhubaneswar, Odisha 751030, India', '2018-03-19', 'active', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_booking`
--
ALTER TABLE `car_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_booking`
--
ALTER TABLE `food_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_to_user`
--
ALTER TABLE `notification_to_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_codes`
--
ALTER TABLE `sms_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_items`
--
ALTER TABLE `tbl_items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_mechanic`
--
ALTER TABLE `vehicle_mechanic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_booking`
--
ALTER TABLE `car_booking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `food_booking`
--
ALTER TABLE `food_booking`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `notification_to_user`
--
ALTER TABLE `notification_to_user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `sms_codes`
--
ALTER TABLE `sms_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tbl_items`
--
ALTER TABLE `tbl_items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_reset_password`
--
ALTER TABLE `tbl_reset_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `vehicle_mechanic`
--
ALTER TABLE `vehicle_mechanic`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sms_codes`
--
ALTER TABLE `sms_codes`
  ADD CONSTRAINT `sms_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
