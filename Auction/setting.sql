CREATE TABLE `board` (
  `board_id` int(11) unsigned NOT NULL auto_increment,
  `board_title` varchar(20) NOT NULL DEFAULT '',
  `board_author` varchar(20) DEFAULT NULL,
  `board_date` varchar(20) DEFAULT NULL,
  `board_hits` varchar(20) DEFAULT NULL,
  `board_contents` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`board_id`)
);

CREATE TABLE `cart` (
  `cart_id` int(11) unsigned NOT NULL auto_increment,
  `cart_user` varchar(20) NOT NULL DEFAULT '',
  `cart_item` int(20) unsigned NOT NULL,
  PRIMARY KEY (`cart_id`)
);

CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL auto_increment,
  `comment_author` varchar(20) NOT NULL DEFAULT '',
  `comment_date` varchar(20) DEFAULT NULL,
  `comment_contents` varchar(20) DEFAULT NULL,
  `board_id` varchar(20) DEFAULT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
);

CREATE TABLE `product` (
  `code` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL DEFAULT '',
  `price` varchar(20) NOT NULL DEFAULT '',
  `category` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `image` blob,
  `bidder` varchar(20) DEFAULT '',
  `bid_price` varchar(20) DEFAULT NULL,
  `bid_stack` int(11) DEFAULT '0',
  PRIMARY KEY (`code`)
);

CREATE TABLE `user_account` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `user_password` varchar(20) NOT NULL DEFAULT '',
  `user_email` varchar(20) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_balance` int(20) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`)
);