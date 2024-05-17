-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: travel_recommend_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('28zdyobxyyhta1ln9gqh86tod1gy4q5l','eyJ1c2VyX2lkIjoxfQ:1ruw8T:D_LPRaj-imljz1ZDoLQ-wd2e0nN7ug_zIvPp2dlf3v8','2024-04-25 15:14:45.765331'),('4wfz5z2gved043su582rkpshhmtdw5t3','eyJ1c2VyX2lkIjoxfQ:1ruwLf:SPHb9n6Lhz1BqJrFaxns9y2-I4YFdhs0qGmOT7MSP9k','2024-04-25 15:28:23.064049'),('7193k5p7phf24zjnjbal5p5km84wyp46','eyJ1c2VyX2lkIjoxLCJfc2Vzc2lvbl9leHBpcnkiOi0xfQ:1rv6mD:-F9NO9WrTSjBA3Wl2xiFbr92C49fg904Y0d0KnVxQHk','2024-04-12 02:36:28.088162'),('agtxgnqlfo4hkz1a4twefyaf63d4hudd','eyJ1c2VyX2lkIjoxLCJfc2Vzc2lvbl9leHBpcnkiOi0xfQ:1rv74h:JlAHM4brLLZ1toJLU2dY_64pKl64AU7rYSHUGDyXxmE','2024-04-12 02:55:34.572455'),('buprzo7pkmo8bnxewcgnzm4y6csjisj9','eyJ1c2VyX2lkIjo3NTYsIl9zZXNzaW9uX2V4cGlyeSI6LTF9:1rv752:XzFyRBpas28LJAD79u22The7QjxdXmv_dHmOv4uAbLQ','2024-04-12 02:55:55.276097'),('qn5kuixro4ejqvkb42uspakvhljes9ty','eyJ1c2VyX2lkIjo3NTd9:1rv758:YMv8ngmDom9czKlfz5GLCXuDo9lO7UkfrQKmJrKlbLU','2024-04-26 02:56:02.315369'),('uw3cbotdk8c8ospo63afqw3xcec1co4a','eyJ1c2VyX2lkIjo3NTYsIl9zZXNzaW9uX2V4cGlyeSI6LTF9:1rv6uN:bSRT4z_rZ_cLfwy91C3H5ZaPMq5CaUzwsnVlHDzhKIk','2024-04-12 02:44:54.267188');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'city','城市'),(2,'mountain','山川'),(3,'beach','沙滩'),(4,'river','湖泊河流'),(5,'island','岛屿'),(6,'remain','遗迹'),(7,'desert','沙漠'),(8,'flower','赏花'),(9,'religion','宗教');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imdb_id` varchar(256) DEFAULT NULL,
  `country` varchar(256) NOT NULL,
  `intro` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26533 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,'city_1','美国 圣路易斯','较小、更易于管理的城市的交通便利性却没有足够的旅行者欣赏。 小城市的特点是：在长周末实际上是“可行的”。机场通常不太拥挤并且更容易导航。街道也是如此。您行程中的酒店、餐厅、博物馆等通常也比那些繁华城市的酒店、餐厅、博物馆等更便宜。'),(2,'city_2','英国 伦敦','伦敦是一座庞大的城市，处于一切事物的中心：艺术、历史、文化——凡是你能想到的。但它与其他主要中心的不同之处在于其独特的社区，每个社区都有自己的氛围。与家人一起在肯辛顿度过一个下午：这里有博物馆、公园和许多其他适合孩子的活动。或者前往前卫的肖尔迪奇 (Shoreditch)，寻找炫酷的商店和街头壁画（非常适合拍照），然后前往苏活区 (Soho)，在那里您可以在酒吧喝一杯，或者去俱乐部聚会直至黎明。食物在这里很重要：是的，这里有炸鱼薯条，但由于伦敦蓬勃发展的孟加拉国社区（您可以从布里克巷的众多餐厅中挑选），还有更高级的咖喱屋，再加上越来越多的由名厨主理的餐厅豪华梅菲尔。总是有新的事情发生，我们在下面有更多建议。'),(3,'city_3','美国 拉斯维加斯','无论您能想到什么，拉斯维加斯都能满足您：米其林星级餐厅、24 小时开放的婚礼教堂、传奇般的风景、老虎机，应有尽有。但当你以为维加斯已被锁定时，你会大吃一惊。考虑一下 Meow Wolf，这是一种既是主题公园又是艺术画廊的沉浸式体验。或者 Cosmopolitan 的溜冰场（沙漠里的冬天！）。然后就是自然风光——穿过拉斯维加斯大道，您会发现州立公园，并在火焰谷和红岩峡谷等景点欣赏数天的美景。正是这些瑰宝让维加斯成为家庭和非派对人士的目的地。'),(4,'city_4','美国 纽约市','最高的摩天大楼、最大的博物馆、最奶酪的披萨。纽约市将一切发挥到极致。很容易理解为什么它是美国访问量最大的地方：无论您是想参观历史地标、观看百老汇表演还是漫步布鲁克林的街道，都没有错误的方法，并且每个地方都有新的发现你走的时间到了。花一天时间逛街，从适合家庭游玩的上西区（遍布游乐场和可爱的餐厅）到坚韧但很酷的下东区，每个地方都有自己的氛围。浏览切尔西的艺术画廊，在苏豪区购物，然后在东村喝一杯。或者，乘坐地铁（或步行穿过布鲁克林大桥）并游览丹波的鹅卵石街道。想要一些自然吗？它也有这个。在中央公园野餐，游览高线公园，或搭乘渡轮从海上欣赏这座城市。这只是一个开始——我们在下面还有更多想法。'),(5,'city_5','中国香港','香港是世界上最具活力的城市之一，而世界第三大海湾维多利亚港仍然是其风景如画的心脏。在这次舒适而时尚的夜间游船之旅中，您将躺在躺椅上欣赏这座城市著名的幻彩咏香江激光表演。当您滑过海港时，您可以享用免费的软饮料，欣赏著名的天际线被舞动的光束照亮。这是观赏香港夜间奇观的独特方式。'),(6,'mountains_1','美國 塞多纳','发光的红色岩石、清澈的蓝天以及您见过的最令人瞠目结舌的日落。那是塞多纳。这里是户外爱好者的天堂，拥有 200 多条自行车、徒步、跑步和攀岩小径。但它也有精神的一面，部分原因是该地区的“漩涡”（据说具有治疗功效的能量热点）。早上沿着断箭步道 (Broken Arrow Trail) 徒步，然后探索上城区的形而上学商店、精品店和画廊（不要错过特拉克帕克 (Tlaquepaque) 的手工艺品商店）。在塞多纳的水疗中心之一（有很多水疗中心）舒缓肌肉酸痛，那里的治疗通常涉及声音浴或水晶。夜生活很少，因此请跳过最后的呼叫，前往橡树溪村 (Village of Oak Creek) 观赏绝佳的星空（该社区是国际暗夜星空广场）。'),(7,'mountains-rivers_1','美国 优胜美地国家公园','优胜美地国家公园位于加利福尼亚州的山区，以其花岗岩悬崖和瀑布而闻名。半圆顶和酋长岩是因摄影师安塞尔·亚当斯 (Ansel Adams) 而闻名的两个地貌。约塞米蒂国家公园是一个全年开放的目的地，由于积雪融化，夏季可以进行高海拔徒步旅行。但夏季也是最拥堵的季节，公园管理员鼓励游客使用免费班车系统以尽量减少交通。提前计划，因为许多标志性的徒步旅行都需要获得许可。'),(8,'mountains-rivers_2','美国 黄石国家公园','黄石公园带来了戏剧性的场面——野牛在这里漫步，瀑布飞流直下，山脉巍然耸立。还有地热资源——温泉、间歇泉和沸腾的泥浆锅。最著名的是老忠实间歇泉，这是一座几十年来一直在喷发的间歇泉。黄石公园的范围也很大。虽然它主要位于怀俄明州，但它延伸到蒙大拿州和爱达荷州，并有五个独立的入口。您需要一辆车才能充分游览公园，但其庞大的规模并不意味着您将独自一人。事实上，每年将有超过三百万访客加入您的行列。为人类和野生动物造成的交通堵塞做好准备。幸运的是，公园周围有很多休息的地方，包括 9 个小屋和 2,100 个露营地。请参阅下文了解更多建议，以充分享受您的旅行。'),(9,'mountains-rivers_3','美国 奥兰多','度假者涌向奥兰多的原因很容易理解：一流的度假胜地、全年阳光明媚、还有丰富多彩的活动。您可以尽情游览主题公园，在哈利波特的魔法世界和魔法王国之间穿梭，或者在温特帕克度过一天，这是一个风景优美的湖边小镇，拥有可爱的商店和一流的农贸市场。观星者可以游览肯尼迪航天中心，大自然爱好者可以在蓝泉州立公园划皮划艇，美食家可以在该市的米其林星级餐厅（有几家）尽情享受。是的，奥兰多拥有适合家庭入住的代表，但这里也有丰富的夜生活场所，从舞蹈俱乐部到地下酒吧，应有尽有。如需了解更多信息，请查看下面的建议。'),(10,'beaches_1','美国 圣地亚哥','海滩（或水上公园）一起度过漫长而慵懒的日子，除了沙滩还有适合儿童的博物馆到令人筋疲力尽的徒步旅行。'),(11,'island_1','印度尼西亚 巴厘岛','巴厘岛在一个小岛上囊括了很多东西——从北部的 Sekumpul 等令人惊叹的瀑布到南部 Nyang Nyang 的白色沙滩。无论您在寻找什么，您都可能会找到：巴图博隆的冲浪胜地、水明漾的通宵俱乐部、努沙杜瓦的豪华悬崖酒店以及周围的精神避难所。在天堂之门拍照留念，穿过丛林前往隐秘的卡威古农寺，在乌鲁瓦图寺欣赏日落并欣赏传统的火舞。不要错过市场——在 Sukawati 艺术市场寻找手工艺术品和纺织品，或者在 Sindhu 夜市品尝沙爹和 bakso 等街头小吃。'),(12,'island_2','阿鲁巴岛','如果说一座岛屿完全是为了放松而建造的，那么阿鲁巴岛就是一座适合读书的岛屿。这里以柔软的沙滩、碧绿的海水和热带氛围欢迎游客的到来，这是典型的加勒比海体验（也是库拉索岛和博内尔岛的近邻）。当您不在阿鲁巴岛 40 个海滩之一闲逛时，可以去看看充满活力的荷兰加勒比文化。在该岛首府奥拉涅斯塔德的柔和建筑和商店中漫步。参观阿鲁巴国家考古博物馆或储备令人难以置信的当地美食，如海鲜或 keshi Yana（一种奶酪覆盖的砂锅菜）。对于非海滩品种的自然景观，不要错过蝴蝶农场（无需解释）以及阿鲁巴天然桥和孔奇天然泳池，它们都位于阿里科克国家公园。'),(13,'desert_1','澳大利亚 尤拉拉','尤拉拉 乌鲁鲁-卡塔丘塔国家公园距离最近的大城市有数百英里，因此这个人口不足 1,000 人的小镇对于乘坐巴士或飞机抵达的游客来说是一个受欢迎的景点。当您在城镇广场上漫步时，帆形的檐篷可以保护您免受正午阳光的伤害。白天，这个社区很安静，当游客参观完附近的红砂岩圆顶一天回来后，社区就变得活跃起来。预订乌鲁鲁日出或日落之旅，报名参加夜间观星之旅，或在国家公园游客中心了解方位。'),(14,'flower_1','日本 大阪','大坂是日本的三大都市之一，不仅拥有许多历史建筑，充满绿地的观光景点也相当多。每逢樱花季节到来，整个城市从城堡、寺院，到池塘、公园，到处都变身为充满疗癒的樱花景点。'),(15,'mountains_2','中国 北京 慕田峪长城','慕田峪长城是公元1368年，由朱元璋主将徐达在北齐长城遗址中修建的。该段长城东连古北口，西连居庸关，自古以来就是防御都城的军事要冲。有正观台、大角楼、鹰飞道阳、剑口、北京街等数座著名的敌楼，具有深厚的历史文化价值。长城群山环抱，绿化率达到98%，风景秀丽。慕田峪风景秀丽，是明长城的精华之一。'),(16,'remains_1','中国 北京 紫禁城','中国北京紫禁城，这座巨大的宫殿建筑群由 9,000 多个房间组成，占地超过 250 英亩，建于 15 世纪，后来在 18 世纪清朝期间进行了大规模翻修和修复。'),(17,'remains_2','埃及 金字塔','也许是世界七大奇迹中最知名的，这些雄伟金字塔的确切起源仍然引发争论。'),(18,'remains_3','埃及 狮身人面像','这座神秘的雕塑长 240 英尺，高 66 英尺，由坚固的石灰石块雕刻而成，堪称奇迹。'),(19,'rivers_1','非洲东部北部 尼罗河','世界上最长的河流全长 4,187 英里，发源于非洲中东部的维多利亚湖，流经乌干达、苏丹、埃塞俄比亚，向北流入埃及，最终注入地中海。'),(20,'remains_4','埃及 开罗','开罗曾经被称为巴比伦的罗马据点，是科普特基督教社区的古老中心，拥有五座原始教堂、埃及第一座清真寺和最古老的犹太教堂，都代表了世界三大宗教。'),(21,'remains_5','泰国 曼谷 卧佛','曼谷最古老、最大的寺庙之一，拥有著名的卧佛，它是泰国最大的卧佛，长度超过 150 英尺。'),(22,'remains_6','日本 伏见稻荷大社','这座神社是日本各地为纪念神道稻米神稻荷而建的众多神社之一。'),(23,'city_6','吉隆坡 国油双子塔','如果没有参观世界上最高的双子塔，那么吉隆坡之旅就不完整。摩天大楼非常令人惊叹，尤其是在夜间照明时。'),(24,'remains_7','泰国 泰国格斗集团','Kombat Group泰国是由现任WBA亚洲拳击冠军、ABF拳击冠军、六届泰拳世界冠军克里斯蒂安·达吉奥（Christian Daghio）创办的全包式训练和健身营。我们提供泰拳、西方拳击、马伽术、综合格斗和巴西柔术的培训。'),(25,'island_3','泰国 曼谷 芭堤雅','芭堤雅(Pattaya)也译为“帕塔亚”，是泰国著名的海滨旅游胜地，距首都曼谷仅150公里左右，驱车两小时以内即可到达，距曼谷国际机场更近，因而成为曼谷人和国际游客最常到的游乐城。');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;

--
-- Table structure for table `travel_genre`
--

DROP TABLE IF EXISTS `travel_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `travel_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_genre`
--

