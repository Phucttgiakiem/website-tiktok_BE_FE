-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 04:02 PM
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
-- Database: `hoiittp`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `postID` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userIDsub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `userID`, `createdAt`, `updatedAt`, `userIDsub`) VALUES
(1, 5, '2024-05-23 11:00:13', '2024-05-23 11:00:13', 6);

-- --------------------------------------------------------

--
-- Table structure for table `friendships`
--

CREATE TABLE `friendships` (
  `id` int(11) NOT NULL,
  `userID1` int(11) DEFAULT NULL,
  `userID2` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likespost`
--

CREATE TABLE `likespost` (
  `id` int(11) NOT NULL,
  `postID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `senderID` int(11) DEFAULT NULL,
  `receiverID` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `mediatype` varchar(255) DEFAULT NULL,
  `mediaURL` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `formatvideo` varchar(255) NOT NULL,
  `hashtabvideo` varchar(255) DEFAULT NULL,
  `Namemusicvideo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `userID`, `content`, `mediatype`, `mediaURL`, `timestamp`, `createdAt`, `updatedAt`, `formatvideo`, `hashtabvideo`, `Namemusicvideo`) VALUES
(1, 5, 'Cảm nhận video của tui', 'video', '/videos/video3.mp4', '2024-05-20 02:19:51', '2024-05-20 02:19:51', '2024-05-20 02:19:51', '576*1024', '#camnhan#thugian', 'noval relast'),
(2, 6, 'Cảm nhận video của bạn tui', 'video', '~/duantiktok/tiktok-ui/src/assets/videos/video2.mp4', NULL, '2024-05-22 05:37:28', '2024-05-22 05:37:28', '576*1024', '#camnhan#thugian', 'noval relast');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240425072522-create-user.js'),
('20240511153152-addDatebirthToUser.js'),
('20240511153913-addDatebirthToUser.js'),
('20240520013933-addFormatvideoinpost.js'),
('20240520015400-addHashtabinpost.js'),
('20240520015652-addNamemusicvideo.js'),
('20240522005609-adduserIdSub.js'),
('20240522161538-addUserIdforcommenttable.js'),
('20240523085421-changeTypeofUserIDsub.js'),
('migration_create_comment.js'),
('migration_create_follow.js'),
('migration_create_friendship.js'),
('migration_create_like.js'),
('migration_create_likepost.js'),
('migration_create_message.js'),
('migration_create_post.js'),
('migration_create_user.js'),
('migration_create_watchfollow.js'),
('migration_create_watchlike.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `dateofbirth` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstName`, `lastName`, `fullName`, `address`, `gender`, `avatar`, `Bio`, `createdAt`, `updatedAt`, `dateofbirth`) VALUES
(5, 'phuctran2802@gmail.com', '$2a$05$.dwBK4kV/weBfWt0SORJLOgCTQBtDElRY/E7h/bnfVTtwopEJd40S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-13 02:20:14', '2024-05-13 07:59:07', '2024-11-05 00:00:00'),
(6, 'abc123@gmail.com', '$2a$05$ntUogbezdcNlKbmovcSmhOUJ7Rgpmgg7F9fx8pb9KvgjkwNbGN9Hm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 03:35:50', '2024-05-22 03:35:50', '2000-02-23 00:00:00'),
(7, 'abc456@gmail.com', '$2a$05$BS5eSYR3bHaVL8ez08LlXu51ERwC/AvgHz7X/e71l1UIU.70fUd0S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 03:36:04', '2024-05-22 03:36:04', '2000-02-23 00:00:00'),
(8, 'abc789@gmail.com', '$2a$05$1AHgz0j.oOSkS8p8EUyaeO4rC3HgJnEYtAxEY4Ec1MRKsFgM1NORC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-22 03:36:14', '2024-05-22 03:36:14', '2000-02-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `watchfollows`
--

CREATE TABLE `watchfollows` (
  `id` int(11) NOT NULL,
  `typeFollows` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watchlikes`
--

CREATE TABLE `watchlikes` (
  `id` int(11) NOT NULL,
  `typeWatchLike` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likespost`
--
ALTER TABLE `likespost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchfollows`
--
ALTER TABLE `watchfollows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchlikes`
--
ALTER TABLE `watchlikes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likespost`
--
ALTER TABLE `likespost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `watchfollows`
--
ALTER TABLE `watchfollows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watchlikes`
--
ALTER TABLE `watchlikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
