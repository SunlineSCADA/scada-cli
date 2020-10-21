-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `id` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT 'Id устройства',
  `type` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '' COMMENT 'Тип',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT 'Название',
  `system` varchar(64) NOT NULL DEFAULT '' COMMENT 'Система',
  `section` varchar(16) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Id раздела в скаде',
  `gateway` varchar(16) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Id шлюза',
  `status_variable` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Id переменной статуса',
  `serial` varchar(64) NOT NULL DEFAULT '',
  `model` varchar(64) NOT NULL DEFAULT '' COMMENT 'Модель',
  `location` varchar(128) NOT NULL DEFAULT '' COMMENT 'Расположение',
  `service` varchar(128) NOT NULL DEFAULT '' COMMENT 'Обслуживает',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT 'Описание',
  `additional` varchar(128) NOT NULL DEFAULT '' COMMENT 'Дополнительная информация',
  `connection_info` varchar(64) NOT NULL DEFAULT '' COMMENT 'Адрес',
  `driver_type` varchar(32) NOT NULL DEFAULT '' COMMENT 'Тип драйвера',
  `mnemo` varchar(128) NOT NULL DEFAULT '' COMMENT 'Файл мнемосхемы',
  `url` varchar(64) NOT NULL DEFAULT '' COMMENT 'Страница устройства',
  `bg_image` varchar(32) NOT NULL DEFAULT '' COMMENT 'Путь до файла изображения',
  `variables_tile` text CHARACTER SET ascii NOT NULL DEFAULT '[]' COMMENT 'Список переменных на плитке',
  `variables_info` text NOT NULL DEFAULT '{}' COMMENT 'Информация о переменных',
  `commands` text CHARACTER SET ascii NOT NULL DEFAULT '[]' COMMENT 'Список всех команд',
  `commands_tile` text CHARACTER SET ascii NOT NULL DEFAULT '[]' COMMENT 'Список переменных-команд',
  `comment` varchar(512) NOT NULL DEFAULT '' COMMENT 'Комментарий пользователя',
  `comment_author` varchar(64) NOT NULL DEFAULT '' COMMENT 'Автор комментария',
  `comment_author_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Id автора комментария',
  `comment_date` datetime DEFAULT NULL COMMENT 'Дата комментария',
  `config_path` varchar(128) NOT NULL DEFAULT '' COMMENT 'Путь к файлу конфигурации',
  `plugins` text NOT NULL DEFAULT '[]' COMMENT 'Список активных плагинов',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `handlers`;
CREATE TABLE `handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `title` varchar(32) NOT NULL DEFAULT 'Безымянная',
  `theme` varchar(16) NOT NULL DEFAULT 'indigo',
  `demo` tinyint(4) NOT NULL DEFAULT 0,
  `brand_logo` varchar(64) NOT NULL DEFAULT 'brand.svg',
  `icon` varchar(64) NOT NULL DEFAULT 'icon.png',
  `notification_sound` varchar(64) NOT NULL DEFAULT '',
  `default_device_image` varchar(64) NOT NULL DEFAULT '',
  `top_sections` text NOT NULL DEFAULT '[]',
  `home_has_journal` tinyint(4) NOT NULL DEFAULT 1,
  `home_journal_all` tinyint(4) NOT NULL DEFAULT 0,
  `home_sections_hide` tinyint(4) NOT NULL DEFAULT 0,
  `top_icons_only` tinyint(4) NOT NULL DEFAULT 0,
  `state_stopped_hide` tinyint(4) NOT NULL DEFAULT 0,
  `device_admin_tools_hide` tinyint(4) NOT NULL DEFAULT 0,
  `dev_logo` varchar(64) NOT NULL DEFAULT 'copyright.svg',
  `dev_url` varchar(64) NOT NULL DEFAULT '',
  `dev_email` varchar(64) NOT NULL DEFAULT '',
  `dev_phone` varchar(32) NOT NULL DEFAULT '',
  `expression_language` varchar(8) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `info` (`title`, `theme`, `demo`, `brand_logo`, `icon`, `notification_sound`, `default_device_image`, `top_sections`, `home_has_journal`, `home_journal_all`, `home_sections_hide`, `top_icons_only`, `state_stopped_hide`, `device_admin_tools_hide`, `dev_logo`, `dev_url`, `dev_email`, `dev_phone`, `expression_language`) VALUES
