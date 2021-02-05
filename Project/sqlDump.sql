-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tin_schema
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'orange juice',990),(2,'apple juice',590),(3,'coca-cola',390),(4,'pepsi',399),(5,'Borjomi',999),(6,'Paper towels',1299),(7,'Cat',59999),(8,'G',6700),(9,'yy',7876500),(10,'GTUY',5678900),(11,'tyuiuyt',567800),(12,'678',67800),(13,'789098',67800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `orderId` int NOT NULL,
  `itemId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`orderId`),
  KEY `Order_Item_userOrder` (`orderId`),
  CONSTRAINT `Order_Item_Item` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `Order_Item_userOrder` FOREIGN KEY (`orderId`) REFERENCES `userorder` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,2),(2,1,1),(4,1,3),(5,1,3),(1,2,1),(4,2,1),(5,2,1),(6,2,2),(9,2,5),(1,3,1),(3,3,5),(4,3,5),(5,3,5),(7,3,2),(8,3,1),(22,3,1),(11,4,1),(25,4,3),(19,5,1),(26,5,1),(28,5,9),(29,5,6),(8,6,4),(10,6,1),(20,6,1),(21,6,1),(26,6,1),(9,7,1),(13,7,1),(14,7,1),(15,7,1),(16,7,2),(17,7,2),(18,7,1),(27,7,3),(23,10,5);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_insert_calculateTotalPrice` AFTER INSERT ON `order_item` FOR EACH ROW begin

        call calculateTotalPrice(NEW.orderId);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_item_ChangeId` BEFORE UPDATE ON `order_item` FOR EACH ROW begin

        set NEW.orderId = OLD.orderId;

        set NEW.itemId = OLD.itemId;

    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_update_calculateTotalPrice` AFTER UPDATE ON `order_item` FOR EACH ROW begin

        call calculateTotalPrice(OLD.orderId);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_delete_calculateTotalPrice` AFTER DELETE ON `order_item` FOR EACH ROW begin

        call calculateTotalPrice(OLD.orderId);

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `systemuser`
--

DROP TABLE IF EXISTS `systemuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemuser` (
  `systemUserId` int NOT NULL,
  `roleId` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `passwordHash` varchar(32) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`systemUserId`),
  UNIQUE KEY `login` (`login`),
  KEY `systemUser_systemUserRole` (`roleId`),
  CONSTRAINT `systemUser_systemUserRole` FOREIGN KEY (`roleId`) REFERENCES `systemuserrole` (`systemUserRoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemuser`
--

LOCK TABLES `systemuser` WRITE;
/*!40000 ALTER TABLE `systemuser` DISABLE KEYS */;
INSERT INTO `systemuser` VALUES (1,2,'admin1','DA705D5CD7BEAA76A4B9D3585005657A',NULL,NULL),(2,2,'admin2','B7C8D368C1937C19E326902617668867',NULL,NULL),(3,1,'user1','49F05078D7E85D37652895568CEC1972',NULL,NULL),(4,1,'user2','B54B4139C8D3AF53C4A1D0861652D4DF',NULL,NULL),(5,1,'user3','4C79B9A270E893F95FA08C0471B1B1AA',NULL,NULL),(23,1,'user20','C4CA4238A0B923820DCC509A6F75849B',NULL,NULL),(24,1,'comp','8F0591FC97A0A5F7355609591AC04BE1',NULL,NULL),(25,1,'Krya','8A176F2A8E1B4CF9BF50D724E6240C62',NULL,NULL),(26,1,'her','9F6BBD7E88CCCAA5696FA20942761CAB',NULL,NULL),(27,1,'test1','5A105E8B9D40E1329780D62EA2265D8A',NULL,NULL),(28,1,'test2','AD0234829205B9033196BA818F7A872B',NULL,NULL),(29,1,'test3','test3',NULL,NULL),(30,1,'test4','86985E105F79B95D6BC918FB45EC7727',NULL,NULL),(31,1,'test5','86985E105F79B95D6BC918FB45EC7727',NULL,NULL);
/*!40000 ALTER TABLE `systemuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemuserrole`
--

DROP TABLE IF EXISTS `systemuserrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemuserrole` (
  `systemUserRoleId` int NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `createDate` timestamp NOT NULL,
  PRIMARY KEY (`systemUserRoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemuserrole`
--

LOCK TABLES `systemuserrole` WRITE;
/*!40000 ALTER TABLE `systemuserrole` DISABLE KEYS */;
INSERT INTO `systemuserrole` VALUES (1,'customer','2021-01-22 11:42:19'),(2,'administrator','2021-01-22 11:42:19');
/*!40000 ALTER TABLE `systemuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token` varchar(64) NOT NULL,
  `systemUserId` int NOT NULL,
  `validUntil` timestamp NOT NULL,
  PRIMARY KEY (`token`,`systemUserId`),
  KEY `Token_systemUser` (`systemUserId`),
  CONSTRAINT `Token_systemUser` FOREIGN KEY (`systemUserId`) REFERENCES `systemuser` (`systemUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES ('5c088616-67bb-11eb-982d-f430b99e9845',31,'2021-02-05 14:22:02'),('792238ac-67bb-11eb-982d-f430b99e9845',3,'2021-02-05 14:22:25');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userorder` (
  `orderId` int NOT NULL,
  `systemUserId` int NOT NULL,
  `deliveryDate` timestamp NULL DEFAULT NULL,
  `totalPrice` int NOT NULL,
  `orderNumber` int NOT NULL,
  `orderDate` timestamp NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `Order_systemUser` (`systemUserId`),
  CONSTRAINT `Order_systemUser` FOREIGN KEY (`systemUserId`) REFERENCES `systemuser` (`systemUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (1,3,NULL,2960,1,'2021-02-04 14:35:05'),(2,4,NULL,990,1,'2021-02-04 14:35:05'),(3,5,NULL,1950,1,'2021-02-04 14:35:05'),(4,3,NULL,5510,2,'2021-02-04 15:44:56'),(5,3,'2021-02-04 17:43:26',5510,3,'2021-02-04 15:44:56'),(6,3,NULL,1180,4,'2021-02-05 12:10:57'),(7,3,NULL,780,5,'2021-02-05 12:52:00'),(8,3,NULL,5586,6,'2021-02-05 12:52:40'),(9,3,NULL,62949,7,'2021-02-05 12:55:35'),(10,3,NULL,1299,8,'2021-02-05 12:56:25'),(11,3,NULL,399,9,'2021-02-05 12:56:35'),(12,27,NULL,0,1,'2021-02-05 13:22:21'),(13,27,NULL,59999,2,'2021-02-05 13:24:17'),(14,27,NULL,59999,3,'2021-02-05 13:24:32'),(15,27,NULL,59999,4,'2021-02-05 13:24:41'),(16,27,NULL,119998,5,'2021-02-05 13:25:01'),(17,27,NULL,119998,6,'2021-02-05 13:28:13'),(18,27,NULL,59999,7,'2021-02-05 13:29:22'),(19,27,NULL,999,8,'2021-02-05 13:37:51'),(20,27,NULL,1299,9,'2021-02-05 13:39:34'),(21,27,NULL,1299,10,'2021-02-05 13:41:35'),(22,27,NULL,390,11,'2021-02-05 13:41:45'),(23,27,NULL,28394500,12,'2021-02-05 13:42:15'),(24,28,NULL,0,1,'2021-02-05 13:42:50'),(25,29,NULL,1197,1,'2021-02-05 13:46:45'),(26,30,NULL,2298,1,'2021-02-05 13:49:15'),(27,30,NULL,179997,2,'2021-02-05 13:49:23'),(28,30,NULL,8991,3,'2021-02-05 13:50:07'),(29,31,NULL,5994,1,'2021-02-05 14:07:01');
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tin_schema'
--

--
-- Dumping routines for database 'tin_schema'
--
/*!50003 DROP FUNCTION IF EXISTS `checkLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `checkLogin`(

    _login varchar(50),

    _passwordHash varchar(32)

) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
begin

    declare res int default 0;

    set res = (

        select 1

        from systemuser us

        where us.login = _login and us.passwordHash = _passwordHash

        );



    if (res = 0) then

        return false;

    end if;



    return true;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `createNewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createNewOrder`(

    _token varchar(64)

) RETURNS int
    READS SQL DATA
    DETERMINISTIC
begin

    declare _newOrderNumber int;

    declare _newOrderId int;

    declare _userId int;



    call reassignToken(_token);



    set _userId = (

        select t.systemUserId

        from token t

      where t.token = _token

        );



    set _newOrderNumber = (

        select ifnull(max(orderNumber) + 1, 1)

        from userorder

        where systemUserId = _userId

        );

    set _newOrderId = (

        select max(orderid) + 1

        from userorder

        );



    insert into userorder(orderId, systemUserId,  orderNumber, orderDate, deliveryDate, totalPrice)

    values (_newOrderId, _userId, _newOrderNumber, now(), null, 0);



    return _newOrderNumber;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `createToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `createToken`(

     _login varchar(50),

     _passwordHash varchar(32)

) RETURNS varchar(64) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin

    declare _isCorrectLoginAndPassword boolean;

    declare _userId int;

    declare  _token varchar(64);



    call deleteOldTokens();



    if (not (select checkLogin(_login, _passwordHash))) then

            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong login/password combination';

    end if;



    set _userId = (select systemUserId from systemuser where login = _login and passwordHash = _passwordHash);



    delete from token where systemUserId = _userId;



    set _token = uuid();

    insert into token(token, systemUserId, validUntil) values (_token, _userId, now() + interval 15 minute);

    return _token;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getId`(

    _token varchar(64)

) RETURNS int
    READS SQL DATA
    DETERMINISTIC
begin

    declare _userId int;



    call reassignToken(_token);



    set _userId = (

        select t.systemUserId

        from token t

        where t.token = _token

        );

    return _userId;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSystemUserRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getSystemUserRole`(

    _token varchar(64)

) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin

    declare _role varchar(50);



    if(NOT (select isTokenValid(_token))) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Given token is invalid';

    end if;

    set _role = (select r.roleName

                 from systemUserRole r

                 where r.systemUserRoleId in (

                                            select u.roleId

                                            from systemUser u

                                            where u.systemUserId in (

                                                                    select t.systemUserId

                                                                    from token t

                                                                    where t.token = _token)));

    return _role;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `isTokenValid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isTokenValid`(

    _token varchar(64)

) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
begin

    declare _res int;

    call deleteOldTokens();

    set _res = (select 1 from token where token = _token and validUntil > now());

    return (_res is not null);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addItemToOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addItemToOrder`(

    IN _token varchar(64),

    IN _orderNumber int,

    IN _itemName varchar(50),

    IN _quantity int

)
begin

    declare _userId int;

    declare _orderId int;

    declare _itemId int;

    call reassignToken(_token);



    set _userId = (select getId(_token));



    set _orderId = (

        select orderId

        from userorder

        where orderNumber = _orderNumber and systemuserId = _userId

    );

    if(_orderId is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order with this number does not exist';

    end if;

    set _itemId = (

        select itemId

        from item

        where itemName = _itemName

    );



    if(_itemId is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item with this name does not exist';

    end if;



    insert into order_item(orderId, itemId, quantity) values (_orderId, _itemId, _quantity);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewItem`(

    IN _token varchar(64),

    IN _itemName varchar(50),

    IN _itemPrice double

)
begin

    declare _role varchar(50);

    declare _isAllowedToInsert int;

    declare _id int;

    declare _priceToInt int;



    set _role = (select getSystemUserRole(_token));



    set _isAllowedToInsert = (select 1

                              from systemUserRole

                              where roleName = _role and systemUserRoleId in (select 2 -- administrator

                                                        ));



    if(_isAllowedToInsert is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not allowed to insert new items';

    end if;



    if((select 1 from item where itemName = _itemName limit 1) is not null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item with this name already exists';

    end if;



    set _id = (select max(itemId) + 1

               from item);

   set _priceToInt = (select floor(_itemPrice * 100));

    insert into item(itemId, itemName, price) values (_id, _itemName, _priceToInt);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addNewUser`(

    IN _login varchar(50),

    IN _passwordHash varchar(32),

    IN _firstName varchar(50),

    IN _lastName varchar(50)



)
begin

    set @isLoginTaken = (select 1 from systemuser where login = _login);



    if (@isLoginTaken is not null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The login is taken';

    end if;



    set @roleId = 1;



    set @systemUserId = (select max(systemUserId) + 1 from systemUser);



    insert into systemUser(systemUserId, roleId, login, passwordHash, firstName, lastName)

     values (@systemUserId, @roleId, _login, _passwordHash, _firstName, _lastName);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculateTotalPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculateTotalPrice`(

    IN _orderId int

)
begin

    declare _totalPrice int;



    set _totalPrice = (

        select sum(i.price * o.quantity)

        from order_item o,

             item i

        where o.itemId = i.itemId and o.orderId = _orderId

    );



    update userOrder set totalPrice = IFNULL(_totalPrice, 0) where orderId = _orderId;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteItem`(

    IN _token varchar(64),

    IN _itemName varchar(50)

)
begin

    declare _role varchar(50);

    declare _isAllowedToDelete int;

    declare _id int;



    set _role = (select getSystemUserRole(_token));



    set _isAllowedToDelete = (select 1

                              from systemUserRole

                              where roleName = _role and systemUserRoleId in (select 2 -- administrator

                                                        ));



    if(_isAllowedToDelete is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not allowed to update items';

    end if;



    set _id = ( select (itemId)

                from item

                where itemName = _itemName

                limit 1);





    if(_id is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item with this name does not exist';

    end if;



    delete from item where itemId = _id;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOldTokens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldTokens`(

)
begin

    delete from token where validUntil < now();

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllOrdersByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllOrdersByUser`(

    IN _token varchar(64)

)
begin

    DECLARE _id int;

    if(NOT (select isTokenValid(_token))) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Given token is invalid';

    end if;



    set _id = (select t.systemUserId

                      from token t

                      where t.token = _token);



    select o.orderNumber, o_i.quantity, i.itemName, (cast(i.price as decimal) / 100) as 'price', o.orderDate, o.deliveryDate

    from userOrder o, item i, order_item o_i

    where o.systemUserId = _id and o.orderId = o_i.orderId and i.itemId = o_i.itemId;



end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reassignToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reassignToken`(

    IN _token varchar(64)

)
begin

    if(NOT (select isTokenValid(_token))) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Given token is invalid';

    end if;

    update token set validUntil = now() + interval 15 minute where token = _token;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateItem`(

    IN _token varchar(64),

    IN _itemName varchar(50),

    IN _itemPrice double

)
begin

    declare _role varchar(50);

    declare _isAllowedToUpdate int;

    declare _id int;



    set _role = (select getSystemUserRole(_token));



    set _isAllowedToUpdate = (select 1

                              from systemUserRole

                              where roleName = _role and systemUserRoleId in (select 2 -- administrator

                                                        ));



    if(_isAllowedToUpdate is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You are not allowed to update items';

    end if;



    set _id = ( select (itemId)

                from item

                where itemName = _itemName

                limit 1);





    if(_id is null) then

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item with this name does not exist';

    end if;



    update item set price = floor(_itemPrice * 100) where itemId = _id;



end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-05 16:12:46
