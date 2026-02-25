/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 10.4.27-MariaDB : Database - perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpustakaan`;

/*Table structure for table `anggota` */

DROP TABLE IF EXISTS `anggota`;

CREATE TABLE `anggota` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `status` enum('aktif','non aktif') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `anggota` */

insert  into `anggota`(`id`,`user_id`,`nis`,`kelas`,`alamat`,`status`) values (1,'2','234525r2','13','BAKOM',NULL),(2,'3','129','12','Bekasi',NULL),(3,'4','129','12','Downtown',NULL),(4,'5','129','12','asd',NULL),(5,'6','129','11','jonggol',NULL),(6,'7','2349','13','Serba',NULL);

/*Table structure for table `buku` */

DROP TABLE IF EXISTS `buku`;

CREATE TABLE `buku` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kode_buku` varchar(50) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `stok` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `buku` */

/*Table structure for table `peminjaman` */

DROP TABLE IF EXISTS `peminjaman`;

CREATE TABLE `peminjaman` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `anggota_id` int(20) DEFAULT NULL,
  `buku_id` int(20) DEFAULT NULL,
  `tgl_pinjam` varchar(50) DEFAULT NULL,
  `tgl_kembali` varchar(50) DEFAULT NULL,
  `status` enum('aktif','td aktif') DEFAULT NULL,
  `no_peminjaman` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `peminjaman` */

/*Table structure for table `peminjaman_detail` */

DROP TABLE IF EXISTS `peminjaman_detail`;

CREATE TABLE `peminjaman_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `peminjaman_id` int(20) DEFAULT NULL,
  `buku_id` int(20) DEFAULT NULL,
  `qty` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

/*Data for the table `peminjaman_detail` */

/*Table structure for table `pengembalian` */

DROP TABLE IF EXISTS `pengembalian`;

CREATE TABLE `pengembalian` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `peminjaman_id` int(20) DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `pengembalian` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` enum('admin','anggota') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`nama`,`username`,`password`,`role`,`created_at`) values (5,'nami','admin','$2y$10$HZoG8HybNNf5ImHYizrpJ.3S4Yn7Yk25urZj/OrOd4vzdcU7DvSjq','anggota',NULL),(2,'asDAS','SDAA','$2y$10$O/Eni1qCkXKODf3X0igghusz/XJ9vMDXoH2YICDjPf/oKfjNZycKq','',NULL),(4,'asDAS','admin','$2y$10$IKFJRGt9.YCLKLaX6vrJ2OYpE.pmaxwCxXpVShgwp.k5ujlPSKyN2','anggota',NULL),(6,'nia','Haikal','$2y$10$kE06uc66NSNCxprU9SvS3uT0wjaC.qDEOd64gJ/Kd.2BgGu5GixpK','anggota',NULL),(7,'Nao','Haikal','$2y$10$fx85xpsOrJsI7IKA2Ui4c.qdlUK.Zyx.Nk5ycLdSzvCTJl0oKuGC.','anggota',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