('Демонстрация',	'form',	0,	'logo.svg',	'sunline-icon.png',	'alarm2.mp3',	'background.jpg',	'[\"plugins/wiki\",\"_sep\",\"plugins/add-dev\",\"plugins/rack_monitor\",\"_sep\",\"chart\",\"doc\",\"scheduler\",\"plugins/admin\",\"plugins/check_list\",\"_sep\",\"file-explorer\",\"go-to-device\",\"plugins/rack_monitor2\",\"_right\",\"_search\",\"_menu\",\"_sep\",\"journal\",\"_sidebar\",\"home\",\"alarms\",\"users\",\"_sections\",\"handlers\",\"important\",\"_menu_items\",\"site-settings\",\"_sep\",\"user-settings\",\"app-settings\",\"_sep\",\"favorites\",\"mailing\",\"_sep\",\"autorefresh\",\"_sep\",\"check-updates\",\"export-devices\",\"export-variables\",\"plugins/all-demos\",\"plugins/all-demos2\",\"logout\",\"refresh-all\",\"plugins/docker\"]',	1,	0,	0,	1,	0,	1,	'copyright.svg',	'http://controllergroup.ru/',	'',	'+7 (911) 811-50-39',	'ru');

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` varchar(16) CHARACTER SET ascii NOT NULL,
  `section` text CHARACTER SET ascii NOT NULL DEFAULT '["root"]',
  `title` varchar(32) CHARACTER SET utf8 NOT NULL,
  `subtitle` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `symbol` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '',
  `mnemo` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `view` varchar(16) NOT NULL DEFAULT 'tiles_mnemo',
  `subtitle_prop` varchar(64) NOT NULL DEFAULT '_service',
  `important` tinyint(4) NOT NULL DEFAULT 0,
  `is_mixed` tinyint(4) NOT NULL DEFAULT 0,
  `is_hidden_sidebar` tinyint(4) NOT NULL DEFAULT 0,
  `devs` text CHARACTER SET ascii NOT NULL DEFAULT '[]',
  `slideshow` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `slideshow_width` int(11) NOT NULL DEFAULT 50,
  `has_summary` tinyint(4) NOT NULL DEFAULT 0,
  `sorting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `owners` text CHARACTER SET ascii NOT NULL DEFAULT '[]',
  `linked_dev_id` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '',
  `use_dev_state` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `sunline_control_table`;
CREATE TABLE `sunline_control_table` (
  `id` varchar(16) NOT NULL,
  `command` varchar(32) NOT NULL,
  `arguments` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `core` int(11) NOT NULL DEFAULT 0,
  KEY `core` (`core`)
) ENGINE=MEMORY DEFAULT CHARSET=ascii;


