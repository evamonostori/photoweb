-- --------------------------------------------------------
-- Hoszt:                        localhost
-- Szerver verzió:               8.0.36 - MySQL Community Server - GPL
-- Szerver OS:                   Win64
-- HeidiSQL Verzió:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Adatbázis struktúra mentése a photoweb.
CREATE DATABASE IF NOT EXISTS `photoweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `photoweb`;

-- Struktúra mentése tábla photoweb. blogpost
CREATE TABLE IF NOT EXISTS `blogpost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `short_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `upload_date` date DEFAULT (curdate()),
  `author_id` int DEFAULT NULL,
  `topic_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `fk_blogpost_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_blogpost_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tábla adatainak mentése photoweb.blogpost: ~7 rows (hozzávetőleg)
INSERT INTO `blogpost` (`id`, `title`, `short_content`, `content`, `upload_date`, `author_id`, `topic_id`) VALUES
	(1, 'Hajnali madárfotózás', 'A hortobágyi halastavak Közép-Európa egyik legnagyobb halastórendszere, s egyben legismertebb madár élőhelye, hiszen közel 300 megfigyelt madárfajnak ad otthont. A kirándulók számára kialakított tanösvény a Hortobágyi halastavak vasúti megállótól indul, 14 állomásból áll, melyek közül 11 megfigyelőtorony.', 'A hortobágyi halastavak Közép-Európa egyik legnagyobb halastórendszere, s egyben legismertebb madár élőhelye, hiszen közel 300 megfigyelt madárfajnak ad otthont. A kirándulók számára kialakított tanösvény a Hortobágyi halastavak vasúti megállótól indul, 14 állomásból áll, melyek közül 11 megfigyelőtorony.\r\nA Hortobágyi Fotókör fotóstúrát szervez a Hortobágy-halastavi tanösvényen. A gyalogtúra alatt az érdeklődők megismerkedhetnek a terület adottságaival, a nyílt vizű mocsarak növény- és madárvilágával. Útközben a madarak mellett láthatunk itt házi bivalyokat is, amelyek egy 60 hektáros, vízzel elárasztott területen élvezik a dagonyát. A Kondás-tónál található a legmagasabb megfigyelőtorony, ahonnan akár rétisasokat is láthatunk. A torony mellett pedig 500 méter hosszú pallósoros ösvényt alakítottak ki a tópart menti nádasban, ahonnan a közeli sirálysziget életébe nyerhetünk bepillantást.\r\nA túra kb. 10 km hosszú. Időjárásnak megfelelő réteges és kényelmes ruházat ajánlott.\r\nA program időjárásfüggő és előzetes bejelentkezéshez kötött! \r\nIndulás időpontja: 2023. április 15. 7 óra\r\nIndulás helyszíne: Hortobágy-Halastó, Halászbárka Fogadóközpont\r\nKapcsolat: janos.gy@email.com', '2023-06-08', 1, 2),
	(2, 'Blende - záridő - ISO érzékenység', 'Fotózáskor az alapvető beállítások közé tartoznak a blende, a záridő és az ISO érzékenység. Ezek a beállítások közösen határozzák meg a kép expozícióját, vagyis azt, hogy milyen világos vagy sötét lesz a végső fotó. Ismerjük meg ezeket a fogalmakat részletesebben.', 'Fotózáskor az alapvető beállítások közé tartoznak a blende, a záridő és az ISO érzékenység. Ezek a beállítások közösen határozzák meg a kép expozícióját, vagyis azt, hogy milyen világos vagy sötét lesz a végső fotó. Ismerjük meg ezeket a fogalmakat részletesebben.\r\nA blende az objektívbe épített mechanizmus, egy olyan fém lamellákból álló szerkezet, amely változtatható méretű nyílással szabályozza az érzékelőre eső fény mennyiségét. A blendeérték (f szám) minél kisebb, annál nagyobb ez a nyílás, s így annál több fény jut be a kamera belsejébe. Például az f/2.8-as blende nagyobb nyílással rendelkezik, mint az f/8-as blende. A rekesz állításával hatással lehetünk a mélységélességre is. Kis f szám (nagy rekesz nyílás) esetén kicsi a mélységélesség, míg nagy f szám (azaz kis rekesz nyílás esetén) nagyobb lesz a mélységélesség. Ezzel szabályozni tudjuk, hogy a fókuszban levő téma háttere mennyire legyen elmosott.\r\nA záridő vagy exponálási idő azt jelenti, hogy mennyi ideig éri fény a kamera szenzorát. Ez az idő lehet rövid (pl. 1/1000 másodperc) vagy hosszabb (pl. 1 másodperc vagy annál is hosszabb). A rövid záridő segítségével gyors mozgásokat és elmosódásmentes képeket készíthetünk, míg a hosszabb záridők lehetővé teszik a hosszabb expozíciókat, például éjszakai fotózás során.\r\nAz ISO érzékenység azt mutatja meg, hogy mennyire érzékeny a kamera szenzora a fényre. Minél magasabb az ISO érték, annál érzékenyebb lesz a szenzor, és annál világosabb képeket lehet készíteni alacsony fényviszonyok között is. Azonban magas ISO értékek használata esetén zaj jelenhet meg a képeken, ami csökkentheti a kép minőségét.\r\nEz a három beállítás együtt határozza meg a kép expozícióját. Ha például szeretnénk egy világos és éles képet készíteni egy napsütéses napon, lehet, hogy alacsony ISO érzékenységet, közepes blendeértéket és gyors záridőt választunk. Más részletek kiemeléséhez, például egy portré esetén, lehet, hogy kisebb blendeértéket választunk a háttér elmosása érdekében, míg a záridőt és az ISO érzékenységet ehhez igazítjuk.\r\nEzért fontos megérteni ezeket a beállításokat és kísérletezni velük különböző helyzetekben, hogy jobban megértsük, hogyan befolyásolják a végső képet. A gyakorlat és a tapasztalat megszerzése segít abban, hogy hatékonyan alkalmazzuk ezeket az alapvető fotózási fogalmakat.', '2023-06-20', 2, 1),
	(3, 'A magyar fotográfia napja', '1840. augusztus 29-én készült Magyarországon először fénykép - ahogyan akkor nevezték dagerrotípia - egy nyilvános eseményen. A fotográfia fejlődéséhez magyar feltalálók is jelentősen hozzájárultak és számos magyar fotós szerzett hírnevet a nagyvilágban. ', '1840. augusztus 29-én készült Magyarországon először fénykép - ahogyan akkor nevezték dagerrotípia - egy nyilvános eseményen. A fotográfia fejlődéséhez magyar feltalálók is jelentősen hozzájárultak és számos magyar fotós szerzett hírnevet a nagyvilágban.\r\nA Bajai Fotográfusok Társasága e jeles napra emlékezve tisztelettel meghívja Önt, családját és barátait 2023. augusztus 29-én (kedden) 17 órakor a Bácskai Kultúrpalotában (Baja, Szentháromság tér 3.) tartandó Töredékek című fotókiállításának megnyitójára.\r\nA kiállítást megnyitja: N. Gábor fotóművész\r\nKiállító alkotók: B. Fanni, G. Tamás, J. Zsombor, L. Éva, L. Kinga, M. Endre, M. Dániel, N. Hajnalka, P. Lilla, R. Katalin, R. Zsolt, T. András, V. Pálma\r\nA kiállítás 2023. szeptember 17-ig látogatható.', '2023-08-21', 1, 2),
	(4, 'MILC fényképezőgépek', 'A MILC a Mirrorless Interchangeable Lens Camera (tükör nélküli cserélhető objektíves fényképezőgép) kifejezés rövidítése. Ezek a fényképezőgépek olyan típusú rendszerek, amelyek nem rendelkeznek tükörrel a fényképezőgép belsejében.', 'A MILC a Mirrorless Interchangeable Lens Camera (tükör nélküli cserélhető objektíves fényképezőgép) kifejezés rövidítése. Ezek a fényképezőgépek olyan típusú rendszerek, amelyek nem rendelkeznek tükörrel a fényképezőgép belsejében.\r\nA MILC gépek átmenetet képeznek a kicsi kompakt fényképezőgépek és a terjedelmesebb méretű DSLR-ek között. A tükör elhagyásával, a DSLR-ek képminőségét és tudását megtartva lényegesen kisebb és könnyebb gépváz jellemzi őket. Az átnézeti keresőt felváltotta a kompaktokból már jól ismert elektronikus kereső, mely lehet érintésérzékeny, kihajtható vagy akár le-fel dönthető is. A kiváló képminőséget garantálja a nagyobb képérzékelő és a szenzorstablizálás alkalmazása.\r\nA MILC kamerák lehetővé teszik a cserélhető objektívek használatát, melyek sokféle fotószerkesztést és kreatív lehetőséget biztosítanak. A kínálatban az ultranagy látószögtől a nagy teléken át a fényerős portréobjektívekig szinte minden megtalálható. De nem csak az obejtívpark, hanem a külső vakuk és egyéb kiegészítők terén is folyamatosan nő a bővítés lehetősége.\r\nModelltől függően a MILC típusú fényképezőgépek kiváló videóképességeket kínálnak Full-HD vagy 4K felbontásban. Ehhez a videózásra optimalizált, gyakran motoros zoomos (power zoom) objektívek is megjelentek, amelyek az élességállítás finomsága mellett stabil zoom használatot biztosítanak.\r\nNéhány ismert MILC fényképezőgép márka és modell közé tartozik például a Sony Alpha sorozat, a Canon EOS M sorozat, a Fujifilm X sorozat, a Nikon Z sorozat és sok más gyártó hasonló termékei. Ezek a kamerák széles választékban érhetők el különböző árkategóriákban és funkciók széles skálájával.', '2023-11-05', 2, 1),
	(5, 'A magyar kultúra napja', '1989 óta minden évben január 22-én ünnepeljük meg a magyar kultúra napját, annak emlékére, hogy  Kölcsey Ferenc 1823-ban ezen a napon fejezte be a Himnusz megírását. Ez alkalommal számos rendezvény keretében mutatják be hazánk kulturális értékeit.', '1989 óta minden évben január 22-én ünnepeljük meg a magyar kultúra napját, annak emlékére, hogy  Kölcsey Ferenc 1823-ban ezen a napon fejezte be a Himnusz megírását. Ez alkalommal számos rendezvény keretében mutatják be hazánk kulturális értékeit.\r\nA Veszprémi Fotókör tisztelettel meghívja Önt és családját 2024. január 22-én (hétfőn) 18 órakor a Dubniczay-palotában (Veszprém, Vár u. 29.) tartandó Feketén-fehéren című fotókiállításának megnyitójára.\r\nA kiállítást megnyitja: W. Julianna művészettörténész\r\nKiállító alkotók: A. Ilona, D. Pál, H. Miklós, J. Beáta, L. Ágota, L. Bence, N. Vanda, P. Vilmos, S. Szilvia, T. Balázs, T. Kiss Mariann, V. András, Z. Edit\r\nA kiállítás 2024. február 11-ig látogatható.', '2024-01-15', 1, 2),
	(6, 'A makrofotózás', 'Makrofotózás során a kis részletek és mintázatok megragadása a cél, legyen az egy virág, rovar vagy más apró tárgy. Összegyűjtöttünk néhány tippet és trükköt, amelyek segíthetnek a makrofotózás során.', 'Makrofotózás során a kis részletek és mintázatok megragadása a cél, legyen az egy virág, rovar vagy más apró tárgy. Összegyűjtöttünk néhány tippet és trükköt, amelyek segíthetnek a makrofotózás során.\r\nA megfelelő felszerelés elengedhetetlen kelléke a makrofotók készítésének. A makroobjektívek vagy a makro közgyűrűk használata lehetővé teszi, hogy közelről fókuszáljunk a kis tárgyakra, és éles képeket készítsünk róla. A makroobjektívek alacsony blendeértéke (pl. f/2.8 vagy f/4) segít abban, hogy elmosódjon a háttér, és a fő tárgy kiemelkedjen.\r\nA makrofotók általában nagyon kis mélységélességűek. Ez néha megzavarhatja az autofókusz rendszert, így a fókusz nem oda kerül, ahol az adott téma megkívánná. A manuális fókusz használata, a fókuszpont kézi kiválasztása viszont lehetővé teszi, hogy a képen a kívánt részletre tudjunk fókuszálni.\r\nA természetes fény a legjobb választás makrofotózás során. Amennyiben vaku használatára van szükség, akkor fontos a diffúzor használata a vakufény lágyítására és a túlzott árnyékok elkerülésére.\r\nA kis tárgyak fotózása során a kamera remegése könnyen elmosódást okozhat, ezért javasolt az állvány vagy más stabilizáló eszköz használata, mellyel biztosítani tudjuk a képélességet.\r\nA technika önmagában nem elég ahhoz, hogy szép makrofotót készítsünk. A fotós látásmódja és kreativitása nélkülözhetetlen a tökéletes kép megalkotásához. Próbáljunk meg különböző szögekből és beállításokkal fotózni, hogy érdekes kompozíciókat hozzunk létre. Ne felejtsük el, hogy a harmónia és az egyensúly kulcsfontosságú a jó kompozícióban. Fedezzük fel a tárgyak textúráját, színét és formáját! Az apró részletek kiemelése igazán izgalmas téma lehet. Fontos szempont azonban, hogy a háttér ne vonja el a figyelmet a fő tárgyról. Próbáljunk meg olyan helyeket találni, ahol egyszerű vagy homogén a háttér, vagy kis mélységélesség használatával kiemelhető a téma.\r\nFontos, hogy legyünk kitartóak! A makrofotózás sok türelmet igényel. Ne csüggedjünk el, ha az első próbálkozások nem sikerülnek tökéletesen. A gyakorlásnak és kitartásnak meglesz az eredménye.\r\nNe felejtsük el, hogy a makrofotózás fantasztikus lehetőséget kínál arra, hogy részletesebben megismerjük a körülöttünk lévő apró világot. Ne féljünk kísérletezni, és élvezzük a fotózás folyamatát!', '2024-03-01', 2, 1),
	(7, 'Tavaszi fotóstúra', 'A Pádis-fennsík az Erdélyi-szigethegység nyugati részén található. Ez Románia egyik legkülönlegesebb karsztvidéke, amely látnivalóban és élményekben gazdag. Találhatunk itt hatalmas barlangokat, mély víznyelőket, dübörgő vízeséseket, sziklafallal körülvett izgalmas szurdokokat és óriási zöldellő mezők.', 'A Pádis-fennsík az Erdélyi-szigethegység nyugati részén található. Ez Románia egyik legkülönlegesebb karsztvidéke, amely látnivalóban és élményekben gazdag. Találhatunk itt hatalmas barlangokat, mély víznyelőket, dübörgő vízeséseket, sziklafallal körülvett izgalmas szurdokokat és óriási zöldellő mezők.\r\nAz Alföldi fotókör tavaszi fotóstúrát szervez a Pádis-fennsíkra. Programunk gyönyörű hegyvidéki tájakon, erdőkön és mezőkön át vezet, ahol a tavasz néhány hétig csodálatos virágszőnyeggel várja a kirándulókat. Utunk során egy-két fotó erejéig megállunk a Köves-Körös partján, majd a fennsíkra érkezve indulunk neki a gyalogtúránknak. A séta során csodálatos képeket készíthetünk a hó fogságából kiszabadult krókuszokról, a zölden hullámzó rétekről.\r\nA túra hossza kb. 10 km. Időjárásnak megfelelő réteges és kényelmes ruházat ajánlott.\r\nA program előzetes bejelentkezéshez kötött!\r\nIndulás időpontja: 2024. április 6. 5 óra\r\nIndulás helyszíne: Szeged, Széchenyi tér\r\nKapcsolat: b.laszlo@email.com', '2024-03-17', 1, 2);

-- Struktúra mentése tábla photoweb. images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upload_date` date NOT NULL DEFAULT (curdate()),
  `view_number` int DEFAULT NULL,
  `like_number` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tábla adatainak mentése photoweb.images: ~25 rows (hozzávetőleg)
