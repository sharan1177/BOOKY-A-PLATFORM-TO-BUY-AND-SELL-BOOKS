-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2021 at 05:06 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books-portal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `param_username` VARCHAR(255), IN `param_password` VARCHAR(255), IN `param_email` VARCHAR(255), IN `param_firstName` VARCHAR(255), IN `param_middleName` VARCHAR(255), IN `param_lastName` VARCHAR(255), IN `param_category` VARCHAR(255), IN `param_role` VARCHAR(255), IN `param_contact` VARCHAR(20), IN `param_date` DATE)  BEGIN
          INSERT INTO users(username,password,email,first_name,middle_name,last_name,user_category,role,date)  VALUES(param_username,param_password,param_email,param_firstName,param_middleName,param_lastName,param_category,param_role,param_date);
            INSERT INTO contacts(username,contact_no) VALUES(param_username,param_contact);
       END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`username`, `book_id`, `date`) VALUES
('sharan', 42, '2021-05-18 08:07:32'),
('vardhan', 55, '2021-05-16 18:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `book_price` int(11) NOT NULL DEFAULT 0,
  `book_original_price` int(11) NOT NULL DEFAULT 0,
  `book_description` varchar(1000) DEFAULT 'No Description Available',
  `book_image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `book_status` varchar(255) NOT NULL DEFAULT 'available',
  `date` date NOT NULL DEFAULT '1920-05-20'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `username`, `book_name`, `author`, `edition`, `subject`, `category_id`, `book_price`, `book_original_price`, `book_description`, `book_image`, `book_status`, `date`) VALUES
(40, 'prabha', 'ALGORITHMS', 'Robert Sedgewick', '4', 'Algorithms', 1, 259, 349, 'The algorithms in this book represent a body of knowledge developed over the last 50 years that has become indispensable, not just for professional programmers and computer science students but for any student with interests in science, mathematics, and engineering, not to mention students who use computation in the liberal arts.', 'ALGORITHMS_prabha_38.jpg', 'unavailable', '2021-05-03'),
(41, 'prabha', 'THE CLEAN CODER', 'Robert C. Martin', '6', 'Coding', 1, 250, 396, 'This book is packed with practical advice about everything from estimating and coding to refactoring and testing. It covers much more than technique: It is about attitude. Martin shows how to approach software development with honor, self-respect, and pride; work well and work clean; communicate and estimate faithfully; face difficult decisions with clarity and honesty; and understand that deep knowledge comes with a responsibility to act.', 'THE CLEAN CODER_prabha_98.jpg', 'unavailable', '2021-05-03'),
(42, 'prabha', 'Let us C', 'Yashavant Kanetkar', '17', 'C Language', 1, 200, 309, 'Strengthens the foundations, as a detailed explanation of programming language concepts are given\r\n•  Lucid explanation of the concept\r\n•  Well thought-out, fully working programming examples\r\n•  End-of-chapter exercises that would help you practice the skills learned in the chapter \r\n', 'Let us C_prabha_66.jpg', 'available', '2021-05-03'),
(43, 'prabha', 'Python Programming', 'Reema Thareja', '3', 'Python', 1, 430, 543, 'Python Programming is designed as a textbook to fulfil the requirements of the first-level course in Python programming. It is suited for undergraduate degree students of computer science engineering, information technology as well as computer applications. This book will enable students to apply the Python programming concepts in solving real-world problems.', 'Python Programming_prabha_89.jpg', 'available', '2021-05-03'),
(44, 'prabha', 'ELEMENTS OF POWER ELECTRONICS', 'Philip Krein', '2', 'Power Electronics', 2, 850, 1000, 'Building on the tradition of its classic first edition, the long-awaited second edition of Elements of Power Electronics provides comprehensive coverage of the subject at a level suitable for undergraduate engineering students, students in advanced degree programs, and novices in the field. It\r\nestablishes a fundamental engineering basis for power electronics analysis, design, and implementation, offering broad and in-depth coverage of basic material.\r\n', 'ELEMENTS OF POWER ELECTRONICS_prabha_15.jpg', 'available', '2021-05-04'),
(45, 'prabha', 'BASIC ELECTRICAL AND ELECTRONICS ', 'S.K.Bhattacharya', '2', 'BEE', 2, 350, 430, 'The second edition provides easy to comprehend learning material on the principles of basic electrical and electronics engineering. It offers an unparalleled exposure to the entire gamut of topics such as Electricity Fundamentals, Network Theory, Electro-magnetism, Electrical Machines, Transformers, Measuring Instruments, Power Systems, Semiconductor Devices, Digital Electronics and Integrated Circuits. ', 'BASIC ELECTRICAL AND ELECTRONICS ENGINEERING_prabha_84.jpg', 'available', '2021-05-04'),
(46, 'prabha', 'DIGITAL LOGIC AND COMPUTER DESIGN', 'Mano', '1', 'Digital logic and computer design', 2, 400, 621, 'This book presents the basic concepts used in the design and analysis of digital systems and introduces the principles of digital computer organization and design. It discusses various methods and techniques suitable for a variety of digital system design applications and covers all aspects of digital systems. It also includes applications of Read Only Memory (ROM) and Programmable Logic Array (PLA).', 'DIGITAL LOGIC AND COMPUTER DESIGN_prabha_100.jpg', 'available', '2021-05-04'),
(47, 'prabha', 'COMPUTOR NETWORKS', 'Tanenbaum', '5', 'Computer Networks', 2, 500, 642, 'The book is an introduction to computer networking for those seeking information on various aspects of establishing and maintaining wireless networks. A computer network is a group of computers that share data over a wireless or cable-connected set-up. To establish a computer network one needs to be equipped with the basic guidelines that help to lay down complex networks.', 'COMPUTOR NETWORKS_prabha_25.jpg', 'unavailable', '2021-05-04'),
(48, 'prabha', 'AN INTRODUCTION TO MECHANICAL ENGINEERING', 'Jonathan Wickert', '4', 'Mechanical Engineering', 3, 549, 620, 'AN INTRODUCTION TO MECHANICAL ENGINEERING, 4E is an ideal resource during your first or second year of your mechanical engineering program. It\'s also a useful tool if you are pursuing a closely related field. The book balances timely treatments of technical problem-solving skills, design, engineering analysis, and modern technology to provide the solid mechanical engineering foundation you need for future success.', 'AN INTRODUCTION TO MECHANICAL ENGINEERING_prabha_73.jpg', 'unavailable', '2021-05-04'),
(49, 'prabha', 'AERODYNAMICS FOR ENGINEERS', 'John Bertin', '6', 'Aerodynamics', 3, 450, 550, 'From low-speed through hypersonic flight, this book merges fundamental fluid mechanics, experimental techniques, and computational fluid dynamics techniques to build a solid foundation in aerodynamic applications. Many references are recent publications by the world’s finest aerodynamicists with expertise in subsonic, transonic, supersonic, and hypersonic aerodynamics', 'AERODYNAMICS FOR ENGINEERS_prabha_86.jpg', 'available', '2021-05-04'),
(50, 'prabha', 'Shigley\'s Mechanical Engineering Design ', 'Richard Budynas', '11', 'Mechaniical engineering design', 3, 1100, 1500, 'Shigley\'s Mechanical Engineering Design is intended for students beginning the study of mechanical engineering design. Students will find that the text inherently directs them into familiarity with both the basics of design decisions and the standards of industrial components. It combines the straightforward focus on fundamentals that instructors have come to expect, with a modern emphasis on design and new applications. This edition maintains the well-designed approach that has made this book the standard in machine design for nearly 50 years.', 'Shigley\'s Mechanical Engineering Design _prabha_42.jpg', 'available', '2021-05-04'),
(51, 'prabha', 'MECHANICS OF FLUIDS', 'Merle C. Potter', '5', 'Fluid Mechanics', 3, 450, 690, 'Gain an understanding of fluid mechanics and the ability to analyze this important phenomena encountered by practicing engineers with MECHANICS OF FLUIDS, 5E. The authors use proven learning tools to help you visualize many difficult-to-understand aspects of fluid mechanics. The mathematics used in derivations are readily accessible to you as an undergraduate engineering student.', 'MECHANICS OF FLUIDS_prabha_50.jpg', 'unavailable', '2021-05-04'),
(52, 'prabha', 'vcv', 'dd', '2', 'cc', 1, 52, 121, '<p>ddd</p>', 'vcv_prabha_60.jpg', 'unavailable', '2021-05-04'),
(55, 'prabha', 'ALGORITHMS', 'Robert Sedgewick', '4', 'Algorithms', 1, 199, 259, 'The algorithms in this book represent a body of knowledge developed over the last 50 years that has become indispensable, not just for professional programmers and computer science students but for any student with interests in science, mathematics, and engineering, not to mention students who use computation in the liberal arts.', 'ALGORITHMS_prabha_80.jpg', 'available', '2021-05-16'),
(56, 'prabha', 'THE CLEAN CODER', 'Robert C. Martin', '1', 'Coding', 1, 250, 396, 'This book is packed with practical advice about everything from estimating and coding to refactoring and testing. It covers much more than technique: It is about attitude. Martin shows how to approach software development with honor, self-respect, and pride; work well and work clean; communicate and estimate faithfully; face difficult decisions with clarity and honesty; and understand that deep knowledge comes with a responsibility to act.', 'THE CLEAN CODER_prabha_96.jpg', 'available', '2021-05-16'),
(59, 'rushi', 'COMPUTOR NETWORKS', 'Tanenbaum', '5', 'Computer Networks', 2, 499, 642, 'The book is an introduction to computer networking for those seeking information on various aspects of establishing and maintaining wireless networks. A computer network is a group of computers that share data over a wireless or cable-connected set-up. To establish a computer network one needs to be equipped with the basic guidelines that help to lay down complex networks.', 'COMPUTOR NETWORKS_rushi_73.jpg', 'available', '2021-05-21'),
(60, 'rushi', 'AN INTRODUCTION TO MECHANICAL ENGINEERING', 'Jonathan Wickert', '4', 'Mechanical Engineering', 3, 580, 620, 'AN INTRODUCTION TO MECHANICAL ENGINEERING, 4E is an ideal resource during your first or second year of your mechanical engineering program. It\'s also a useful tool if you are pursuing a closely related field. The book balances timely treatments of technical problem-solving skills, design, engineering analysis, and modern technology to provide the solid mechanical engineering foundation you need for future success.', 'AN INTRODUCTION TO MECHANICAL ENGINEERING_rushi_85.jpg', 'available', '2021-05-21'),
(61, 'rushi', 'MECHANICS OF FLUIDS', 'Merle C. Potter', '5', 'Fluid Mechanics', 3, 599, 690, 'Gain an understanding of fluid mechanics and the ability to analyze this important phenomena encountered by practicing engineers with MECHANICS OF FLUIDS, 5E. The authors use proven learning tools to help you visualize many difficult-to-understand aspects of fluid mechanics. The mathematics used in derivations are readily accessible to you as an undergraduate engineering student.', 'MECHANICS OF FLUIDS_rushi_39.jpg', 'available', '2021-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `username` varchar(255) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `price` float NOT NULL,
  `transaction_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`username`, `book_name`, `seller_name`, `date`, `price`, `transaction_method`) VALUES
