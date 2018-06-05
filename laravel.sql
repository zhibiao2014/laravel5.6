-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 04, 2018 at 06:30 PM
-- Server version: 5.7.18-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL COMMENT '外键',
  `parent` int(11) DEFAULT NULL COMMENT '父评论id',
  `is_blog` int(11) NOT NULL DEFAULT '0' COMMENT '是否是博主回复：0不是,1是',
  `username` varchar(255) NOT NULL COMMENT '评论者用户名',
  `email` varchar(255) NOT NULL COMMENT '评论者邮箱',
  `url` varchar(255) DEFAULT NULL COMMENT '评论者博客地址',
  `content` text NOT NULL COMMENT '评论内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments_closure`
--

CREATE TABLE `comments_closure` (
  `ancestor` int(10) UNSIGNED NOT NULL,
  `descendant` int(10) UNSIGNED NOT NULL,
  `distance` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(10) UNSIGNED NOT NULL,
  `metas_id` int(10) UNSIGNED NOT NULL COMMENT '分类',
  `title` varchar(255) DEFAULT '默认标题' COMMENT '标题',
  `slug` varchar(255) DEFAULT NULL COMMENT '别名',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `summary` varchar(255) DEFAULT NULL COMMENT '概要',
  `text` text COMMENT '内容',
  `html` text COMMENT '解析内容',
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `favorite_count` int(10) UNSIGNED DEFAULT NULL COMMENT '点赞次数',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '作者',
  `types` varchar(255) NOT NULL DEFAULT '' COMMENT 'types:{"1":"文章","2":"页面","3":"说说"}',
  `criticism` varchar(255) NOT NULL DEFAULT '1' COMMENT 'criticism:{"1":"允许评论","2":"不允许评论"}',
  `template` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `status` varchar(255) NOT NULL DEFAULT 'publish' COMMENT 'status:{"publish":"公开","hidden":"隐藏","password":"密码保护","private":"私有","waiting":"待审核"}',
  `pwd` varchar(255) DEFAULT '' COMMENT '密码',
  `quote` varchar(255) DEFAULT '' COMMENT '引用通告',
  `commentsNum` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `metas_id`, `title`, `slug`, `cover`, `summary`, `text`, `html`, `view_count`, `favorite_count`, `order`, `user_id`, `types`, `criticism`, `template`, `status`, `pwd`, `quote`, `commentsNum`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'test', '1', NULL, NULL, 'test test', '<p>test test</p>', 0, NULL, 0, 1, '1', '1', '', 'publish', '', NULL, 0, '2018-06-04 02:01:36', '2018-06-04 02:01:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_tag`
--

CREATE TABLE `content_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `types` varchar(255) NOT NULL COMMENT '类型名',
  `slug` varchar(255) DEFAULT NULL COMMENT '别名',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `content_count` int(11) NOT NULL DEFAULT '0' COMMENT '该分类下文章总数',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `types_count` int(11) DEFAULT '0' COMMENT '子分类数量',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `parent`, `types`, `slug`, `icon`, `content_count`, `description`, `types_count`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'fenlei', 'lei', NULL, 1, NULL, 0, 100, '2018-06-04 02:01:04', '2018-06-04 02:01:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `metas_closure`
--

CREATE TABLE `metas_closure` (
  `ancestor` int(10) UNSIGNED NOT NULL,
  `descendant` int(10) UNSIGNED NOT NULL,
  `distance` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metas_closure`
--

INSERT INTO `metas_closure` (`ancestor`, `descendant`, `distance`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_04_01_032640_create_metas_table', 1),
(4, '2018_04_01_032827_create_contents_table', 1),
(5, '2018_04_01_032838_create_comments_table', 1),
(6, '2018_04_01_032847_create_tags_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `color` varchar(255) NOT NULL DEFAULT 'black' COMMENT '标签颜色',
  `hot` varchar(255) DEFAULT NULL COMMENT '标签热度',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `Headportrait` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `Headportrait`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'iatw', NULL, '1982890538@qq.com', '$2y$10$vXWrWNXiZrHNnh/E2WQD3OVHcA4hIxyom2tWlWsp.J40/NCbX66ey', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_content_id_foreign` (`content_id`);

--
-- Indexes for table `comments_closure`
--
ALTER TABLE `comments_closure`
  ADD PRIMARY KEY (`ancestor`,`descendant`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_metas_id_foreign` (`metas_id`),
  ADD KEY `content_user_id_foreign` (`user_id`);

--
-- Indexes for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_tag_content_id_foreign` (`content_id`),
  ADD KEY `content_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metas_types_unique` (`types`);

--
-- Indexes for table `metas_closure`
--
ALTER TABLE `metas_closure`
  ADD PRIMARY KEY (`ancestor`,`descendant`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `content_tag`
--
ALTER TABLE `content_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_metas_id_foreign` FOREIGN KEY (`metas_id`) REFERENCES `metas` (`id`),
  ADD CONSTRAINT `content_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `content_tag`
--
ALTER TABLE `content_tag`
  ADD CONSTRAINT `content_tag_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
