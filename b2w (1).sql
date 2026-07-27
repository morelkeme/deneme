-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Tem 2026, 02:43:59
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `b2w`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_wallet`
--

CREATE TABLE `admin_wallet` (
  `id` int(11) NOT NULL,
  `balance` decimal(20,6) DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `admin_wallet`
--

INSERT INTO `admin_wallet` (`id`, `balance`) VALUES
(1, 4.264030);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deaddrop_locations`
--

CREATE TABLE `deaddrop_locations` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `maps_url` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `proof_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `deaddrop_locations`
--

INSERT INTO `deaddrop_locations` (`id`, `product_id`, `city`, `latitude`, `longitude`, `maps_url`, `address`, `proof_image`) VALUES
(5, 8, 'Eskişehir', '39.805993', '30.666982', 'https://www.google.com/maps/@39.7720167,30.5381798,14z?entry=ttu&g_ep=EgoyMDI2MDcxNS4wIKXMDSoASAFQAw%3D%3D', 'Taş Altı', NULL),
(7, 10, 'Eskişehir', '39.805993', '30.500809', 'https://maps.app.goo.gl/G7LPXYh5xomGNjNP9', 'Taş Altı', NULL),
(8, 11, 'Eskişehir', '39.799907', '30.500809', 'https://www.google.com/maps/@39.7720167,30.5381798,14z?entry=ttu&g_ep=EgoyMDI2MDcxNS4wIKXMDSoASAFQAw%3D%3D', 'Taş Altı', NULL),
(9, 12, 'Eskişehir', '39.805993', '30.666982', 'https://www.google.com/maps/@39.7720167,30.5381798,14z?entry=ttu&g_ep=EgoyMDI2MDcxNS4wIKXMDSoASAFQAw%3D%3D', 'Taş Altı', NULL),
(10, 13, 'Eskişehir', '39.799907', '30.500809', 'https://www.google.com/maps/@39.7720167,30.5381798,14z?entry=ttu&g_ep=EgoyMDI2MDcxNS4wIKXMDSoASAFQAw%3D%3D', 'Taş Altı', NULL),
(11, 14, 'Eskişehir', '39.793062', '30.490480', 'https://maps.app.goo.gl/r5GRhs5hmFBQeJwV9', 'Ot Altı', 'proof_6a613f031d59f.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `disputes`
--

CREATE TABLE `disputes` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('open','resolved','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dispute_messages`
--