('vardhan', 'ALGORITHMS', 'prabha', '2021-05-04', 259, 'Cash'),
('vardhan', 'AN INTRODUCTION TO MECHANICAL ENGINEERING', 'prabha', '2021-05-14', 549, 'Cash'),
('prabha', 'bd', 'vardhan', '2021-05-16', 2, 'Cash'),
('sharan', 'COMPUTOR NETWORKS', 'prabha', '2021-05-17', 500, 'UPI/Net Banking'),
('prabha', 'DBMS', 'vardhan', '2021-05-17', 1221, 'Cash'),
('admin', 'MECHANICS OF FLUIDS', 'prabha', '2021-05-09', 450, 'Cash'),
('vardhan', 'THE CLEAN CODER', 'prabha', '2021-05-04', 250, 'UPI/Net Banking');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_category_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`) VALUES
(1, 'Information Technology', 0),
(2, 'Electronics and Communications', 0),
(3, 'Mechanical Engineering', 0),
(18, 'Civil Engineering', 0),
(19, 'Chemical Engineering', 0),
(20, 'Electrical Engineering', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `username` varchar(255) NOT NULL,
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`username`, `contact_no`) VALUES
('admin', '9550730100'),
('prabha', '9182171903'),
('rushi', '7680026385'),
('sharan', '9154372466'),
('vardhan', '9874562130');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Unseen',
  `buyer_name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `offer_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `username`, `message`, `status`, `buyer_name`, `date`, `offer_status`) VALUES
(50, 'prabha', 'vardhan is interested in buying ALGORITHMS , Preferred payment method: Cash , Buyer Contact No: 9874562130', 'Seen', 'vardhan', '2021-05-04 08:57:29', 'accepted'),
(52, 'prabha', 'vardhan is interested in buying THE CLEAN CODER , Preferred payment method: UPI/Net Banking , Buyer Contact No: 9874562130', 'Seen', 'vardhan', '2021-05-04 09:01:09', 'rejected'),
(55, 'prabha', 'vardhan is interested in buying AN INTRODUCTION TO MECHANICAL ENGINEERING , Preferred payment method: Cash , Buyer Contact No: 9874562130', 'Seen', 'vardhan', '2021-05-14 18:11:06', 'rejected'),
(56, 'admin', 'prabha has rejected your order', 'Seen', 'prabha', '2021-05-14 18:11:34', 'reply'),
(57, 'vardhan', 'prabha has rejected your order', 'Seen', 'prabha', '2021-05-14 18:11:38', 'reply'),
(61, 'vardhan', 'prabha has accepted your order,Seller Contact No: 9182171903', 'Seen', 'prabha', '2021-05-16 06:42:26', 'reply'),
(62, 'vardhan', 'prabha is interested in buying DBMS , Preferred payment method: Cash , Buyer Contact No: 9182171903', 'Seen', 'prabha', '2021-05-17 09:26:44', 'accepted'),
(63, 'prabha', 'vardhan has accepted your order,Seller Contact No: 9874562130', 'Seen', 'vardhan', '2021-05-17 09:29:49', 'reply'),
(64, 'prabha', 'sharan is interested in buying COMPUTOR NETWORKS , Preferred payment method: UPI/Net Banking , Buyer Contact No: 9154372466', 'Seen', 'sharan', '2021-05-17 09:41:25', 'accepted'),
(65, 'sharan', 'prabha has accepted your order,Seller Contact No: 9182171903', 'Seen', 'prabha', '2021-05-17 09:42:19', 'reply');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `username` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `ratings` int(11) NOT NULL DEFAULT 0,
  `review_content` varchar(255) NOT NULL DEFAULT 'No Review Content'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`username`, `book_id`, `ratings`, `review_content`) VALUES
('vardhan', 43, 5, 'GOOD!!\r\n'),
('vardhan', 55, 5, 'WOW!!This book is really great. It contains a lot of data structures and algorithms. Each of them is very clearly presented.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT 'noemail@noemail@noemail',
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_category` varchar(255) NOT NULL DEFAULT 'FirstYear',
  `role` varchar(255) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `first_name`, `middle_name`, `last_name`, `user_category`, `role`, `date`) VALUES
