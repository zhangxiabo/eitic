-- MySQL dump 10.13  Distrib 5.1.62, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: gradpro
-- ------------------------------------------------------
-- Server version	5.1.62-0ubuntu0.11.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `classid` varchar(10) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `deptid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`classid`),
  KEY `deptid` (`deptid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('19181','信息81班','191'),('19182','信息82班','191'),('19281','计科81班','192'),('19282','计科82班','192'),('19283','计科83班','192'),('19381','网工81班','193'),('19382','网工82班','193'),('30283','测试班级2','302'),('30181','测试班级81','301'),('30182','测试班级82','301'),('30183','班级83','301');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college` (
  `collegeid` varchar(10) NOT NULL,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`collegeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('19','信息科学技术学院'),('13','资源与环境科学学院'),('22','人文社会科学学院'),('12','植物保护学院'),('16','经济管理学院'),('15','动物科技学院'),('17','动物医学院'),('20','公共管理学院'),('18','食品科技学院'),('10','生命科学学院'),('21','外国语学院'),('14','园艺学院'),('11','农学院'),('23','理学院'),('24','工学院'),('30','测试的学院');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptid` varchar(10) NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `collegeid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`deptid`),
  KEY `collegeid` (`collegeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('191','信息管理与信息技术','19'),('192','计算机科学与技术','19'),('193','网络工程','19'),('301','测试专业1','30'),('302','测试专业2','30');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inspection` (
  `inspectionid` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `progress` varchar(1000) NOT NULL,
  `problem` varchar(1000) NOT NULL,
  `teaopinion` varchar(500) DEFAULT NULL,
  `deptopinion` varchar(500) DEFAULT NULL,
  `subtime` datetime DEFAULT NULL,
  PRIMARY KEY (`inspectionid`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
INSERT INTO `inspection` VALUES (1,1,'(1)学习Java EE的三个框架SSH和mysql数据库。<br>\r\n(2)在掌握数据库设计的基础上，对本系统进行需求分析和数据库设计，完成UML图和程序流程图以及整体的设计工作，把系统的总体框架搭建完毕。<br>\r\n(3)完成全部代码的编写和测试工作，使其能够在预先的系统平台上稳定正确的运行，实现需求分析上的相应的功能。完成论文的写作和修改定稿，准备答辩。<br>\r\n(4)准备好各种需要的材料进行答辩。<br>','(1)已完成情况：现已按照计划学习了Java EE相关技术，并参照软件设计的流程已对本系统进行了需求分析和数据库的设计，也已基本完成了系统界面部分的搭建，由于时间原因，系统的框架还未搭建，正着手准备。<br>\r\n(2)存在的问题：由于技术有限，在系统功能的细节问题上还有些没有完全弄明白，比如文件的上传于下载以及系统某些功能的开启和关闭等功能的实现，还需要些时间对这些技术问题进行研究。<br>\r\n(3)拟解决措施：需要查找资料进行学习，并尽量攻克技术难关。相信在我的努力下，能够克服各种难题，尽量完成一个完美的毕业设计。<br>',NULL,NULL,'2012-05-03 17:10:50'),(2,5,'搜索','搜索',NULL,NULL,'2012-05-14 09:47:19');
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` varchar(20) NOT NULL,
  `toid` varchar(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `newname` varchar(50) NOT NULL,
  `subtime` datetime DEFAULT NULL,
  PRIMARY KEY (`messageid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'1928313','1900101','test1928313-11','aaa','','','2012-05-07 19:19:14'),(5,'1900101','1928313','test1900101-11','sdf','','','2012-05-07 20:32:22'),(6,'1900101','1928317','test1900101-12','asa','','','2012-05-07 20:32:43'),(7,'1900101','1928313','test1900101-13','sdf','Programming Your Home.pdf','1900101-44533.pdf','2012-05-07 20:33:19'),(8,'1928317','1900101','test1928317-11','11','','','2012-05-07 21:10:02'),(9,'1928317','1900101','test1928317-12','12','','','2012-05-07 21:10:12'),(10,'1928317','1900101','test1928317-13','13','','','2012-05-07 21:10:23'),(11,'1928317','1900101','test1900101-14','14','','','2012-05-07 21:10:36'),(12,'1928317','1900101','test1900101-15','15','','','2012-05-07 21:10:45'),(13,'1928311','1900101','test1928311-11','11','','','2012-05-07 21:11:13'),(14,'1928311','1900101','test1928311-12','12','','','2012-05-07 21:11:30'),(15,'1928311','1900101','test1928311-13','13','','','2012-05-07 21:11:45'),(16,'1928311','1900101','test1928311-14','14','','','2012-05-07 21:11:57'),(17,'1928311','1900101','test1928311-15','15','','','2012-05-07 21:12:13');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `noticeid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(40) NOT NULL,
  `scope` varchar(20) NOT NULL,
  `ncontent` varchar(5000) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`noticeid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'关于毕业设计的通知','all','请毕业生合理安排时间，按时完成毕业设计','2012-04-25 16:35:59'),(2,'关于毕业生离校的通知','all','毕业生离校时间:6月**号','2012-04-25 16:39:25'),(3,'关于毕业生毕业证发放的通知','all','关于毕业生毕业证发放是在。。。。。的情况下。。。。才。。。。','2012-04-25 16:40:22'),(4,'关于毕业生户籍迁移的通知','all','    毕业生户籍在毕业以后需迁离学校','2012-04-25 16:41:40'),(5,'关于毕业典礼的通知','all','blablabla','2012-04-25 16:42:37'),(6,'关于信息学院毕业生开题答辩的通知','19','答辩时间：****\r\n答辩地点：****','2012-04-25 16:54:52'),(7,'关于信息学院毕业生中期检查的通知','19','中期检查提交报告。\r\n时间****','2012-04-25 16:55:43'),(8,'关于信息学院毕业生工作相关的通知','19','工作','2012-04-25 16:56:53'),(9,'关于信息学院毕业生照毕业照的通知','19','毕业照','2012-04-25 16:57:12'),(10,'关于信息学院毕业生毕业答辩的通知','19','毕业答辩','2012-04-25 17:10:11'),(11,'关于110周年校庆的通知','all','        校庆\r\n\r\n      正文 阿长与山海经\r\n      若雨中文网 更新时间:2007-9-20 23:46:20 本章字数:3426\r\n\r\n　　长妈妈，已经说过，是一个一向带领着我的女工，说得阔气一点，就是我的保姆。我的母亲和许多别的人都这样称呼她，似乎略带些客气的意思。只有祖母叫她阿长。我平时叫她“阿妈”，连“长”字也不带；但到憎恶她的时候，&#8212;&#8212;例如知道了谋死我那隐鼠的却是她的时候，就叫她阿长。\r\n　　我们那里没有姓长的；她生得黄胖而矮，“长”也不是形容词。又不是她的名字，记得她自己说过，她的名字是叫作什么姑娘的。什么姑娘，我现在已经忘却了，总之不是长姑娘；也终于不知道她姓什么。记得她也曾告诉过我这个名称的来历：先前的先前，我家有一个女工，身材生得很高大，这就是真阿长。后来她回去了，我那什么姑娘才来补她的缺，然而大家因为叫惯了，没有再改口，于是她从此也就成为长妈妈了。\r\n　　虽然背地里说人长短不是好事情，但倘使要我说句真心话，我可只得说：我实在不大佩服她。最讨厌的是常喜欢切切察察，向人们低声絮说些什么事。还竖起第二个手指，在空中上下摇动，或者点着对手或自己的鼻尖。我的家里一有些小风波，不知怎的我总疑心和这“切切察察”有些关系。又不许我走动，拔一株草，翻一块石头，就说我顽皮，要告诉我的母亲去了。一到夏天，睡觉时她又伸开两脚两手，在床中间摆成一个“大”字，挤得我没有余地翻身，久睡在一角的席子上，又已经烤得那么热。推她呢，不动；叫她呢，也不闻。\r\n　　“长妈妈生得那么胖，一定很怕热罢？晚上的睡相，怕不见得很好罢？……”\r\n　　母亲听到我多回诉苦之后，曾经这样地问过她。我也知道这意思是要她多给我一些空席。她不开口。但到夜里，我热得醒来的时候，却仍然看见满床摆着一个“大”字，一条臂膊还搁在我的颈子上。我想，这实在是无法可想了。\r\n　　但是她懂得许多规矩；这些规矩，也大概是我所不耐烦的。一年中最高兴的时节，自然要数除夕了。辞岁之后，从长辈得到压岁钱，红纸包着，放在枕边，只要过一宵，便可以随意使用。睡在枕上，看着红包，想到明天买来的小鼓、刀枪、泥人、糖菩萨……。然而她进来，又将一个福橘放在床头了。\r\n　　“哥儿，你牢牢记住！”她极其郑重地说。“明天是正月初一，清早一睁开眼睛，第一句话就得对我说：‘阿妈，恭喜恭喜！’记得么？你要记着，这是一年的运气的事情。不许说别的话！说过之后，还得吃一点福橘。”她又拿起那橘子来在我的眼前摇了两摇，“那么，一年到头，顺顺流流……。”\r\n　　梦里也记得元旦的，第二天醒得特别早，一醒，就要坐起来。她却立刻伸出臂膊，一把将我按住。我惊异地看她时，只见她惶急地看着我。\r\n　　她又有所要求似的，摇着我的肩。我忽而记得了&#8212;&#8212;\r\n　　“阿妈，恭喜……。”\r\n　　“恭喜恭喜！大家恭喜！真聪明！恭喜恭喜！”她于是十分欢喜似的，笑将起来，同时将一点冰冷的东西，塞在我的嘴里。我大吃一惊之后，也就忽而记得，这就是所谓福橘，元旦辟头的磨难，总算已经受完，可以下床玩耍去了。\r\n　　她教给我的道理还很多，例如说人死了，不该说死掉，必须说“老掉了”；死了人，生了孩子的屋子里，不应该走进去；饭粒落在地上，必须拣起来，最好是吃下去；晒裤子用的竹竿底下，是万不可钻过去的……。此外，现在大抵忘却了，只有元旦的古怪仪式记得最清楚。总之：都是些烦琐之至，至今想起来还觉得非常麻烦的事情。\r\n　　然而我有一时也对她发生过空前的敬意。她常常对我讲“长毛”。她之所谓“长毛”者，不但洪秀全军，似乎连后来一切土匪强盗都在内，但除却革命党，因为那时还没有。她说得长毛非常可怕，他们的话就听不懂。她说先前长毛进城的时候，我家全都逃到海边去了，只留一个门房和年老的煮饭老妈子看家。后来长毛果然进门来了，那老妈子便叫他们“大王”，&#8212;&#8212;据说对长毛就应该这样叫，&#8212;&#8212;诉说自己的饥饿。长毛笑道：“那么，这东西就给你吃了罢！”将一个圆圆的东西掷了过来，还带着一条小辫子，正是那门房的头。煮饭老妈子从此就骇破了胆，后来一提起，还是立刻面如土色，自己轻轻地拍着胸埔道：“阿呀，骇死我了，骇死我了……。”\r\n　　我那时似乎倒并不怕，因为我觉得这些事和我毫不相干的，我不是一个门房。但她大概也即觉到了，说道：“象你似的小孩子，长毛也要掳的，掳去做小长毛。还有好看的姑娘，也要掳。”\r\n　　“那么，你是不要紧的。”我以为她一定最安全了，既不做门房，又不是小孩子，也生得不好看，况且颈子上还有许多炙疮疤。\r\n　　“那里的话？！”她严肃地说。“我们就没有用处？我们也要被掳去。城外有兵来攻的时候，长毛就叫我们脱下裤子，一排一排地站在城墙上，外面的大炮就放不出来；再要放，就炸了！”\r\n　　这实在是出于我意想之外的，不能不惊异。我一向只以为她满肚子是麻烦的礼节罢了，却不料她还有这样伟大的神力。从此对于她就有了特别的敬意，似乎实在深不可测；夜间的伸开手脚，占领全床，那当然是情有可原的了，倒应该我退让。\r\n　　这种敬意，虽然也逐渐淡薄起来，但完全消失，大概是在知道她谋害了我的隐鼠之后。那时就极严重地诘问，而且当面叫她阿长。我想我又不真做小长毛，不去攻城，也不放炮，更不怕炮炸，我惧惮她什么呢！\r\n　　但当我哀悼隐鼠，给它复仇的时候，一面又在渴慕着绘图的《山海经》了。这渴慕是从一个远房的叔祖惹起来的。他是一个胖胖的，和蔼的老人，爱种一点花木，如珠兰、茉莉之类，还有极其少见的，据说从北边带回去的马缨花。他的太太却正相反，什么也莫名其妙，曾将晒衣服的竹竿搁在珠兰的枝条上，枝折了，还要愤愤地咒骂道：“死尸！”这老人是个寂寞者，因为无人可谈，就很爱和孩子们往来，有时简直称我们为“小友”。在我们聚族而居的宅子里，只有他书多，而且特别。制艺和试帖诗，自然也是有的；但我却只在他的书斋里，看见过陆玑的《毛诗草木鸟兽虫鱼疏》，还有许多名目很生的书籍。我那时最爱看的是《花镜》，上面有许多图。他说给我听，曾经有过一部绘图的《山海经》，画着人面的兽，九头的蛇，三脚的鸟，生着翅膀的人，没有头而以两乳当作眼睛的怪物，……可惜现在不知道放在那里了。\r\n　　很愿意看看这样的图画，但不好意思力逼他去寻找，他是很疏懒的。问别人呢，谁也不肯真实地回答我。压岁钱还有几百文，买罢，又没有好机会。有书买的大街离我家远得很，我一年中只能在正月间去玩一趟，那时候，两家书店都紧紧地关着门。\r\n　　玩的时候倒是没有什么的，但一坐下，我就记得绘图的《山海经》。\r\n　　大概是太过于念念不忘了，连阿长也来问《山海经》是怎么一回事。这是我向来没有和她说过的，我知道她并非学者，说了也无益；但既然来问，也就都对她说了。\r\n　　过了十多天，或者一个月罢，我还记得，是她告假回家以后的四五天，她穿着新的蓝布衫回来了，一见面，就将一包书递给我，高兴地说道：&#8212;&#8212;“哥儿，有画儿的‘三哼经’，我给你买来了！”\r\n　　我似乎遇着了一个霹雳，全体都震悚起来；赶紧去接过来，打开纸包，是四本小小的书，略略一翻，人面的兽，九头的蛇，……果然都在内。\r\n　　又使我发生新的敬意了，别人不肯做，或不能做的事，她却能够做成功。她确有伟大的神力。谋害隐鼠的怨恨，从此完全消灭了。\r\n　　这四本书，乃是我最初得到，最为心爱的宝书。\r\n　　书的模样，到现在还在眼前。可是从还在眼前的模样来说，却是一部刻印都十分粗拙的本子。纸张很黄；图象也很坏，甚至于几乎全用直线凑合，连动物的眼睛也都是长方形的。但那是我最为心爱的宝书，看起来，确是人面的兽；九头的蛇；一脚的牛；袋子似的帝江；没有头而“以乳为目，以脐为口”，还要“执干戚而舞”的刑天。\r\n　　此后我就更其搜集绘图的书，于是有了石印的《尔雅音图》和《毛诗品物图考》，又有了《点石斋丛画》和《诗画舫》。《山海经》也另买了一部石印的，每卷都有图赞，绿色的画，字是红的，比那木刻的精致得多了。这一部直到前年还在，是缩印的郝懿行疏。木刻的却已经记不清是什么时候失掉了。\r\n　　我的保姆，长妈妈即阿长，辞了这人世，大概也有了三十年了罢。我终于不知道她的姓名，她的经历；仅知道有一个过继的儿子，她大约是青年守寡的孤孀。\r\n　　仁厚黑暗的地母呵，愿在你怀里永安她的魂灵！','2012-04-27 09:14:00'),(12,'测试--------','all','测试--------','2012-05-10 15:12:16');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `paperid` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `newname` varchar(50) NOT NULL,
  `subtime` datetime DEFAULT NULL,
  PRIMARY KEY (`paperid`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (8,1,'漫谈设计模式.pdf','1928313-815050.pdf','2012-05-07 19:47:20'),(9,5,'漫谈设计模式.pdf','1928333-229226.pdf','2012-05-14 09:47:41');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `reportid` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `overview` varchar(1000) NOT NULL,
  `goal` varchar(1000) NOT NULL,
  `method` varchar(1000) NOT NULL,
  `innovation` varchar(1000) NOT NULL,
  `progress` varchar(1000) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `teaopinion` varchar(500) DEFAULT NULL,
  `deptopinion` varchar(500) DEFAULT NULL,
  `subtime` datetime DEFAULT NULL,
  PRIMARY KEY (`reportid`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (2,1,'毕业设计是高校教学过程的最后阶段采用的一种总结性的实践教学环节，通过毕业设计，能使学生综合应用所学的各种理论知识和技能，进行全面、系统、严格的技术及基本能力的练习。也是检验学生大学四年所学知识的综合分析、综合运用能力，是学生向工作岗位的过渡，对学生的创新能力的培养有很重要的意义。、\r\n在毕业设计的管理工作中，对于各种数据和报表，学院老师在处理的过程中，存在着工作量大、指导老师多、灵活性强和进度要求严格等特点，使毕业设计的管理工作难度越来越大。另外，由于大四学生比较分散，没有一个互相交流的平台，这就导致学生交流不够，容易选择有相似或者雷同的题目，这就给学生自己和学院带来很多不必要的麻烦。\r\n为了更好的做好毕业设计的管理工作，减少一些不必要的重复选题的工作量，使学生能够选择一个比较感兴趣的题目，指导老师也能够及时的对题目进行更新和修改，建立一个B/S模式的网上毕业设计管理系统是非常有必要的。在这个系统中，学生可以在线与老师进行留言交流，双方协商设计的目标、内容和进度，避免了与其他学生选题重复的现象，能有效提高毕业设计工作的效率和质量。','本设计的主要目标是基于B/S模式，实现一个WEB形式的毕业设计管理系统，此系统主要有几个功能模块：用户登录模块、教师出题模块、学生选题模块、通知公告模块、师生网上交流模块、毕业设计过程管理模块和审评模块。\r\n其主要内容如下：\r\n（1） 用户登录模块：包括用户注册和登录，用户信息管理，管理员管理。\r\n（2） 教师出题模块：教师出题时，将课题名称以及相关的详细信息一并公示，共学生选题做参考。\r\n（3） 学生选题模块：学生根据教师出的题目，按照课题各个方面的要求和难易程度进行对照选择自己感兴趣的题目，原则上学生不能选相同的题目。学生也可根据爱好自行定题，但要经过指导老师的同意。\r\n（4） 通知公告模块：教师或管理员可以提交一些毕业设计的相关通知公告。\r\n（5） 师生网上交流模块：此模块主要是提供给教师和学生相互交流的网上平台。学生可以采用网上留言的形式来发表自己对相关毕业设计问题的疑问，指导教师和学生都可以针对相应的问题发表意见，开展互助学习与交流。\r\n（6） 毕业设计过程管理模块：对毕业设计的整体工作进行管理。\r\n（7） 审评模块：综合神品学生的整个毕业设计阶段的过程管理记录，对学生的毕业设计组织答辩，并给出总评。\r\n\r\n在整个系统设计的初级阶段，对毕业设计的整体流程和一些细节还不是非常清楚，需要在进行一些调查和学习后，对整个系统做出一份用户需求分析，再对每个模块的业务逻辑进行设计。','系统的页面主要通过JSP来实现，数据库的设计主要使用mysql，后台程序代码采用Java语言编写，后台服务器采用Apache Tomcat服务器，开发工具采用Eclipse。\r\n具体步骤如下：\r\n（1）在系统进行调查研究后，对系统进行需求分析，包括系统的功能、规模和界面等；\r\n（2）把整个开发分为几个模块进行概要设计；\r\n（3）对每一模块进行详细的设计，如用户在登录后进行身份验证，以便进入不同的页面；\r\n（4）采用mysql数据库对系统所需要的各个表进行数据库设计；\r\n（5）细分模块，开始程序代码的编写和界面的设计；\r\n（6）把所有模块进行整合，包括数据库的连接，主界面和各个模块之间的连接等；\r\n（7）最后进行测试和修改，对有不足的地方进行重新编写和测试。','本系统在基本实现登录、出题、选题等管理系统的相关功能外，还特别加强了学生选题的功能，学生可以根据指导教师所出的题目进行选择，也可以自行拟定题目并有教师同意，还可以学生之间在线交流题目，避免了选题重复带来的不必要的麻烦，是毕业设计的工作更加高效。','2012.2.19-2012.3.7：选题并查阅资料，准备前期工作，学习Java EE的三个框架SSH和Oracle数据库，并完成开题报告。\r\n2012.3.7-2012.4.11：在掌握数据库设计的基础上，对本系统进行需求分析和数据库设计，完成UML图和程序流程图以及整体的设计工作，把系统的总体框架搭建完毕。\r\n2012.4.11-2012.5.16：完成全部代码的编写和测试工作，使其能够在预先的系统平台上稳定正确的运行，实现需求分析上的相应的功能。完成论文的写作和修改定稿，准备答辩。\r\n2012.5.16：准备好各种需要的材料进行答辩。','已具备条件：\r\n        硬件条件：可满足开发的笔记本电脑；\r\n        软件条件：Windows XP操作系统，Eclipse+JDK开发环境，mysql数据库系统，Tomcat 6.0；\r\n缺少的条件：对Java EE的三个框架Struts2、Spring、Hibernate的结构还不是很熟练，mysql数据库的运用还有待提高；\r\n解决途径：在书本和网络上学习相关技术，研究类似的项目的程序，寻找解决的方法，去图书馆查找相关书籍，有不懂的可以请教老师和同学们的帮助。\r\n',NULL,NULL,'2012-05-03 11:51:43'),(3,5,'啊啊','啊啊','等待','问问','的','冻死搜索',NULL,NULL,'2012-05-14 09:46:48');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `stuid` varchar(20) NOT NULL,
  `teaid` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `subtime` datetime DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  UNIQUE KEY `stuid` (`stuid`),
  KEY `teaid` (`teaid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'基于BS模式的毕业设计管理系统的设计与实现','毕业设计是高校教学过程的最后阶段采用的一种总结性的实践教学环节，通过毕业设计，能使学生综合应用所学的各种理论知识和技能，进行全面、系统、严格的技术及基本能力的练习。也是检验学生大学四年所学知识的综合分析、综合运用能力，是学生向工作岗位的过渡，对学生的创新能力的培养有很重要的意义。11','1928313','1900101','8','2012-05-02 11:41:59'),(2,'基于Android的微薄的设计与实现','Android 新浪微薄11','1928317','1900101','5','2012-05-02 13:22:14'),(3,'基于****的****','sdfsdf','1928311','1900101','5','2012-05-02 14:49:35'),(4,'图书管理系统test','图书管理系统','1928314','1900101','1','2012-05-09 09:18:27'),(5,'毕业设计','毕业所以设计','1928333','1900101','8','2012-05-14 09:43:52');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `lasttime` datetime DEFAULT NULL,
  `realname` varchar(20) NOT NULL,
  `collegeid` varchar(10) NOT NULL,
  `deptid` varchar(10) DEFAULT NULL,
  `classid` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin','sysadmin','2012-05-14 09:41:43','admin','all',NULL,NULL,NULL,NULL),('1928313','1928313','student','2012-05-14 09:38:10','张家鸽','19','192','19283','pigeon0312@qq.com','15195985810'),('1900101','1900101','teacher','2012-05-14 09:44:23','导师1','19',NULL,NULL,'daoshi1@gmail.com','15166666666'),('1900001','1900001','deptadmin','2012-05-14 09:45:12','信息院管理员','19',NULL,NULL,NULL,NULL),('1928317','1928317','student','2012-05-07 21:09:26','沈志兵','19','192','19283',NULL,NULL),('1928311','1928311','student','2012-05-07 22:23:23','朱沛','19','192','19283',NULL,NULL),('1928314','1928314','student','2012-05-09 09:20:30','李东亮','19','192','19283',NULL,NULL),('3018101','3018101','student','2012-05-10 18:43:38','学生1','30','301','30181',NULL,NULL),('3018301','3018301','student','2012-05-14 09:40:37','学生2','30','301','30183',NULL,NULL),('1928333','1928333','student','2012-05-14 09:45:34','学生5','19','192','19283',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-15 11:19:16
