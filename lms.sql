-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 02:17 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup`
--

CREATE TABLE `bloodgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `çreated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bloodgroup`
--

INSERT INTO `bloodgroup` (`id`, `name`, `description`, `IsActive`, `çreated_at`, `updated_at`) VALUES
(1, 'O+', NULL, 1, '2023-07-17 00:01:53', '2023-07-17 00:01:53'),
(2, 'O-', NULL, 1, '2023-07-17 00:01:53', '2023-07-17 00:01:53'),
(3, 'A+', NULL, 1, '2023-07-17 00:02:20', '2023-07-17 00:02:20'),
(4, 'A-', NULL, 1, '2023-07-17 00:02:20', '2023-07-17 00:02:20'),
(5, 'B+', NULL, 1, '2023-07-17 00:02:45', '2023-07-17 00:02:45'),
(6, 'B-', NULL, 1, '2023-07-17 00:02:45', '2023-07-17 00:02:45'),
(7, 'AB+', NULL, 1, '2023-07-17 00:03:08', '2023-07-17 00:03:08'),
(8, 'AB-', NULL, 1, '2023-07-17 00:03:08', '2023-07-17 00:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `cupboard`
--

CREATE TABLE `cupboard` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rowNo` int(11) DEFAULT NULL,
  `colNo` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cupboard`
--

INSERT INTO `cupboard` (`id`, `name`, `description`, `rowNo`, `colNo`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test Description', 1, 3, '2023-07-19 00:45:11', '2023-07-19 00:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `donner`
--

CREATE TABLE `donner` (
  `id` int(11) NOT NULL,
  `memberShipNo` int(11) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `fatherName` varchar(100) DEFAULT NULL,
  `motherName` varchar(100) DEFAULT NULL,
  `presentAddress` varchar(1000) DEFAULT NULL,
  `permanentAddress` varchar(1000) DEFAULT NULL,
  `mobileNo` varchar(50) DEFAULT NULL,
  `whatsAppNo` varchar(500) DEFAULT NULL,
  `occupation` int(11) DEFAULT NULL,
  `bloodGroup` int(11) DEFAULT NULL,
  `qualification` varchar(500) DEFAULT NULL,
  `institute` varchar(500) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `isFemale` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL,
  `isNid` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `IconName` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `parentId` int(11) NOT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `ProjectId` int(11) DEFAULT NULL,
  `ModuleId` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `IconName`, `path`, `parentId`, `IsActive`, `SortOrder`, `ProjectId`, `ModuleId`, `created_at`, `updated_at`) VALUES
(1, 'Add Donner', NULL, 'fa-sharp fa-solid fa-user-plus', 'store/addDonner', 0, 1, NULL, 1, 1, '2023-07-10 12:11:37', '2023-07-10 12:11:37'),
(2, 'Setup Stack', NULL, 'fa-solid fa-layer-group', 'store/setupStack', 0, 1, NULL, 1, 1, '2023-07-10 12:11:37', '2023-07-10 12:11:37'),
(3, 'Add New Book', NULL, 'fa-solid fa-book-medical', 'store/addNewBook', 0, 1, NULL, 1, 1, '2023-07-10 12:15:20', '2023-07-10 12:15:20'),
(4, 'Add User', NULL, 'fa-solid fa-user-plus', 'book/addUser', 0, 1, NULL, 1, 2, '2023-07-10 12:15:20', '2023-07-10 12:15:20'),
(5, 'Add Book', NULL, 'fa-solid fa-book-quran', 'book/addBook', 0, 1, NULL, 1, 2, '2023-07-10 14:33:59', '2023-07-10 14:33:59'),
(6, 'Add User', NULL, 'fa-solid fa-user-plus', 'settings/addUser', 0, 1, NULL, 1, 3, '2023-07-13 18:00:00', '2023-07-10 14:33:59'),
(7, 'Permission', NULL, 'fa-solid fa-users-gear', 'settings/userPermission', 0, 1, NULL, 1, 3, '2023-07-14 15:18:00', '2023-07-14 15:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `modulepermission`
--

CREATE TABLE `modulepermission` (
  `id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ModuleId` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modulepermission`
--

INSERT INTO `modulepermission` (`id`, `UserId`, `ModuleId`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2023-07-11 04:35:21', '2023-07-11 04:35:21'),
(2, 1, 2, 1, '2023-07-11 04:35:21', '2023-07-11 04:35:21'),
(3, 1, 3, 1, '2023-07-11 04:35:34', '2023-07-11 04:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ProjectId` int(11) DEFAULT NULL,
  `IconName` varchar(100) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `description`, `ProjectId`, `IconName`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'Store', 'Store Managemnt', 1, 'fa-solid fa-store', 1, '2023-06-30 04:11:09', '2023-06-30 04:11:09'),
(2, 'Book', 'Book Managemnt', 1, 'fa-solid fa-book', 1, '2023-06-30 04:11:47', '2023-06-30 04:11:47'),
(3, 'Settings', 'Project Settings', 1, 'fa-solid fa-gear', 1, '2023-06-30 04:12:13', '2023-06-30 04:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `nidimage`
--

CREATE TABLE `nidimage` (
  `id` int(11) NOT NULL,
  `urlLink` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occupation`
--

CREATE TABLE `occupation` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `occupation`
--

INSERT INTO `occupation` (`id`, `name`, `description`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'Student', NULL, 1, '2023-07-21 09:15:28', '2023-07-21 09:15:28'),
(2, 'Job Holder', NULL, 1, '2023-07-21 09:15:28', '2023-07-21 09:15:28'),
(3, 'Business Man', NULL, 1, '2023-07-21 09:16:11', '2023-07-21 09:16:11'),
(4, 'Others', NULL, 1, '2023-07-21 09:47:16', '2023-07-21 09:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `passportimage`
--

CREATE TABLE `passportimage` (
  `id` int(11) NOT NULL,
  `urlLink` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissiongroup`
--

CREATE TABLE `permissiongroup` (
  `id` int(11) NOT NULL,
  `MenuId` int(11) DEFAULT NULL,
  `GroupId` int(11) DEFAULT NULL,
  `IsCreate` int(11) DEFAULT NULL,
  `IsUpdate` int(11) DEFAULT NULL,
  `IsView` int(11) DEFAULT NULL,
  `IsReport` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissiongroup`
--

INSERT INTO `permissiongroup` (`id`, `MenuId`, `GroupId`, `IsCreate`, `IsUpdate`, `IsView`, `IsReport`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 1, 1, 1, 1, '2023-07-10 14:09:08', '2023-07-10 14:09:08'),
(2, 2, 3, 1, 1, 1, 1, 1, '2023-07-10 14:09:08', '2023-07-10 14:09:08'),
(3, 3, 3, 1, 1, 1, 1, 1, '2023-07-10 14:09:59', '2023-07-10 14:09:59'),
(4, 4, 3, 1, 1, 1, 1, 1, '2023-07-10 14:10:29', '2023-07-10 14:10:29'),
(5, 5, 3, 1, 1, 1, 1, 1, '2023-07-10 14:34:48', '2023-07-10 14:34:48'),
(6, 6, 3, 1, 1, 1, 1, 1, '2023-07-14 16:37:50', '2023-07-14 16:37:50'),
(7, 7, 3, 1, 1, 1, 1, 1, '2023-07-14 16:37:50', '2023-07-14 16:37:50');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `MenuId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `IsCreate` int(11) DEFAULT NULL,
  `IsUpdate` int(11) DEFAULT NULL,
  `IsView` int(11) DEFAULT NULL,
  `IsReport` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'LMS', 'Library Management System', 1, '2023-06-30 04:05:40', '2023-06-30 04:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `sex`
--

CREATE TABLE `sex` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sex`
--

INSERT INTO `sex` (`id`, `name`, `description`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'Male', NULL, 1, '2023-07-16 23:58:49', '2023-07-16 23:58:49'),
(2, 'Female', NULL, 1, '2023-07-16 23:58:49', '2023-07-16 23:58:49'),
(3, 'Others', NULL, 1, '2023-07-16 23:59:05', '2023-07-16 23:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usergroup`
--

INSERT INTO `usergroup` (`id`, `name`, `description`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'Desk Admin', 'Library Desk Admin', 1, '2023-07-04 10:16:42', '2023-07-04 10:16:42'),
(2, 'Normal User', 'Normal LMS Users.', 1, '2023-07-04 10:17:32', '2023-07-04 10:17:32'),
(3, 'System Admin', 'LMS System Admin.', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userGroupId` int(11) DEFAULT NULL,
  `userTypeId` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `userName`, `phone`, `email`, `userGroupId`, `userTypeId`, `password`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'Admin', '01904563898', 'admin@gmai.com', 3, 1, '$2b$10$jkUcyO/3jJuEU9jyP2XeAuTtSrCEoYaSXLz6FcD.fz7b9ZjBnGNA.', 1, '2023-07-10 14:06:06', '2023-07-10 14:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `name`, `description`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'pass : LMS@1909', 1, '2023-07-10 14:05:38', '2023-07-10 14:05:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cupboard`
--
ALTER TABLE `cupboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donner`
--
ALTER TABLE `donner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image` (`image`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProjectId` (`ProjectId`),
  ADD KEY `ModuleId` (`ModuleId`);

--
-- Indexes for table `modulepermission`
--
ALTER TABLE `modulepermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ModuleId` (`ModuleId`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProjectId` (`ProjectId`);

--
-- Indexes for table `nidimage`
--
ALTER TABLE `nidimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occupation`
--
ALTER TABLE `occupation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passportimage`
--
ALTER TABLE `passportimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MenuId` (`MenuId`),
  ADD KEY `GroupId` (`GroupId`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MenuId` (`MenuId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cupboard`
--
ALTER TABLE `cupboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `donner`
--
ALTER TABLE `donner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modulepermission`
--
ALTER TABLE `modulepermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nidimage`
--
ALTER TABLE `nidimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occupation`
--
ALTER TABLE `occupation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `passportimage`
--
ALTER TABLE `passportimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sex`
--
ALTER TABLE `sex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donner`
--
ALTER TABLE `donner`
  ADD CONSTRAINT `donner_ibfk_1` FOREIGN KEY (`image`) REFERENCES `passportimage` (`id`),
  ADD CONSTRAINT `donner_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `nidimage` (`id`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`ModuleId`) REFERENCES `modules` (`id`);

--
-- Constraints for table `modulepermission`
--
ALTER TABLE `modulepermission`
  ADD CONSTRAINT `modulepermission_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `modulepermission_ibfk_2` FOREIGN KEY (`ModuleId`) REFERENCES `modules` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`id`);

--
-- Constraints for table `permissiongroup`
--
ALTER TABLE `permissiongroup`
  ADD CONSTRAINT `permissiongroup_ibfk_1` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `permissiongroup_ibfk_2` FOREIGN KEY (`GroupId`) REFERENCES `usergroup` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