CREATE TABLE `dispute_messages` (
  `id` int(11) NOT NULL,
  `dispute_id` int(11) NOT NULL,
  `sender_role` enum('buyer','vendor','admin') NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum_categories`
--

CREATE TABLE `forum_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `forum_categories`
--

INSERT INTO `forum_categories` (`id`, `name`, `description`, `icon`) VALUES
(1, 'sex', '1', NULL),
(2, 'cannabis', 'canna', 'fa-tag'),
(3, 'pornhub', 'canna', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum_comments`
--

CREATE TABLE `forum_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `forum_comments`
--

INSERT INTO `forum_comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `avatar`) VALUES
(1, 1, 1, 'x', '2026-07-17 22:41:18', NULL),
(2, 1, 1, 'sexxx', '2026-07-20 11:28:07', NULL),
(3, 1, 1, 'x', '2026-07-20 12:16:41', NULL),
(4, 2, 1, 'xx', '2026-07-21 12:55:22', NULL),
(5, 3, 5, 'xcvxcvxcv', '2026-07-21 14:50:35', NULL),
(6, 4, 5, 'sexdrugs & shorty', '2026-07-21 14:51:29', NULL),
(7, 4, 13, 'sex', '2026-07-22 12:14:03', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum_comment_images`
--

CREATE TABLE `forum_comment_images` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `forum_comment_images`
--

INSERT INTO `forum_comment_images` (`id`, `comment_id`, `image_path`) VALUES
(1, 3, 'comment_6a5e11a9dd922.jpg'),
(2, 4, 'comment_6a5f6c3ae8dbe.jpg'),
(3, 7, 'comment_6a60b40b2b994.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `user_type` enum('user','vendor') NOT NULL DEFAULT 'user',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `category_id`, `user_id`, `vendor_id`, `user_type`, `title`, `content`, `created_at`, `avatar`) VALUES
(1, 1, 1, NULL, 'user', '1', '1', '2026-07-17 22:33:00', NULL),
(2, 1, 1, NULL, 'user', '1', '1', '2026-07-17 22:33:58', NULL),
(3, 2, 5, NULL, 'user', 'deneme', 'szdcvcxvxc', '2026-07-21 14:50:29', NULL),
(4, 1, 5, NULL, 'user', 'sexdrugs & shorty', 'sexdrugs & shorty', '2026-07-21 14:51:24', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum_post_images`
--

CREATE TABLE `forum_post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `forum_post_images`
--

INSERT INTO `forum_post_images` (`id`, `post_id`, `image_path`, `created_at`) VALUES
(1, 2, 'uploads/6a5aadd6de14f.jpg', '2026-07-17 22:33:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_name` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `sender_name`, `message`, `created_at`) VALUES
(1, 6, 1, NULL, 'sex', '2026-07-20 12:02:31'),
(2, 1, 6, NULL, 'cxvxcvxcv', '2026-07-21 13:43:15'),
(3, 6, 1, NULL, 'cxvxcv', '2026-07-21 14:45:41'),
(4, 6, 5, NULL, 'cxvxcv', '2026-07-21 14:45:46'),
(5, 6, 2, NULL, 'cxvxcvxc', '2026-07-21 14:45:49');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `vendor_id` int(11) DEFAULT NULL,
  `currency` varchar(10) DEFAULT 'TRY',
  `delivery_type` varchar(50) DEFAULT 'standard',
  `shipping_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `product_name`, `quantity`, `price`, `status`, `created_at`, `vendor_id`, `currency`, `delivery_type`, `shipping_address`) VALUES
(1, 8, 11, NULL, 1, 1.00, 'processing', '2026-07-21 19:53:28', 1, 'USDT', 'deaddrop', 'Dead Drop - Ödeme onaylı, detaylar siparişlerim sayfasında'),
(2, 8, 13, NULL, 1, 1.00, 'completed', '2026-07-21 20:26:09', 2, 'USDT', 'deaddrop', 'Dead Drop - Anında Teslim');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `price_currency` varchar(10) NOT NULL,
  `pay_currency` varchar(10) NOT NULL,
  `payment_type` enum('vendor_fee','order') NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post_images`
--

CREATE TABLE `post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'TRX',
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `icon`) VALUES
(1, 'esrar', 'fa-tag'),
(2, 'sex', 'fa-tag'),
(10, 'DENEME', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_countries`
--

CREATE TABLE `product_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 13, 8, 5, 'kötüydü', '2026-07-23 12:17:37');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `system_updates`
--

CREATE TABLE `system_updates` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `system_updates`
--

INSERT INTO `system_updates` (`id`, `title`, `description`, `created_at`, `is_active`) VALUES
(1, 'Escrow Sistemi Aktif', 'Tüm işlemler artık %7 komisyonla havuz üzerinden gerçekleşiyor, bu şekilde paranız güvende kalıyor.', '2026-07-22 12:00:00', 1),
(2, 'Dead Drop Altyapısı', 'Dead drop teslimatlar için konum bazlı gizli teslimat sistemi entegre edildi.', '2026-07-20 10:00:00', 1),
(3, 'Versiyon 1.0 Yayında', 'Güvenlik önlemleri alındı, Forum ve Marketplace sistemi aktif edildi.', '2026-07-18 00:00:00', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','pending','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `name`, `email`, `subject`, `message`, `status`, `created_at`) VALUES
(1, 1, 'sexdrugs', 'xxxx@gmail.cc', 'deneme', 'xzcvcvxcv', 'open', '2026-07-20 11:02:37'),
(2, 1, 'sexdrugs', 'xxxx@gmail.cc', 'cxvxcv', 'xcvcxvxv', 'open', '2026-07-21 13:51:28'),
(3, 6, 'free', 'bee@gmail.cc', 'deneme', 'cxvxcvcxv', 'open', '2026-07-21 14:45:37'),
(4, 5, 'deneme', 'deneme@ff.ss', 'deneme', 'sex', 'open', '2026-07-21 14:51:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_banned` tinyint(1) DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('user','admin','vendor') NOT NULL DEFAULT 'user',
  `status` enum('active','banned') DEFAULT 'active',
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `is_banned`, `name`, `surname`, `address`, `role`, `status`, `profile_picture`, `created_at`, `avatar`, `about`, `vendor_id`) VALUES
(1, 'sexdrugs', '$2y$10$IXgQsp3Tahx86G9mxZigAulOawI0CeLgAC7UVHMVob9glM/zrRxye', 'xxxx@gmail.cc', 1, NULL, NULL, NULL, 'admin', 'active', 'uploads/profile_6a5aa8035bebb5.65698098.jpg', '2026-07-17 21:49:26', NULL, NULL, NULL),
(2, 'sex', '123456', '', 1, NULL, NULL, NULL, 'admin', 'active', NULL, '2026-07-17 22:28:20', NULL, NULL, NULL),
(4, 'narc', 'e10adc3949ba59abbe56e057f20f883e', 'admin@b2w.com', 1, 'Admin', 'User', 'Eskişehir', 'admin', 'active', NULL, '2026-07-17 22:31:05', NULL, NULL, NULL),
(5, 'deneme', '$2y$10$pymDpHsXjfM4pwVK991GeuM.pZ6sImZDaE7UlEU2MMtLlIzRYdqd6', 'deneme@ff.ss', 1, NULL, NULL, NULL, 'user', 'active', 'uploads/profile_6a5acf3d17a8c8.51152535.png', '2026-07-17 23:04:47', NULL, NULL, NULL),
(6, 'free', '$2y$10$vqPvu7CU/M/XEvm13qezcOW47CnZh/2ZNpS6LEdDL7l7YaBAS6JMu', 'bee@gmail.cc', 1, NULL, NULL, NULL, 'vendor', 'active', NULL, '2026-07-17 23:40:38', NULL, NULL, NULL),
(7, 'arsızca', '$2y$10$y0Ej5jveKGLm39taP5sww.K5Ebv6x24pzh3pndMQOOah5lw5WnQgC', 'boz@gg.ss', 0, NULL, NULL, NULL, 'user', 'active', NULL, '2026-07-20 11:08:43', NULL, NULL, NULL),
(8, 'notredame', '$2y$12$mUY7ROlx9qrlnZpZzsCnh.alahOJjObAGdQW.jToeIPZi7XZAtZLe', 'notredame@jabber.cc', 0, NULL, NULL, NULL, 'user', 'active', NULL, '2026-07-21 19:31:21', NULL, NULL, NULL),
(9, 'account', '$2y$12$uJDFe1sF3/A5olUbPVDbwunANP5LbzVVm4d3bRKl6BbVoLaBDZ1HG', 'account@gg.cc', 0, NULL, NULL, NULL, 'vendor', 'active', NULL, '2026-07-21 20:23:28', NULL, NULL, NULL),
(10, 'sapil', '$2y$12$ThWp5si.c0AXLtpcZBvzN.upodbUKjJoOmKilx5C8K7Y4vTHomwNu', 'bb@gg.cc', 0, NULL, NULL, NULL, 'admin', 'active', NULL, '2026-07-21 21:47:18', NULL, NULL, NULL),
(11, 'face', '$2y$12$MXytuHfpi3v/pcZQacqBoumZR.6lUkTqb2EFbW61sHFIVX6aUY.K2', 'face@vf.tt', 0, NULL, NULL, NULL, 'user', 'active', NULL, '2026-07-21 21:52:13', NULL, NULL, NULL),
(12, 'sheesh', '$2y$12$bkkggRtUJLL/S29LPF1l1.2hsGdzgp2gPoMCY631rkw7hEdrED5Ha', 'sheesh@11.ss', 0, NULL, NULL, NULL, 'user', 'active', NULL, '2026-07-21 22:16:56', NULL, NULL, NULL),
(13, 'pasta', '$2y$12$l3heI/HmV0Nb8pNmJMuKru53M5K/aq0EKmi/XtI67zlN23o6Bra5O', 'root@root.cc', 0, NULL, NULL, NULL, 'user', 'active', NULL, '2026-07-22 12:04:11', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('active','banned') DEFAULT 'active',
  `profile_photo` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `pgp_key` text DEFAULT NULL,
  `monero_wallet` varchar(255) DEFAULT NULL,
  `tron_wallet` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vendors`
--

INSERT INTO `vendors` (`id`, `username`, `password`, `email`, `status`, `profile_photo`, `bio`, `pgp_key`, `monero_wallet`, `tron_wallet`, `created_at`, `avatar`, `about`, `vendor_id`) VALUES
(1, 'sexdrugs', '$2y$10$6wz8O6WK39zxL8/nJ8esV.AGZcvHcaEKjAeXAtf.eeAqujMAu5kha', 'xxxx@gmail.cc', 'active', NULL, NULL, NULL, NULL, NULL, '2026-07-18 00:06:58', NULL, NULL, NULL),
(2, 'account', '$2y$12$uJDFe1sF3/A5olUbPVDbwunANP5LbzVVm4d3bRKl6BbVoLaBDZ1HG', 'account@gg.cc', 'active', NULL, NULL, NULL, NULL, NULL, '2026-07-21 20:23:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vendor_products`
--

CREATE TABLE `vendor_products` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'TRX',
  `delivery_type` varchar(20) DEFAULT 'shipping',
  `is_deadrop` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `stock` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vendor_products`
--

INSERT INTO `vendor_products` (`id`, `vendor_id`, `category_id`, `country_id`, `name`, `description`, `price`, `currency`, `delivery_type`, `is_deadrop`, `created_at`, `stock`, `image`, `category`) VALUES
(8, 1, 1, NULL, 'california love 2G', '123213', 58.00, 'USDT', 'deaddrop', 0, '2026-07-20 10:51:03', 1, 'prod_6a5dfd972155a.jpg', NULL),
(10, 1, 2, NULL, 'deneme', 'sex', 50.00, 'USDT', 'deaddrop', 0, '2026-07-21 15:08:10', 1, 'prod_6a5f8b5a89de6.png', NULL),
(11, 1, 10, NULL, '1 dollar', '1', 1.00, 'USDT', 'deaddrop', 0, '2026-07-21 19:48:24', 0, 'prod_6a5fcd08f0b47.png', NULL),
(12, 1, 10, NULL, 'PornHub', 'zxcvzxcxz', 1.00, 'USDT', 'deaddrop', 0, '2026-07-21 20:22:55', 1, 'prod_6a5fd51fc7aac.png', NULL),
(13, 2, 2, NULL, 'kargo', 'cvcxv', 1.00, 'USDT', 'deaddrop', 0, '2026-07-21 20:24:20', 2, 'prod_6a5fd574cf941.png', NULL),
(14, 1, 10, NULL, 'Marvel Extazi 5 Adet', 'Marvel Çift Baskı Extazi', 53.00, 'USDT', 'deaddrop', 0, '2026-07-22 22:06:59', 20, 'prod_6a613f031ab2e.jpg', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vendor_reviews`
--

CREATE TABLE `vendor_reviews` (
  `id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `vendor_reviews`
--

INSERT INTO `vendor_reviews` (`id`, `vendor_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 1, 5, 'vcbcvb', '2026-07-18 12:26:23'),
(2, 1, 7, 1, 'haha', '2026-07-20 11:08:55');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `monero_address` varchar(255) DEFAULT NULL,
  `monero_balance` decimal(20,8) DEFAULT 0.00000000,
  `tron_address` varchar(255) DEFAULT NULL,
  `tron_private_key` varchar(255) DEFAULT NULL,
  `tron_balance` decimal(20,6) DEFAULT 0.000000,
  `is_vendor` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `vendor_id`, `monero_address`, `monero_balance`, `tron_address`, `tron_private_key`, `tron_balance`, `is_vendor`, `created_at`) VALUES
(1, 1, NULL, NULL, 0.00000000, 'TXsLme1ikBmp7RyeKP15cFDLqVeGwj31iq', 'f89eedc6927e0aa75bcdf9c5c8ea476ed2dcb712d827cb58312fd436cf6fee7e', 0.000000, 0, '2026-07-17 21:51:56'),
(2, 5, NULL, NULL, 0.00000000, 'TT3fYArje8CRJaaJR2TARCo2NVTppCeQW4', '29430a8f27c04c8291cc62bf66ae8581ae74ec3584f9d06b98b2b5d395eb00aa', 0.000000, 0, '2026-07-17 23:18:36'),
(3, 6, NULL, NULL, 0.00000000, 'TQcNJiD8acoG9fTLNov9DTEt2CpHDSa6Xw', '7ff07e132af823ea9bd20851168e699a96714b83186ae12f104e77e8c16f759f', 0.000000, 0, '2026-07-20 11:31:37'),
(4, 8, NULL, NULL, 0.00000000, 'TC1LoivS8r7A9EqdBeDwbegQrmpF9njCAs', 'e7aab1fba6d9438e8078fae1209ba7f394419e31a46b5616998e4b27185da1ca', 0.000000, 0, '2026-07-21 19:31:28'),
(5, 9, NULL, NULL, 0.00000000, 'TRHDPFc2difMzMeku6qaep1sG7wGN2EEPw', '02f00edd1f5b395738b1bcd991ba432876ccd5ad3a570ed1cbc4588fed844ce2', 0.000000, 0, '2026-07-21 21:17:57'),
(6, 10, NULL, NULL, 0.00000000, 'TZD9NgQDjBp5pbDiMSiY1njoWUVEEhpUAM', '25690806ea50b6c1ce02173bd9eadc55232e71f661bdb2dcde4a40d4aebaa005', 0.000000, 0, '2026-07-21 21:48:09'),
(7, 11, NULL, NULL, 0.00000000, 'TUzWwp3Je2dE6HZAiUAmAzEN6PZmEaGsmh', 'd2e38256cd431587f6426b755e45e4bff5d9e30414697713fa72ee7fc7239f5c', 0.000000, 0, '2026-07-21 21:52:17'),
(8, 12, NULL, NULL, 0.00000000, 'TCnwBZ6tqXW2E57VNkVWok7j2JrjyDSnS2', '426aa1bd252b36dab4f0d3421ed6149a17c73d0f10c811fbb5514955e3a211bd', 0.000000, 0, '2026-07-21 22:17:16'),
(9, 13, NULL, NULL, 0.00000000, 'TL7X3xW6Lps39p59METhRiZBCNDGJpPvRF', '21d49013a33393d3db09012ad11a24bce1b70181e9706ab0a933ed4c3071b533', 0.000000, 0, '2026-07-22 12:04:19');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin_wallet`
--
ALTER TABLE `admin_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_product_unique` (`user_id`,`product_id`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `deaddrop_locations`
--
ALTER TABLE `deaddrop_locations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Tablo için indeksler `dispute_messages`
--
ALTER TABLE `dispute_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispute_id` (`dispute_id`);

--
-- Tablo için indeksler `forum_categories`
--
ALTER TABLE `forum_categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `forum_comment_images`
--
ALTER TABLE `forum_comment_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Tablo için indeksler `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Tablo için indeksler `forum_post_images`
--
ALTER TABLE `forum_post_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_countries`
--
ALTER TABLE `product_countries`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `system_updates`
--
ALTER TABLE `system_updates`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Tablo için indeksler `vendor_reviews`
--
ALTER TABLE `vendor_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin_wallet`
--
ALTER TABLE `admin_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `deaddrop_locations`
--
ALTER TABLE `deaddrop_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `dispute_messages`
--
ALTER TABLE `dispute_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `forum_categories`
--
ALTER TABLE `forum_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `forum_comment_images`
--
ALTER TABLE `forum_comment_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `forum_post_images`
--
ALTER TABLE `forum_post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `product_countries`
--
ALTER TABLE `product_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `system_updates`
--
ALTER TABLE `system_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `vendor_products`
--
ALTER TABLE `vendor_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `vendor_reviews`
--
ALTER TABLE `vendor_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Tablo kısıtlamaları `dispute_messages`
--
ALTER TABLE `dispute_messages`
  ADD CONSTRAINT `dispute_messages_ibfk_1` FOREIGN KEY (`dispute_id`) REFERENCES `disputes` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD CONSTRAINT `forum_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `forum_comment_images`
--
ALTER TABLE `forum_comment_images`
  ADD CONSTRAINT `forum_comment_images_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `forum_comments` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `forum_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_posts_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Tablo kısıtlamaları `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Tablo kısıtlamaları `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `vendor_products`
--
ALTER TABLE `vendor_products`
  ADD CONSTRAINT `vendor_products_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_products_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `product_countries` (`id`) ON DELETE SET NULL;

--
-- Tablo kısıtlamaları `vendor_reviews`
--
ALTER TABLE `vendor_reviews`
  ADD CONSTRAINT `vendor_reviews_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