('admin', '$2y$10$wqeYW8EoWKStg2QKx/HZb.SIznv0tHSBmNW7onSsF6HCo080y0iAe', 'sharanprabhath1177@gmail.com', 'admin', 'admin', 'admin', 'IT', 'admin', '2021-04-30'),
('prabha', '$2y$10$JohIAJuDM/fOat6dryTwoedBZGCP.TtnP0s3lO4XXVrp2XN0cEgVK', 'sharanprabhathdoosa@gmail.com', 'Sharan', 'Prabhath', 'Doosa', 'IT', 'user', '2021-05-03'),
('rushi', '$2y$10$HSH8D05sRmrJDDYhwlyQ2uq/fWbx7F1V/daXHQWrIJc5OEHbFn8lK', 'rushikeshdoosa@gmail.com', 'Rushikesh', '', 'Doosa', 'CHEMICAL', 'user', '2021-05-21'),
('sharan', '$2y$10$YxW8rwpbvsPrm4JzwQgrO.v58JMGfrtwwzKvya6ItqLVpzkRCiVWS', 'sharanprabhath@gmail.com', 'Sharan', 'Prabhath', 'Doosa', 'ECE', 'user', '2021-05-17'),
('vardhan', '$2y$10$e9UVn3DTjyAU3bTmeULBseiTMcAS2F6TVL.zVxiL3/8cNDgC2BvHG', 'vardhan1177@gmail.com', 'Sai', 'Vardhan', 'Reddy', 'IT', 'user', '2021-05-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_bookmark` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_books_username` (`username`),
  ADD KEY `book_price` (`book_price`),
  ADD KEY `book_name` (`book_name`),
  ADD KEY `book_image` (`book_image`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD UNIQUE KEY `book_name` (`book_name`),
  ADD KEY `fk_username_users` (`username`),
  ADD KEY `fk_book_name` (`book_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_no`),
  ADD KEY `fk_username_contacts` (`username`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_username_users` (`username`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`username`,`book_id`),
  ADD KEY `fk_book_id_reviews` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `fk_book_id_bookmark` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_bookmark` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_username_contacts` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_book_id_reviews` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_username_reviews` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