/*!40000 ALTER TABLE `travel_genre` DISABLE KEYS */;
INSERT INTO `travel_genre` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,2),(7,15,2),(8,15,6),(9,7,2),(10,7,4),(11,8,2),(12,8,4),(13,9,2),(14,9,4),(15,10,3),(16,11,5),(17,12,5),(18,13,7),(19,14,8),(20,16,6),(21,17,6),(22,18,6),(23,19,4),(24,20,6),(25,20,9),(26,21,6),(27,21,9),(28,22,6),(29,22,9),(30,23,1),(31,24,6),(32,25,5);
/*!40000 ALTER TABLE `travel_genre` ENABLE KEYS */;

--
-- Table structure for table `travel_hot`
--

DROP TABLE IF EXISTS `travel_hot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_hot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating_number` int NOT NULL,
  `travel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Travel_hot_travel_id_679e3e53_fk_Travel_id` (`travel_id`),
  CONSTRAINT `Travel_hot_travel_id_679e3e53_fk_Travel_id` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_hot`
--

/*!40000 ALTER TABLE `travel_hot` DISABLE KEYS */;
INSERT INTO `travel_hot` VALUES (1,5,4),(2,5,6),(3,5,15),(4,5,5),(5,5,21),(6,4,1),(7,4,24),(8,4,20),(9,3,2),(10,3,13),(11,3,18),(12,3,11),(13,2,3);
/*!40000 ALTER TABLE `travel_hot` ENABLE KEYS */;

--
-- Table structure for table `travel_rating`
--

DROP TABLE IF EXISTS `travel_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `comment` longtext NOT NULL,
  `travel_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Travel_rating_travel_id_a6859c17_fk_Travel_id` (`travel_id`),
  KEY `Travel_rating_user_id_1b361a26_fk_User_id` (`user_id`),
  CONSTRAINT `Travel_rating_travel_id_a6859c17_fk_Travel_id` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`),
  CONSTRAINT `Travel_rating_user_id_1b361a26_fk_User_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322015 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_rating`
--

/*!40000 ALTER TABLE `travel_rating` DISABLE KEYS */;
INSERT INTO `travel_rating` VALUES (322001,4.5,'很好完的地方，沙滩',1,1),(322002,3.5,'good places',1,756),(322003,3,'很大的城市！',2,756),(322004,2,'还可以',3,757),(322005,5,'太好了',4,757),(322006,2.5,'还行吧！',11,756),(322007,3,'good',13,756),(322008,5,'太棒了！',15,756),(322009,4,'很好啊',24,757),(322010,4.5,'还不错啊',5,1),(322011,5,'good',6,1),(322012,3,'good111',18,756),(322013,3.5,'haha',20,756),(322014,4.5,'yes',21,757);
/*!40000 ALTER TABLE `travel_rating` ENABLE KEYS */;

--
-- Table structure for table `travel_travel_similarity`
--

DROP TABLE IF EXISTS `travel_travel_similarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_travel_similarity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `similarity` double NOT NULL,
  `travel_source_id` int NOT NULL,
  `travel_target_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_travel_similarity_travel_source_id_425abe2d_fk_Travel_id` (`travel_source_id`),
  KEY `travel_travel_similarity_travel_target_id_7e48b00a_fk_Travel_id` (`travel_target_id`),
  CONSTRAINT `travel_travel_similarity_travel_source_id_425abe2d_fk_Travel_id` FOREIGN KEY (`travel_source_id`) REFERENCES `travel` (`id`),
  CONSTRAINT `travel_travel_similarity_travel_target_id_7e48b00a_fk_Travel_id` FOREIGN KEY (`travel_target_id`) REFERENCES `travel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97554 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_travel_similarity`
