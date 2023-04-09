-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 04:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `preprojectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
                            `name` varchar(255) NOT NULL,
                            `category_id` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`name`, `category_id`) VALUES
('Adventure', 1),
('Romance', 2),
('School', 3);


-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
`id` bigint(20) NOT NULL,
`description` varchar(255) NOT NULL,
`image_name` varchar(255) NOT NULL,
`name` varchar(255) NOT NULL,
`price` bigint(20) NOT NULL,
`category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `image_name`, `name`, `price`, `category_id`) VALUES
(1, ' Ngày xưa có một chuyện tình là một câu chuyện cảm động khi người ta yêu nhau, nỗi khát khao một hạnh phúc êm đềm ấm áp đến thế', 'nxcmct.jpg', 'Ngày xưa có một chuyện tình', 23, 1),
(2, ' Tuổi thơ của Ngạn và Hà Lan gắn bó với bao nhiêu kỉ niệm cùng đồi sim, đánh trống trường…', 'matbiec.jpg', 'Mắt biếc', 20, 2),
(3, 'Cuốn sách như một cuốn hồi ký đáng yêu về những trò chơi. Những suy tư rất ngây thơ thời con nít của không riêng tác giả.', 'vedituoitho.jpg', 'Cho tôi xin một vé đi tuổi thơ', 14, 3),
(4, 'Chuyện diễn ra ở quán Đo Đo, quán ăn do tác giả sáng lập để nhớ quê nhà, nơi có chợ Đo Đo – chỗ Quán Gò đi lên ấy. ', 'godilen.jpg', 'Quán gò đi lên', 41, 3),
(5, 'Thằng quỷ nhỏ là một cuốn sách được viết năm 1990 tại Thành phố Hồ Chí Minh. Lối hành văn của tác giả trong truyện mang đậm dấu ấn con người ...', 'thangquynho.png', 'Thằng quỷ nhỏ', 34, 3),
(6, 'Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ.', 'hoavangcx.jpg', 'Tôi thấy hoa vàng trên cỏ xanh"', 17, 3);
-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
                         `id` bigint(20) NOT NULL,
                         `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
                                       (1, 'ROLE_ADMIN'),
                                       (2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `email` varchar(255) NOT NULL,
                         `first_name` varchar(255) NOT NULL,
                         `last_name` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`) VALUES
(1, 'minhquan@gmail.com', 'Minh', 'Quan', '$2a$10$LeXasVyw.rWN1DRpG5QHMO11eYbMEVmFmMFJj7UKBuQZdbO8Gueta'),
(2, 'haana@gmail.com', 'Client', 'CClient', '$2a$10$CCodT9nT9Jh6pE8Wo3/lGOTHW8eySvLg3mSYflRSp2SyIP1I7YaXu');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
                             `id` bigint(20) NOT NULL,
                             `user_id` int(11) NOT NULL,
                             `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
                                                         (1, 1, 2),
                                                         (2, 2, 1),
                                                         (3, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
    ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
    ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_foreign_key` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`);


ALTER TABLE `user_role`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`),
  ADD KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`);


ALTER TABLE `product`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `user_role`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


--
ALTER TABLE `product`
    ADD CONSTRAINT `category_id_foreign_key` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `user_role`
    ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;


