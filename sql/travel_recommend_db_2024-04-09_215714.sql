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
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
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
INSERT INTO `travel` VALUES (1,'city_1','美国 圣路易斯','较小、更易于管理的城市的交通便利性却没有足够的旅行者欣赏。 小城市的特点是：在长周末实际上是“可行的”。机场通常不太拥挤并且更容易导航。街道也是如此。您行程中的酒店、餐厅、博物馆等通常也比那些繁华城市的酒店、餐厅、博物馆等更便宜。'),(2,'city_2','英国 伦敦','伦敦是一座庞大的城市，处于一切事物的中心：艺术、历史、文化——凡是你能想到的。但它与其他主要中心的不同之处在于其独特的社区，每个社区都有自己的氛围。与家人一起在肯辛顿度过一个下午：这里有博物馆、公园和许多其他适合孩子的活动。或者前往前卫的肖尔迪奇 (Shoreditch)，寻找炫酷的商店和街头壁画（非常适合拍照），然后前往苏活区 (Soho)，在那里您可以在酒吧喝一杯，或者去俱乐部聚会直至黎明。食物在这里很重要：是的，这里有炸鱼薯条，但由于伦敦蓬勃发展的孟加拉国社区（您可以从布里克巷的众多餐厅中挑选），还有更高级的咖喱屋，再加上越来越多的由名厨主理的餐厅豪华梅菲尔。总是有新的事情发生，我们在下面有更多建议。'),(3,'city_3','美国 拉斯维加斯','无论您能想到什么，拉斯维加斯都能满足您：米其林星级餐厅、24 小时开放的婚礼教堂、传奇般的风景、老虎机，应有尽有。但当你以为维加斯已被锁定时，你会大吃一惊。考虑一下 Meow Wolf，这是一种既是主题公园又是艺术画廊的沉浸式体验。或者 Cosmopolitan 的溜冰场（沙漠里的冬天！）。然后就是自然风光——穿过拉斯维加斯大道，您会发现州立公园，并在火焰谷和红岩峡谷等景点欣赏数天的美景。正是这些瑰宝让维加斯成为家庭和非派对人士的目的地。'),(4,'city_4','美国 纽约市','最高的摩天大楼、最大的博物馆、最奶酪的披萨。纽约市将一切发挥到极致。很容易理解为什么它是美国访问量最大的地方：无论您是想参观历史地标、观看百老汇表演还是漫步布鲁克林的街道，都没有错误的方法，并且每个地方都有新的发现你走的时间到了。花一天时间逛街，从适合家庭游玩的上西区（遍布游乐场和可爱的餐厅）到坚韧但很酷的下东区，每个地方都有自己的氛围。浏览切尔西的艺术画廊，在苏豪区购物，然后在东村喝一杯。或者，乘坐地铁（或步行穿过布鲁克林大桥）并游览丹波的鹅卵石街道。想要一些自然吗？它也有这个。在中央公园野餐，游览高线公园，或搭乘渡轮从海上欣赏这座城市。这只是一个开始——我们在下面还有更多想法。'),(5,'city_5','中国香港','香港是世界上最具活力的城市之一，而世界第三大海湾维多利亚港仍然是其风景如画的心脏。在这次舒适而时尚的夜间游船之旅中，您将躺在躺椅上欣赏这座城市著名的幻彩咏香江激光表演。当您滑过海港时，您可以享用免费的软饮料，欣赏著名的天际线被舞动的光束照亮。这是观赏香港夜间奇观的独特方式。'),(6,'mountains-1','美國 塞多纳','发光的红色岩石、清澈的蓝天以及您见过的最令人瞠目结舌的日落。那是塞多纳。这里是户外爱好者的天堂，拥有 200 多条自行车、徒步、跑步和攀岩小径。但它也有精神的一面，部分原因是该地区的“漩涡”（据说具有治疗功效的能量热点）。早上沿着断箭步道 (Broken Arrow Trail) 徒步，然后探索上城区的形而上学商店、精品店和画廊（不要错过特拉克帕克 (Tlaquepaque) 的手工艺品商店）。在塞多纳的水疗中心之一（有很多水疗中心）舒缓肌肉酸痛，那里的治疗通常涉及声音浴或水晶。夜生活很少，因此请跳过最后的呼叫，前往橡树溪村 (Village of Oak Creek) 观赏绝佳的星空（该社区是国际暗夜星空广场）。'),(7,'mountains-rivers_1','美国 优胜美地国家公园','优胜美地国家公园位于加利福尼亚州的山区，以其花岗岩悬崖和瀑布而闻名。半圆顶和酋长岩是因摄影师安塞尔·亚当斯 (Ansel Adams) 而闻名的两个地貌。约塞米蒂国家公园是一个全年开放的目的地，由于积雪融化，夏季可以进行高海拔徒步旅行。但夏季也是最拥堵的季节，公园管理员鼓励游客使用免费班车系统以尽量减少交通。提前计划，因为许多标志性的徒步旅行都需要获得许可。'),(8,'mountains-rivers_2','美国 黄石国家公园','黄石公园带来了戏剧性的场面——野牛在这里漫步，瀑布飞流直下，山脉巍然耸立。还有地热资源——温泉、间歇泉和沸腾的泥浆锅。最著名的是老忠实间歇泉，这是一座几十年来一直在喷发的间歇泉。黄石公园的范围也很大。虽然它主要位于怀俄明州，但它延伸到蒙大拿州和爱达荷州，并有五个独立的入口。您需要一辆车才能充分游览公园，但其庞大的规模并不意味着您将独自一人。事实上，每年将有超过三百万访客加入您的行列。为人类和野生动物造成的交通堵塞做好准备。幸运的是，公园周围有很多休息的地方，包括 9 个小屋和 2,100 个露营地。请参阅下文了解更多建议，以充分享受您的旅行。'),(9,'mountains-rivers_3','美国 奥兰多','度假者涌向奥兰多的原因很容易理解：一流的度假胜地、全年阳光明媚、还有丰富多彩的活动。您可以尽情游览主题公园，在哈利波特的魔法世界和魔法王国之间穿梭，或者在温特帕克度过一天，这是一个风景优美的湖边小镇，拥有可爱的商店和一流的农贸市场。观星者可以游览肯尼迪航天中心，大自然爱好者可以在蓝泉州立公园划皮划艇，美食家可以在该市的米其林星级餐厅（有几家）尽情享受。是的，奥兰多拥有适合家庭入住的代表，但这里也有丰富的夜生活场所，从舞蹈俱乐部到地下酒吧，应有尽有。如需了解更多信息，请查看下面的建议。'),(10,'beaches_1','美国 圣地亚哥','海滩（或水上公园）一起度过漫长而慵懒的日子，除了沙滩还有适合儿童的博物馆到令人筋疲力尽的徒步旅行。'),(11,'island_1','印度尼西亚 巴厘岛','巴厘岛在一个小岛上囊括了很多东西——从北部的 Sekumpul 等令人惊叹的瀑布到南部 Nyang Nyang 的白色沙滩。无论您在寻找什么，您都可能会找到：巴图博隆的冲浪胜地、水明漾的通宵俱乐部、努沙杜瓦的豪华悬崖酒店以及周围的精神避难所。在天堂之门拍照留念，穿过丛林前往隐秘的卡威古农寺，在乌鲁瓦图寺欣赏日落并欣赏传统的火舞。不要错过市场——在 Sukawati 艺术市场寻找手工艺术品和纺织品，或者在 Sindhu 夜市品尝沙爹和 bakso 等街头小吃。'),(12,'island_2','阿鲁巴岛','如果说一座岛屿完全是为了放松而建造的，那么阿鲁巴岛就是一座适合读书的岛屿。这里以柔软的沙滩、碧绿的海水和热带氛围欢迎游客的到来，这是典型的加勒比海体验（也是库拉索岛和博内尔岛的近邻）。当您不在阿鲁巴岛 40 个海滩之一闲逛时，可以去看看充满活力的荷兰加勒比文化。在该岛首府奥拉涅斯塔德的柔和建筑和商店中漫步。参观阿鲁巴国家考古博物馆或储备令人难以置信的当地美食，如海鲜或 keshi Yana（一种奶酪覆盖的砂锅菜）。对于非海滩品种的自然景观，不要错过蝴蝶农场（无需解释）以及阿鲁巴天然桥和孔奇天然泳池，它们都位于阿里科克国家公园。'),(13,'desert_1','澳大利亚 尤拉拉','尤拉拉 乌鲁鲁-卡塔丘塔国家公园距离最近的大城市有数百英里，因此这个人口不足 1,000 人的小镇对于乘坐巴士或飞机抵达的游客来说是一个受欢迎的景点。当您在城镇广场上漫步时，帆形的檐篷可以保护您免受正午阳光的伤害。白天，这个社区很安静，当游客参观完附近的红砂岩圆顶一天回来后，社区就变得活跃起来。预订乌鲁鲁日出或日落之旅，报名参加夜间观星之旅，或在国家公园游客中心了解方位。'),(14,'flower_1','日本 大阪','大坂是日本的三大都市之一，不仅拥有许多历史建筑，充满绿地的观光景点也相当多。每逢樱花季节到来，整个城市从城堡、寺院，到池塘、公园，到处都变身为充满疗癒的樱花景点。'),(15,'mountains-2','中国 北京 慕田峪长城','慕田峪长城是公元1368年，由朱元璋主将徐达在北齐长城遗址中修建的。该段长城东连古北口，西连居庸关，自古以来就是防御都城的军事要冲。有正观台、大角楼、鹰飞道阳、剑口、北京街等数座著名的敌楼，具有深厚的历史文化价值。长城群山环抱，绿化率达到98%，风景秀丽。慕田峪风景秀丽，是明长城的精华之一。'),(16,'remains_1','中国 北京 紫禁城','中国北京紫禁城，这座巨大的宫殿建筑群由 9,000 多个房间组成，占地超过 250 英亩，建于 15 世纪，后来在 18 世纪清朝期间进行了大规模翻修和修复。'),(17,'remains_2','埃及 金字塔','也许是世界七大奇迹中最知名的，这些雄伟金字塔的确切起源仍然引发争论。');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_hot`
--

/*!40000 ALTER TABLE `travel_hot` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=322001 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_rating`
--

/*!40000 ALTER TABLE `travel_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_rating` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2024-04-09 21:57:50