--

/*!40000 ALTER TABLE `travel_travel_similarity` DISABLE KEYS */;
INSERT INTO `travel_travel_similarity` VALUES (97304,10,1,23),(97305,10,1,5),(97306,10,1,2),(97307,10,1,4),(97308,10,1,3),(97309,8.585786437626904,1,12),(97310,8.585786437626904,1,24),(97311,8.585786437626904,1,18),(97312,8.585786437626904,1,16),(97313,8.585786437626904,1,17),(97314,10,2,23),(97315,10,2,5),(97316,10,2,4),(97317,10,2,1),(97318,10,2,3),(97319,8.585786437626904,2,12),(97320,8.585786437626904,2,24),(97321,8.585786437626904,2,18),(97322,8.585786437626904,2,16),(97323,8.585786437626904,2,17),(97324,10,3,23),(97325,10,3,5),(97326,10,3,2),(97327,10,3,4),(97328,10,3,1),(97329,8.585786437626904,3,12),(97330,8.585786437626904,3,24),(97331,8.585786437626904,3,18),(97332,8.585786437626904,3,16),(97333,8.585786437626904,3,17),(97334,10,4,23),(97335,10,4,5),(97336,10,4,2),(97337,10,4,1),(97338,10,4,3),(97339,8.585786437626904,4,12),(97340,8.585786437626904,4,24),(97341,8.585786437626904,4,18),(97342,8.585786437626904,4,16),(97343,8.585786437626904,4,17),(97344,10,5,23),(97345,10,5,2),(97346,10,5,4),(97347,10,5,1),(97348,10,5,3),(97349,8.585786437626904,5,12),(97350,8.585786437626904,5,24),(97351,8.585786437626904,5,18),(97352,8.585786437626904,5,16),(97353,8.585786437626904,5,17),(97354,10,7,9),(97355,10,7,8),(97356,9,7,19),(97357,8.267949192431123,7,4),(97358,8.267949192431123,7,2),(97359,8.267949192431123,7,23),(97360,8.267949192431123,7,3),(97361,8.267949192431123,7,1),(97362,10,8,9),(97363,10,8,7),(97364,9,8,19),(97365,8.267949192431123,8,4),(97366,8.267949192431123,8,2),(97367,8.267949192431123,8,23),(97368,8.267949192431123,8,3),(97369,8.267949192431123,8,1),(97370,10,9,7),(97371,10,9,8),(97372,9,9,19),(97373,8.267949192431123,9,4),(97374,8.267949192431123,9,2),(97375,8.267949192431123,9,23),(97376,8.267949192431123,9,3),(97377,8.267949192431123,9,1),(97378,8.585786437626904,10,12),(97379,8.585786437626904,10,16),(97380,8.585786437626904,10,19),(97381,8.585786437626904,10,18),(97382,8.585786437626904,10,17),(97383,8.585786437626904,10,24),(97384,8.585786437626904,10,14),(97385,8.585786437626904,10,11),(97386,8.585786437626904,10,13),(97387,8.585786437626904,10,25),(97388,10,11,12),(97389,10,11,25),(97390,8.585786437626904,11,24),(97391,8.585786437626904,11,18),(97392,8.585786437626904,11,17),(97393,8.585786437626904,11,10),(97394,8.585786437626904,11,14),(97395,8.585786437626904,11,19),(97396,8.585786437626904,11,13),(97397,8.585786437626904,11,16),(97398,10,12,11),(97399,10,12,25),(97400,8.585786437626904,12,24),(97401,8.585786437626904,12,18),(97402,8.585786437626904,12,17),(97403,8.585786437626904,12,10),(97404,8.585786437626904,12,14),(97405,8.585786437626904,12,19),(97406,8.585786437626904,12,13),(97407,8.585786437626904,12,16),(97408,8.585786437626904,13,12),(97409,8.585786437626904,13,16),(97410,8.585786437626904,13,10),(97411,8.585786437626904,13,18),(97412,8.585786437626904,13,17),(97413,8.585786437626904,13,24),(97414,8.585786437626904,13,14),(97415,8.585786437626904,13,19),(97416,8.585786437626904,13,11),(97417,8.585786437626904,13,25),(97418,8.585786437626904,14,12),(97419,8.585786437626904,14,16),(97420,8.585786437626904,14,10),(97421,8.585786437626904,14,18),(97422,8.585786437626904,14,17),(97423,8.585786437626904,14,24),(97424,8.585786437626904,14,11),(97425,8.585786437626904,14,19),(97426,8.585786437626904,14,13),(97427,8.585786437626904,14,25),(97428,10,16,17),(97429,10,16,18),(97430,10,16,24),(97431,9,16,22),(97432,9,16,21),(97433,9,16,20),(97434,8.585786437626904,16,19),(97435,8.585786437626904,16,14),(97436,8.585786437626904,16,10),(97437,10,17,18),(97438,10,17,24),(97439,10,17,16),(97440,9,17,22),(97441,9,17,21),(97442,9,17,20),(97443,8.585786437626904,17,19),(97444,8.585786437626904,17,14),(97445,8.585786437626904,17,10),(97446,10,18,17),(97447,10,18,24),(97448,10,18,16),(97449,9,18,22),(97450,9,18,21),(97451,9,18,20),(97452,8.585786437626904,18,19),(97453,8.585786437626904,18,14),(97454,8.585786437626904,18,10),(97455,9,19,8),(97456,9,19,9),(97457,9,19,7),(97458,8.585786437626904,19,18),(97459,8.585786437626904,19,17),(97460,8.585786437626904,19,12),(97461,8.585786437626904,19,10),(97462,8.585786437626904,19,14),(97463,8.585786437626904,19,16),(97464,8.585786437626904,19,24),(97465,10,20,22),(97466,10,20,21),(97467,9,20,18),(97468,9,20,24),(97469,9,20,17),(97470,9,20,16),(97471,8.267949192431123,20,19),(97472,8.267949192431123,20,14),(97473,8.267949192431123,20,10),(97474,10,21,22),(97475,10,21,20),(97476,9,21,18),(97477,9,21,24),(97478,9,21,17),(97479,9,21,16),(97480,8.267949192431123,21,19),(97481,8.267949192431123,21,14),(97482,8.267949192431123,21,10),(97483,10,22,20),(97484,10,22,21),(97485,9,22,18),(97486,9,22,24),(97487,9,22,17),(97488,9,22,16),(97489,8.267949192431123,22,19),(97490,8.267949192431123,22,14),(97491,8.267949192431123,22,10),(97492,10,23,5),(97493,10,23,2),(97494,10,23,4),(97495,10,23,1),(97496,10,23,3),(97497,8.585786437626904,23,12),(97498,8.585786437626904,23,24),(97499,8.585786437626904,23,18),(97500,8.585786437626904,23,16),(97501,8.585786437626904,23,17),(97502,10,24,17),(97503,10,24,18),(97504,10,24,16),(97505,9,24,22),(97506,9,24,21),(97507,9,24,20),(97508,8.585786437626904,24,19),(97509,8.585786437626904,24,14),(97510,8.585786437626904,24,10),(97511,10,25,12),(97512,10,25,11),(97513,8.585786437626904,25,24),(97514,8.585786437626904,25,18),(97515,8.585786437626904,25,17),(97516,8.585786437626904,25,10),(97517,8.585786437626904,25,14),(97518,8.585786437626904,25,19),(97519,8.585786437626904,25,13),(97520,8.585786437626904,25,16),(97521,9,6,8),(97522,9,6,9),(97523,9,6,7),(97524,9,6,15),(97525,8.585786437626904,6,4),(97526,8.585786437626904,6,2),(97527,8.585786437626904,6,23),(97528,8.585786437626904,6,3),(97529,8.585786437626904,6,1),(97530,8.585786437626904,6,5),(97531,9,15,6),(97532,9,15,18),(97533,9,15,16),(97534,9,15,17),(97535,9,15,24),(97536,8.585786437626904,15,8),(97537,8.585786437626904,15,20),(97538,8.585786437626904,15,9),(97539,8.585786437626904,15,22),(97540,8.585786437626904,15,7),(97541,9,7,6),(97542,8.585786437626904,7,15),(97543,9,8,6),(97544,8.585786437626904,8,15),(97545,9,9,6),(97546,8.585786437626904,9,15),(97547,9,16,15),(97548,9,17,15),(97549,9,18,15),(97550,8.585786437626904,20,15),(97551,8.585786437626904,21,15),(97552,8.585786437626904,22,15),(97553,9,24,15);
/*!40000 ALTER TABLE `travel_travel_similarity` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=758 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','123','test@email.com'),(756,'user1','123','user1@email.com'),(757,'user2','123','user2@email.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Dumping routines for database 'travel_recommend_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-14  9:45:31