DROP TABLE IF EXISTS `sunline_data_archive_table`;
CREATE TABLE `sunline_data_archive_table` (
  `date` datetime NOT NULL,
  `dev_id` varchar(20) NOT NULL,
  `state` int(11) NOT NULL,
  `vars` text NOT NULL,
  KEY `dev_id_date` (`dev_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;


DROP TABLE IF EXISTS `sunline_data_current_table`;
CREATE TABLE `sunline_data_current_table` (
  `id` varchar(32) NOT NULL COMMENT 'id установки',
  `state` int(11) NOT NULL DEFAULT -1 COMMENT 'Состояние',
  `alarms` text NOT NULL DEFAULT '[]' COMMENT 'Коды аварий',
  `data` text NOT NULL DEFAULT '{}' COMMENT 'Параметры',
  `is_confirmed` int(11) NOT NULL DEFAULT 0 COMMENT 'Факт квитирования',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Таблица состояний всех устройств';


DROP TABLE IF EXISTS `sunline_event_table`;
CREATE TABLE `sunline_event_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id события',
  `core_id` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Id ядра',
  `time` datetime NOT NULL COMMENT 'Дата события',
  `source` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Устройство',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Тип события',
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Сообщение',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Id пользователя',
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Факт квитирования',
  `confirm_date` datetime DEFAULT NULL COMMENT 'Дата квитирования',
  `confirm_author` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Автор квитирования',
  `confirm_author_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Id автора квитирования',
  `confirm_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Комментарий при квитировании',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Родительское событие',
  PRIMARY KEY (`id`,`core_id`),
  KEY `message` (`message`(255)),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `sunline_scheduler_table`;
CREATE TABLE `sunline_scheduler_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger` varchar(16) CHARACTER SET ascii NOT NULL DEFAULT '',
  `time` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '{}',
  `commands` varchar(1024) CHARACTER SET ascii NOT NULL DEFAULT '{}',
  `description` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sunline_templates_table`;
CREATE TABLE `sunline_templates_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 7,
  `period` int(11) NOT NULL DEFAULT 0,
  `vars` text CHARACTER SET ascii NOT NULL DEFAULT '{}',
  `background` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sunline_user_table`;
CREATE TABLE `sunline_user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `privilege` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notify_email` tinyint(4) NOT NULL DEFAULT 0,
  `notify_email_types` text COLLATE utf8_unicode_ci NOT NULL DEFAULT '["disconnect","alarm"]',
  `phone` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `night_mode` varchar(8) CHARACTER SET ascii NOT NULL DEFAULT 'auto',
  `theme` varchar(16) CHARACTER SET ascii NOT NULL DEFAULT 'default',
  `favorites` text CHARACTER SET ascii NOT NULL DEFAULT '[]',
  `mailing` text CHARACTER SET ascii NOT NULL DEFAULT '[]',
  `session_length` int(11) NOT NULL DEFAULT 24,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sunline_user_table` (`id`, `login`, `token`, `plugin_token`, `password`, `username`, `privilege`, `position`, `email`, `notify_email`, `notify_email_types`, `phone`, `night_mode`, `theme`, `favorites`, `mailing`, `session_length`, `last_login`) VALUES
(1,	'admin',	'pRP/seTlN/mrhCFuXpX+6sNhqqw=',	'2qCHC07djvSjIeWiGVcO+k/IdqM=',	'$2a$10$snOFYNOtcOoqysPobRKfFOhNp6CLkOH6TT66yoD86Xg7CXUtnP4HG',	'Администратор',	'wpvua',	'',	'',	0,	'[\"disconnect\",\"disconnect_elim\",\"alarm\",\"alarm_elim\"]',	'',	'auto',	'',	'[]',	'[]',	0,	NULL),
(2,	'demo',	'hthdSP6mn+ruj6YvGmLdrOD/51g=',	'SRREJsolGfxGZmdbxK8+vgRSZVQ=',	'$2a$10$eYGGe4KGfXTPF4F4skdUr.XMNZRC.ONiPqpPfDvOEd7lI8zjpNpmO',	'Демонстрация',	'',	'',	'',	0,	'[\"disconnect\",\"disconnect_elim\",\"alarm\",\"alarm_elim\"]',	'',	'auto',	'',	'[]',	'[]',	24,	NULL);

DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `privilege` varchar(8) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'Гость',
  PRIMARY KEY (`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user_groups` (`privilege`, `title`) VALUES
('',	'Гость'),
('p',	'Дизайнер'),
('w',	'Управление'),
('wp',	'Дежурный инженер'),
('wpv',	'Пусконаладчик'),
('wpvu',	'Дежурный инженер ПЛЮС'),
('wpvua',	'Разработчик');

DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `id` varchar(32) CHARACTER SET ascii NOT NULL,
  `dev_id` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(16) CHARACTER SET ascii NOT NULL DEFAULT '',
  `data` text NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `logic_type` varchar(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `logic_data` text CHARACTER SET ascii NOT NULL DEFAULT '{}',
  `important_min` float DEFAULT NULL,
  `important_max` float DEFAULT NULL,
  `warn_min` float DEFAULT NULL,
  `warn_max` float DEFAULT NULL,
  `alarm_min` float DEFAULT NULL,
  `alarm_max` float DEFAULT NULL,
  `time_in` float DEFAULT NULL,
  `time_out` float DEFAULT NULL,
  PRIMARY KEY (`id`,`dev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2020-10-19 00:55:01