INSERT INTO `images` (`id`, `title`, `file_name`, `upload_date`, `view_number`, `like_number`, `user_id`) VALUES
	(1, 'Sirály', '1_1.jpg', '2023-06-01', 122, 109, 1),
	(2, 'Pipacsok', '1_2.jpg', '2023-06-11', 110, 76, 1),
	(3, 'Levendulás', '1_3.jpg', '2023-07-25', 106, 92, 1),
	(4, 'Harmatos hajnal', '1_4.jpg', '2024-03-01', 78, 22, 1),
	(5, 'Krókuszok', '1_5.jpg', '2024-05-01', 67, 59, 1),
	(6, 'Dunakanyar', '2_1.jpg', '2023-04-12', 159, 84, 2),
	(7, 'Hegyek között', '2_2.jpg', '2023-07-10', 111, 82, 2),
	(8, 'Gímszarvas', '2_3.jpg', '2023-07-19', 99, 85, 2),
	(9, 'Hópihe', '2_4.jpg', '2024-01-25', 81, 65, 2),
	(10, 'Feketerigó', '2_5.jpg', '2024-02-25', 79, 59, 2),
	(11, 'Indulásra kész', '3_1.jpg', '2023-06-17', 130, 98, 3),
	(12, 'Sebes patak', '3_2.jpg', '2023-07-20', 115, 99, 3),
	(13, 'Szélmalmok', '3_3.jpg', '2023-08-03', 87, 63, 3),
	(14, 'Elhagyatva', '3_4.jpg', '2023-10-29', 81, 70, 3),
	(15, 'Tavaszi zsongás', '3_5.jpg', '2024-04-02', 72, 59, 3),
	(16, 'Esti fények', '4_1.jpg', '2023-03-29', 137, 101, 4),
	(17, 'Bory-vár', '4_2.jpg', '2023-05-04', 128, 89, 4),
	(18, 'Dzsámi', '4_3.jpg', '2023-06-01', 125, 99, 4),
	(19, 'Bled', '4_4.jpg', '2023-07-05', 112, 100, 4),
	(20, 'Tükröződés', '4_5.jpg', '2023-09-17', 85, 72, 4),
	(21, 'Kikötői részlet', '5_1.jpg', '2023-04-22', 132, 108, 5),
	(22, 'Kőkorlát', '5_2.jpg', '2023-05-04', 129, 89, 5),
	(23, 'Múltidéző', '5_3.jpg', '2023-08-15', 85, 68, 5),
	(24, 'Busójárás', '5_4.jpg', '2024-03-10', 74, 69, 5),
	(27, 'Dömötör-torony', '5_5.jpg', '2024-05-01', 62, 52, 5);

