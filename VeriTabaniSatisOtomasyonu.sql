-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 10 Oca 2021, 13:43:14
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `satis otomasyonu`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kargolar`
--

CREATE TABLE `kargolar` (
  `kargoID` int(11) NOT NULL,
  `kargoSirket` varchar(40) NOT NULL,
  `kargoTelefon` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `kargolar`
--

INSERT INTO `kargolar` (`kargoID`, `kargoSirket`, `kargoTelefon`) VALUES
(0, 'yurtici', '1515121'),
(1, 'aras', '1515121');

--
-- Tetikleyiciler `kargolar`
--
DELIMITER $$
CREATE TRIGGER `after_kargolar_update` AFTER UPDATE ON `kargolar` FOR EACH ROW BEGIN
INSERT INTO kargolartrigger SET kargoID = OLD.kargoID, kargoSirket = OLD.kargoSirket, kargoTelefon = OLD.kargoTelefon;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kargolartrigger`
--

CREATE TABLE `kargolartrigger` (
  `kargoTriggerID` int(11) NOT NULL,
  `kargoID` int(11) NOT NULL,
  `kargoSirket` varchar(40) NOT NULL,
  `kargoTelefon` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `kargolartrigger`
--

INSERT INTO `kargolartrigger` (`kargoTriggerID`, `kargoID`, `kargoSirket`, `kargoTelefon`) VALUES
(0, 1, 'yurtici', '12264116');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategoriID` int(11) NOT NULL,
  `kategoriAdi` varchar(15) NOT NULL,
  `kategoriBilgi` text NOT NULL,
  `kategoriGorsel` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tetikleyiciler `kategoriler`
--
DELIMITER $$
CREATE TRIGGER `after_kategoriler_update` AFTER UPDATE ON `kategoriler` FOR EACH ROW BEGIN
INSERT INTO kategoritrigger SET kategoriID = OLD.kategoriID,
kategoriAdi = OLD.kategoriAdi, kategoriBilgi = OLD.kategoriBilgi,kategoriGorsel = OLD.kategoriGorsel;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoritrigger`
--

CREATE TABLE `kategoritrigger` (
  `kategoriTriggerID` int(11) NOT NULL,
  `kategoriID` int(11) NOT NULL,
  `kategoriAdi` varchar(15) NOT NULL,
  `kategoriBilgi` text NOT NULL,
  `kategoriGorsel` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `musteriID` int(11) NOT NULL,
  `adres` varchar(60) NOT NULL,
  `sehir` varchar(15) NOT NULL,
  `telefon` varchar(24) NOT NULL,
  `email` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`musteriID`, `adres`, `sehir`, `telefon`, `email`) VALUES
(0, 'gaziantep', 'hatay', '545451', 'email@hotmail');

--
-- Tetikleyiciler `musteriler`
--
DELIMITER $$
CREATE TRIGGER `after_musteriler_update` AFTER UPDATE ON `musteriler` FOR EACH ROW BEGIN 
INSERT INTO musterilertrigger SET musteriID = OLD.musteriID, adres = OLD.adres, sehir = OLD.sehir,telefon = OLD.telefon,email = OLD.email;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musterilertrigger`
--

CREATE TABLE `musterilertrigger` (
  `musteriTriggerID` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `adres` varchar(60) NOT NULL,
  `sehir` varchar(15) NOT NULL,
  `telefon` varchar(24) NOT NULL,
  `email` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `musterilertrigger`
--

INSERT INTO `musterilertrigger` (`musteriTriggerID`, `musteriID`, `adres`, `sehir`, `telefon`, `email`) VALUES
(0, 0, 'iskenderun', 'hatay', '545451', 'email@hotmail');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musterisiparis`
--

CREATE TABLE `musterisiparis` (
  `siparisID` int(11) NOT NULL,
  `urunID` int(11) NOT NULL,
  `urunBirimFiyati` smallint(6) NOT NULL,
  `miktar` smallint(6) NOT NULL,
  `kampanya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tetikleyiciler `musterisiparis`
--
DELIMITER $$
CREATE TRIGGER `after_musterisiparis_update` AFTER UPDATE ON `musterisiparis` FOR EACH ROW BEGIN 
INSERT INTO musterisiparistrigger SET siparisID = OLD.siparisID, urunID = OLD.urunID, urunBirimFiyati = OLD.urunBirimFiyati,miktar = OLD.miktar,kampanya = OLD.kampanya;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musterisiparistrigger`
--

CREATE TABLE `musterisiparistrigger` (
  `siparisTriggerID` int(11) NOT NULL,
  `siparisID` int(11) NOT NULL,
  `urunID` int(11) NOT NULL,
  `urunBirimFiyati` smallint(6) NOT NULL,
  `miktar` smallint(6) NOT NULL,
  `kampanya` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `siparisID` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `siparisTarihi` datetime NOT NULL,
  `kargoID` int(11) NOT NULL,
  `sevkTarihi` datetime NOT NULL,
  `sevkAdresi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tetikleyiciler `siparisler`
--
DELIMITER $$
CREATE TRIGGER `after_siparisler_update` AFTER UPDATE ON `siparisler` FOR EACH ROW BEGIN 
INSERT INTO siparislertrigger SET siparisID = OLD.siparisID, musteriID = OLD.musteriID, siparisTarihi = OLD.siparisTarihi,kargoID = OLD.kargoID,sevkTarihi = OLD.sevkTarihi,sevkAdresi=OLD.sevkAdresi;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparislertrigger`
--

CREATE TABLE `siparislertrigger` (
  `siparisTriggerID` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `siparisTarihi` datetime NOT NULL,
  `kargoID` int(11) NOT NULL,
  `sevkTarihi` datetime NOT NULL,
  `sevkAdresi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urunID` int(11) NOT NULL,
  `urunAdi` varchar(40) NOT NULL,
  `kategoriID` int(11) NOT NULL,
  `urunBirimAdedi` varchar(20) NOT NULL,
  `birimFiyati` smallint(6) NOT NULL,
  `urunStogu` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tetikleyiciler `urunler`
--
DELIMITER $$
CREATE TRIGGER `after_urunler_update` AFTER UPDATE ON `urunler` FOR EACH ROW BEGIN 
INSERT INTO urunlertrigger SET urunID = OLD.urunID, urunAdi = OLD.urunAdi, kategoriID = OLD.kategoriID,urunBirimAdedi = OLD.urunBirimAdedi,birimFiyati = OLD.birimFiyati,urunStogu=OLD.urunStogu;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunlertrigger`
--

CREATE TABLE `urunlertrigger` (
  `urunTriggerID` int(11) NOT NULL,
  `urunID` int(11) NOT NULL,
  `urunAdi` varchar(40) NOT NULL,
  `kategoriID` int(11) NOT NULL,
  `urunBirimAdedi` varchar(20) NOT NULL,
  `birimFiyati` smallint(6) NOT NULL,
  `urunStogu` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kargolar`
--
ALTER TABLE `kargolar`
  ADD PRIMARY KEY (`kargoID`);

--
-- Tablo için indeksler `kargolartrigger`
--
ALTER TABLE `kargolartrigger`
  ADD PRIMARY KEY (`kargoTriggerID`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Tablo için indeksler `kategoritrigger`
--
ALTER TABLE `kategoritrigger`
  ADD PRIMARY KEY (`kategoriTriggerID`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`musteriID`);

--
-- Tablo için indeksler `musterilertrigger`
--
ALTER TABLE `musterilertrigger`
  ADD PRIMARY KEY (`musteriTriggerID`);

--
-- Tablo için indeksler `musterisiparis`
--
ALTER TABLE `musterisiparis`
  ADD PRIMARY KEY (`siparisID`),
  ADD KEY `urunID` (`urunID`);

--
-- Tablo için indeksler `musterisiparistrigger`
--
ALTER TABLE `musterisiparistrigger`
  ADD PRIMARY KEY (`siparisTriggerID`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`siparisID`),
  ADD KEY `musteriID` (`musteriID`),
  ADD KEY `kargoID` (`kargoID`);

--
-- Tablo için indeksler `siparislertrigger`
--
ALTER TABLE `siparislertrigger`
  ADD PRIMARY KEY (`siparisTriggerID`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urunID`),
  ADD KEY `kategoriID` (`kategoriID`);

--
-- Tablo için indeksler `urunlertrigger`
--
ALTER TABLE `urunlertrigger`
  ADD PRIMARY KEY (`urunTriggerID`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `musterisiparis`
--
ALTER TABLE `musterisiparis`
  ADD CONSTRAINT `musterisiparis_ibfk_1` FOREIGN KEY (`urunID`) REFERENCES `urunler` (`urunID`);

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`kargoID`) REFERENCES `kargolar` (`kargoID`),
  ADD CONSTRAINT `siparisler_ibfk_2` FOREIGN KEY (`musteriID`) REFERENCES `musteriler` (`musteriID`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`kategoriID`) REFERENCES `kategoriler` (`kategoriID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