-- Struktúra mentése tábla photoweb. menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tábla adatainak mentése photoweb.menu: ~3 rows (hozzávetőleg)
INSERT INTO `menu` (`id`, `name`) VALUES
	(1, 'főoldal'),
	(2, 'tagok'),
	(3, 'blog');

-- Struktúra mentése tábla photoweb. topic
CREATE TABLE IF NOT EXISTS `topic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tábla adatainak mentése photoweb.topic: ~3 rows (hozzávetőleg)
INSERT INTO `topic` (`id`, `topic_name`) VALUES
	(1, 'Fotózás'),
	(2, 'Események'),
	(3, 'Szerkesztés');

-- Struktúra mentése tábla photoweb. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_level` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'user',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tábla adatainak mentése photoweb.users: ~5 rows (hozzávetőleg)
INSERT INTO `users` (`id`, `user_name`, `user_level`, `intro`, `email`, `password`) VALUES
	(1, 'A. Anna', 'admin', 'Gyerekkorom óta érdekel a fotózás világa. Első felvételeimet egy SMENA típusú analóg géppel készítettem A technika fejlődését követve váltottam én is digitális fényképezőgépre váltottam. Jelenleg egy Nikon DSRL fényképezőgéppel járom a világot, és elsősorban a természet szépségét szeretem megörökíteni. Különösen érdekesnek találom a makrofotók készítését, ahol lencsevégre kaphatom a körülöttünk lévő világ apró csodáit, akár egy színes pillangó vagy egy csillogó harmatcsepp formájában. 2010 óta a Hegyvidék Fotóklub tagja vagyok, több klubkiállításon szerepeltem a képeimmel.', 'anna@email.com', '$2y$10$MdmEwUdFecs0.qIYuFXu9epD328iJoHdBwiVK5wZWmGCQIjqs.ek2'),
	(2, 'B. Barnabás', 'admin', 'A digitális fényképezőgépek világa nyitotta meg számomra az utat a fotózás irányába. Kezdetben a családi eseményeket és nyaralások emlékeit örökítettem meg a kamerámmal. Később igyekeztem a fotózási ismereteimet elmélyíteni. látókörömet bővíteni. Mivel utazni és túrázni a mai napig nagyon szeretek, így elsősorban a körülöttem lévő természeti környezet ragadja meg a figyelmemet. 2015 óta vagyok a Dunántúli Fotókör tagja, több kiállításon jelentem meg alkotásaimmal.', 'bbarna@email.com', '$2y$10$eIv31DgkxuM5gSTaC5kKa.cAQR06n.RXtDmpmiR7xJm0jrq16igf6'),
	(3, 'M. Máté', 'user', 'Néhány éve kóstoltam bele a fotózás világába. Folyamatosan fejlesztem technikai tudásomat, rendszeresen részt veszek fotós workshop-okon. A fotózás több területén kipróbáltam magam, de a természet- és makrófotózás áll hozzám a legközelebb. Képeimben igyekszem visszaadni a látott téma szépségét, a pillanat hangulatát.', 'mate.m@email.com', '$2y$10$KEFIVb/YrSoDK0fR.3yRQ.AOpbhqWiBl8B5wEH6z/6kfxedvRPPUm'),
	(4, 'S. Sára', 'user', 'Szeretek utazni és fényképezni. Az általam készített fotókkal az épített környezetet, annak sokféleségét szeretném bemutatni. Igyekszem nem a szokványos beállításokat vagy nézőpontokat alkalmazni, keresem az egyedi szemszöget, a kreatív megoldásokat.', 'sara@email.com', '$2y$10$2y9C6ucjg.MwmA5Ja6BZCuwFZDhMmts9Tw6FjrEW/v2X4EDwztpdW'),
	(5, 'T. Tamás', 'user', 'Egyetemista koromban ismerkedtem meg a fotózás művészetével, és több éven át az intézmény fotókörének tagja voltam, ahol analóg fényképezőgépekkel készítettük el képeinket és magunk hívtuk elő a fotólaborban. Bár azóta digitális technikára váltottam, de még most is hatással van rám az akkori képek hangulata. A színes felvételek mellett, gyakran készítek monochrom képeket, melyek illenek a választott téma látványához vagy hangulatához. 2006 óta vagyok a Viharsarki Fotóklub tagja. Alkotásaimmal már több kiállításon és fotópályázaton sikeresen szerepeltem.', 't.tamas@email.com', '$2y$10$qdLyelFdiYvymhQoDJvx/.0o7wChbGSbpDDkaJMgV2xg1yjlv7xjS');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
