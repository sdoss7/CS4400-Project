DROP DATABASE IF EXISTS team13;
CREATE DATABASE team13;
USE team13;
DROP TABLE IF EXISTS user;	 	 	
CREATE TABLE user
(
username VARCHAR(50) NOT NULL UNIQUE,
firstname VARCHAR(50) NOT NULL,
lastname VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
status VARCHAR(50) NOT NULL,
PRIMARY KEY (username)
);
DROP TABLE IF EXISTS customer;	
CREATE TABLE customer
(
username VARCHAR(50) NOT NULL,
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES user(username)
);
DROP TABLE IF EXISTS employee;	
CREATE TABLE employee
(
username VARCHAR(50) NOT NULL,
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES user(username)
);
DROP TABLE IF EXISTS admin;	
CREATE TABLE admin
(
username VARCHAR(50) NOT NULL,
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES employee(username)
)
;
DROP TABLE IF EXISTS company;	
CREATE TABLE company
(
comName VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (comName)
);
DROP TABLE IF EXISTS manager;	
CREATE TABLE manager
(
username VARCHAR(50) NOT NULL UNIQUE,
manStreet VARCHAR(50),
manCity VARCHAR(50),
manState CHAR(3),
manZipcode CHAR(5),
comName VARCHAR(50),
PRIMARY KEY (username), #NEED TO CHANGE BC THIS IS WEAK ENTITY???
FOREIGN KEY (username) REFERENCES employee(username),
FOREIGN KEY (comName) REFERENCES company(comName)
);

DROP TABLE IF EXISTS theater;	
CREATE TABLE theater
(
thName VARCHAR(50) NOT NULL,
comName VARCHAR(50) NOT NULL,
thcapacity INT NOT NULL,
thStreet VARCHAR(50) NOT NULL,
thCity VARCHAR(50) NOT NULL,
thState VARCHAR(3) NOT NULL,
thZipcode CHAR(5) NOT NULL,
thManagerUsername VARCHAR(50) NOT NULL,
PRIMARY KEY (thName, comName),
FOREIGN KEY (comName) REFERENCES company(comName),
FOREIGN KEY (thManagerUsername) REFERENCES manager(username)
);
DROP TABLE IF EXISTS customercreditcard;	
CREATE TABLE customercreditcard
(
username VARCHAR(50),
creditCardNum CHAR(16) NOT NULL UNIQUE,
PRIMARY KEY (creditCardNum),
FOREIGN KEY (username) REFERENCES user(username)
);
DROP TABLE IF EXISTS movie;	
CREATE TABLE movie
(
movName VARCHAR(50) NOT NULL,
movReleaseDate DATE NOT NULL,
movDuration INT NOT NULL,
PRIMARY KEY (movName, movReleaseDate)
);
DROP TABLE IF EXISTS movieplay;	
CREATE TABLE movieplay
(
movName VARCHAR(50) NOT NULL,
movReleaseDate DATE NOT NULL,
movPlayDate DATE NOT NULL,
thName VARCHAR(50) NOT NULL,
comName VARCHAR(50) NOT NULL,
PRIMARY KEY (movName, movReleaseDate, movPlayDate, thName, comName),
FOREIGN KEY (thName, comName) REFERENCES theater(thName, comName),
FOREIGN KEY (movName, movReleaseDate) REFERENCES movie(movName, movReleaseDate)
);
DROP TABLE IF EXISTS uservisittheater;	
CREATE TABLE uservisittheater 
(
username VARCHAR(50) NOT NULL,
thName VARCHAR(50) NOT NULL,
comName VARCHAR(50) NOT NULL,
visitDate DATE NOT NULL,
VisitID INT NOT NULL UNIQUE,
PRIMARY KEY (VisitID),
FOREIGN KEY (thName, comName) REFERENCES theater(thName, comName),
FOREIGN KEY (username) REFERENCES user(username)
);
DROP TABLE IF EXISTS customerviewmovie;	
CREATE TABLE customerviewmovie
(
movName VARCHAR(50) NOT NULL,
movReleaseDate DATE NOT NULL,
movPlayDate DATE NOT NULL,
thName VARCHAR(50) NOT NULL,
comName VARCHAR(50) NOT NULL,
creditCardNum CHAR(16) NOT NULL,
PRIMARY KEY (movName, movReleaseDate, movPlayDate, thName, comName, creditCardNum),
FOREIGN KEY (creditCardNum) REFERENCES customercreditcard(creditCardNum),
FOREIGN KEY (movName,movReleaseDate, movPlayDate, thName, comName) REFERENCES movieplay(movName,movReleaseDate, movPlayDate, thName, comName)
);


LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('calcultron','Dwight','Schrute','333333333','Approved'),('calcultron2','Jim','Halpert','444444444','Approved'),('calcwizard','Issac','Newton','222222222','Approved'),('clarinetbeast','Squidward','Tentacles','999999999','Declined'),('cool_class4400','A. TA','Washere','333333333','Approved'),('DNAhelix','Rosalind','Franklin','777777777','Approved'),('does2Much','Carl','Gauss','1212121212','Approved'),('eeqmcsquare','Albert','Einstein','111111110','Approved'),('entropyRox','Claude','Shannon','999999999','Approved'),('fatherAI','Alan','Turing','222222222','Approved'),('fullMetal','Edward','Elric','111111100','Approved'),('gdanger','Gary','Danger','555555555','Declined'),('georgep','George P.','Burdell','111111111','Approved'),('ghcghc','Grace','Hopper','666666666','Approved'),('ilikemoney$$','Eugene','Krabs','111111110','Approved'),('imbatman','Bruce','Wayne','666666666','Approved'),('imready','Spongebob','Squarepants','777777777','Approved'),('isthisthekrustykrab','Patrick','Star','888888888','Approved'),('manager1','manager','One','1122112211','Approved'),('manager2','manager','Two','3131313131','Approved'),('manager3','Three','Three','8787878787','Approved'),('manager4','Four','Four','5755555555','Approved'),('notFullMetal','Alphonse','Elric','111111100','Approved'),('programerAAL','Ada','Lovelace','3131313131','Approved'),('radioactivePoRa','Marie','Curie','1313131313','Approved'),('RitzLover28','Abby','Normal','444444444','Approved'),('smith_j','John','Smith','333333333','Pending'),('texasStarKarate','Sandy','Cheeks','111111110','Declined'),('thePiGuy3.14','Archimedes','Syracuse','1111111111','Approved'),('theScienceGuy','Bill','Nye','999999999','Approved');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('calcultron'),('cool_class4400'),('entropyRox'),('fatherAI'),('georgep'),('ghcghc'),('imbatman'),('manager1'),('manager2'),('manager3'),('manager4'),('radioactivePoRa');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('cool_class4400');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('4400 theater company'),('AI theater company'),('Awesome theater company'),('EZ theater company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('georgep'),('calcultron'),('entropyRox'),('cool_class4400'),('calcultron2'),('calcwizard'),('clarinetbeast'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('fullMetal'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customercreditcard`
--

LOCK TABLES `customercreditcard` WRITE;
/*!40000 ALTER TABLE `customercreditcard` DISABLE KEYS */;
INSERT INTO `customercreditcard` VALUES ('calcultron','1111111111000000'),('calcultron2','1111111100000000'),('calcultron2','1111111110000000'),('calcwizard','1111111111100000'),('cool_class4400','2222222222000000'),('DNAhelix','2220000000000000'),('does2Much','2222222200000000'),('eeqmcsquare','2222222222222200'),('entropyRox','2222222222200000'),('entropyRox','2222222222220000'),('fullMetal','1100000000000000'),('georgep','1111111111110000'),('georgep','1111111111111000'),('georgep','1111111111111100'),('georgep','1111111111111110'),('georgep','1111111111111111'),('ilikemoney$$', '2222222222222222'), ('ilikemoney$$','2222222222222220'),('ilikemoney$$','9000000000000000'),('imready','1111110000000000'),('isthisthekrustykrab','1110000000000000'),('isthisthekrustykrab','1111000000000000'),('isthisthekrustykrab','1111100000000000'),('notFullMetal','1000000000000000'),('programerAAL','2222222000000000'),('RitzLover28','3333333333333300'),('thePiGuy3.14','2222222220000000'),('theScienceGuy','2222222222222000');
/*!40000 ALTER TABLE `customercreditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('calcultron','123 Peachtree St','Atlanta','GA','30308','EZ theater company'),('entropyRox','200 Cool Place','San Francisco','CA','94016','4400 theater company'),('fatherAI','456 Main St','New York','NY','10001','EZ theater company'),('georgep','10 Pearl Dr','Seattle','WA','98105','4400 theater company'),('ghcghc','100 Pi St','Pallet Town','KS','31415','AI theater company'),('imbatman','800 Color Dr','Austin','TX','78653','Awesome theater company'),('manager1','123 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('manager2','456 Ferst Drive','Atlanta','GA','30332','AI theater company'),('manager3','789 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('manager4','000 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('radioactivePoRa','100 Blu St','Sunnyvale','CA','94088','4400 theater company');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('4400 The movie','2019-08-12',130),('Avengers: Endgame','2019-04-26',181),('Calculus Returns: A ML Story','2019-09-19',314),('George P Burdell\'s Life Story','1927-08-12',100),('Georgia Tech The movie','1985-08-13',100),('How to Train Your Dragon','2010-03-21',98),('Spaceballs','1987-06-24',96),('Spider-Man: Into the Spider-Verse','2018-12-01',117),('The First Pokemon movie','1998-07-19',75),('The King\'s Speech','2010-11-26',119);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('ABC theater','Awesome theater company',5,'880 Color Dr','Austin','TX','73301','imbatman'),('Cinema Star','4400 theater company',4,'100 Cool Place','San Francisco','CA','94016','entropyRox'),('Jonathan\'s movies','4400 theater company',2,'67 Pearl Dr','Seattle','WA','98101','georgep'),('Main movies','EZ theater company',3,'123 Main St','New York','NY','10001','fatherAI'),('ML movies','AI theater company',3,'314 Pi St','Pallet Town','KS','31415','ghcghc'),('Star movies','4400 theater company',5,'4400 Rocks Ave','Boulder','CA','80301','radioactivePoRa'),('Star movies','EZ theater company',2,'745 GT St','Atlanta','GA','30332','calcultron');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movieplay`
--

LOCK TABLES `movieplay` WRITE;
/*!40000 ALTER TABLE `movieplay` DISABLE KEYS */;
INSERT INTO `movieplay` VALUES ('4400 The movie','2019-08-12','2019-10-12','ABC theater','Awesome theater company'),('Georgia Tech The movie','1985-08-13','1985-08-13','ABC theater','Awesome theater company'),('The First Pokemon movie','1998-07-19','2018-07-19','ABC theater','Awesome theater company'),('4400 The movie','2019-08-12','2019-09-12','Cinema Star','4400 theater company'),('George P Burdell\'s Life Story','1927-08-12','2010-05-20','Cinema Star','4400 theater company'),('Georgia Tech The movie','1985-08-13','2019-09-30','Cinema Star','4400 theater company'),('How to Train Your Dragon','2010-03-21','2010-04-02','Cinema Star','4400 theater company'),('Spaceballs','1987-06-24','2000-02-02','Cinema Star','4400 theater company'),('The King\'s Speech','2010-11-26','2019-12-20','Cinema Star','4400 theater company'),('George P Burdell\'s Life Story','1927-08-12','2019-07-14','Main movies','EZ theater company'),('George P Burdell\'s Life Story','1927-08-12','2019-10-22','Main movies','EZ theater company'),('How to Train Your Dragon','2010-03-21','2010-03-22','Main movies','EZ theater company'),('How to Train Your Dragon','2010-03-21','2010-03-23','Main movies','EZ theater company'),('Spaceballs','1987-06-24','1999-06-24','Main movies','EZ theater company'),('The King\'s Speech','2010-11-26','2019-12-20','Main movies','EZ theater company'),('Calculus Returns: A ML Story','2019-09-19','2019-10-10','ML movies','AI theater company'),('Calculus Returns: A ML Story','2019-09-19','2019-12-30','ML movies','AI theater company'),('Spaceballs','1987-06-24','2010-04-02','ML movies','AI theater company'),('Spaceballs','1987-06-24','2023-01-23','ML movies','AI theater company'),('Spider-Man: Into the Spider-Verse','2018-12-01','2019-09-30','ML movies','AI theater company'),('4400 The movie','2019-08-12','2019-08-12','Star movies','EZ theater company'),('How to Train Your Dragon','2010-03-21','2010-03-25','Star movies','EZ theater company');
/*!40000 ALTER TABLE `movieplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customerviewmovie`
--

LOCK TABLES `customerviewmovie` WRITE;
/*!40000 ALTER TABLE `customerviewmovie` DISABLE KEYS */;
INSERT INTO `customerviewmovie` VALUES ('How to Train Your Dragon','2010-03-21','2010-03-25','Star movies','EZ theater company','1111111111111100'),('How to Train Your Dragon','2010-03-21','2010-03-22','Main movies','EZ theater company','1111111111111111'),('How to Train Your Dragon','2010-03-21','2010-03-23','Main movies','EZ theater company','1111111111111111'),('How to Train Your Dragon','2010-03-21','2010-04-02','Cinema Star','4400 theater company','1111111111111111');
/*!40000 ALTER TABLE `customerviewmovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `uservisittheater`
--

LOCK TABLES `uservisittheater` WRITE;
/*!40000 ALTER TABLE `uservisittheater` DISABLE KEYS */;
INSERT INTO `uservisittheater` VALUES ('georgep','Main movies','EZ theater company','2010-03-22',1),('calcwizard','Main movies','EZ theater company','2010-03-22',2),('calcwizard','Star movies','EZ theater company','2010-03-25',3),('imready','Star movies','EZ theater company','2010-03-25',4),('calcwizard','ML movies','AI theater company','2010-03-20',5);
/*!40000 ALTER TABLE `uservisittheater` ENABLE KEYS */;
UNLOCK TABLES;

DROP PROCEDURE IF EXISTS user_login;
DELIMITER $$
CREATE PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
	DROP TABLE IF EXISTS UserLogin;
    CREATE TABLE UserLogin(username VARCHAR(50), status VARCHAR(50), isCustomer INT, isAdmin INT, isManager INT);
		SELECT username, status FROM user WHERE username = i_username AND password = MD5(i_password);
		SELECT COUNT(*) FROM customer WHERE username in(
		SELECT username FROM user WHERE username = i_username AND password = MD5(i_password)
		);
		SELECT COUNT(*) FROM admin WHERE username in(
		SELECT username FROM user WHERE username = i_username AND password = MD5(i_password)
		);
		SELECT COUNT(*) FROM manager WHERE username in(
		SELECT username FROM user WHERE username = i_username AND password = MD5(i_password)
		);

END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS customer_only_register;
DELIMITER $$
CREATE PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
    INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO customer (username) VALUES (i_username);
END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS customer_add_creditcard;
DELIMITER $$ 
CREATE PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN 
    INSERT INTO customercreditcard (username, creditCardNum) VALUES (i_username, i_creditCardNum);
END 
$$
DELIMITER ; 

DROP PROCEDURE IF EXISTS manager_only_register;
DELIMITER $$
CREATE PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), i_comName VARCHAR(50),
    i_empStreet VARCHAR(50), i_empCity VARCHAR(50), i_empState VARCHAR(50), i_empZipcode VARCHAR(50))
BEGIN    
    INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO manager (username, comName, empStreet, empCity, empState, empZipcode) 
		VALUES (i_username, i_comName, i_empStreet, i_empCity, i_empState, i_empZipcode);
    INSERT INTO employee (username) VALUES (i_username);
END
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS manager_customer_register;
DELIMITER $$
CREATE PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), i_comName VARCHAR(50),
    i_empStreet VARCHAR(50), i_empCity VARCHAR(50), i_empState VARCHAR(50), i_empZipcode VARCHAR(50))
BEGIN    
    INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
    INSERT INTO manager (username, comName, empStreet, empCity, empState, empZipcode)
		VALUES (i_username, i_comName, i_empStreet, i_empCity, i_empState, i_empZipcode);
    INSERT INTO customer (username) VALUES (i_username);
    INSERT INTO employee (username) VALUES (i_username);
END
$$
DELIMITER ;


DROP PROCEDURE IF EXISTS manager_customer_add_creditcard;
DELIMITER $$ 
CREATE PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN 
    INSERT INTO customercreditcard (username, creditCardNum) VALUES (i_username, i_creditCardNum);
END 
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS user_register;
DELIMITER $$
CREATE PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
		INSERT INTO user (username, password, firstname, lastname) VALUES (i_username, MD5(i_password), i_firstname, i_lastname);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS user_filter_th;
DELIMITER $$
CREATE PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN
    DROP TABLE IF EXISTS UserFilterTh;
    CREATE TABLE UserFilterTh
	SELECT thName, thStreet, thCity, thState, thZipcode, comName 
    FROM Theater
    WHERE 
		(thName = i_thName OR i_thName = "ALL") AND
        (comName = i_comName OR i_comName = "ALL") AND
        (thCity = i_city OR i_city = "") AND
        (thState = i_state OR i_state = "ALL");
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS user_visit_th;
DELIMITER $$
CREATE PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
    INSERT INTO UserVisitTheater (thName, comName, visitDate, username)
    VALUES (i_thName, i_comName, i_visitDate, i_username);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS user_filter_visitHistory;
DELIMITER $$
CREATE PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN
    DROP TABLE IF EXISTS UserVisitHistory;
    CREATE TABLE UserVisitHistory
	SELECT thName, thStreet, thCity, thState, thZipcode, comName, visitDate
    FROM UserVisitTheater
		NATURAL JOIN
        theater
	WHERE
		(username = i_username) AND
        (i_minVisitDate IS NULL OR visitDate >= i_minVisitDate) AND
        (i_maxVisitDate IS NULL OR visitDate <= i_maxVisitDate);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_approve_user;
DELIMITER $$
CREATE PROCEDURE `admin_approve_user` (IN i_username VARCHAR(50))
BEGIN
	UPDATE user SET status = 'Approved' WHERE username = i_username;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_decline_user;
DELIMITER $$
CREATE PROCEDURE `admin_decline_user` (IN i_username VARCHAR(50))
BEGIN
	UPDATE user SET status = 'Declined' WHERE username = i_username;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_create_theater;
DELIMITER $$
CREATE PROCEDURE `admin_create_theater` (IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thState CHAR(2), 
IN i_thZipcode CHAR(5), IN i_capacity INT, IN i_managerUsername VARCHAR(50))
BEGIN
	INSERT INTO theater (thName, comName, capacity, thStreet, thCity, thState, thZipcode, thManagerUsername)
    VALUES (i_thName, i_comName, i_capacity, i_thStreet, i_thCity, i_thState, i_thZipcode, i_managerUsername);
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS admin_view_comDetail_th;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailTh;
    CREATE TABLE AdComDetailTh
	SELECT thName, thManagerUsername, thCity, thState, thCapacity 
    FROM theater
		NATURAL JOIN
        company
    WHERE 
		(comName = i_comName OR i_comName = "ALL");
END
$$
DELIMITER 

DROP PROCEDURE IF EXISTS admin_view_comDetail_emp;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailEmp;
    CREATE TABLE AdComDetailEmp
	SELECT firstname as empFirstname, lastname as empLastname
    FROM user
		NATURAL JOIN
        company
    WHERE 
		user.username in (select username from employee) and (company.comName = i_comName OR i_comName = "ALL");
END
$$
DELIMITER ;



DROP PROCEDURE IF EXISTS admin_create_mov;
DELIMITER $$
CREATE PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), i_movDuration INT, i_movReleas DATE)
BEGIN
		INSERT INTO movie (name, movDuration, release_date) VALUES (i_movName, i_movDuration, i_movReleas);
END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_filter_company;
DELIMITER $$
CREATE PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT, IN i_maxCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
BEGIN
    DROP TABLE IF EXISTS AdFilterCom;
    CREATE TABLE AdFilterCom
	SELECT comName, COUNT(DISTINCT thCity, thState) as numCityCover,  COUNT(DISTINCT(thName)) as numTheater, COUNT(DISTINCT(username)) as numEmployee
	FROM manager JOIN company USING(comName)
	LEFT JOIN theater USING(comName)
	WHERE i_comName = "ALL" OR i_comName = comName
	GROUP BY comName
	HAVING (numCityCover >= i_minCity or i_minCity is null) 
    AND (numCityCover<=i_maxCity or i_maxCity is null) AND 
    (numTheater >= i_minTheater or i_minTheater is null) AND 
    (numTheater <= i_maxTheater or i_maxTheater is null) AND 
    (numEmployee >= i_minEmployee or i_minEmployee is null) AND 
    (numEmployee <= i_maxEmployee or i_maxEmployee is null)
	ORDER BY 
		(CASE
			WHEN i_sortBy = "comName" AND i_sortDirection = "ASC" THEN comName
			WHEN i_sortBy = "numCityCover" AND i_sortDirection = "ASC" THEN COUNT(DISTINCT thCity, thState)
			WHEN i_sortBy = "numTheater" AND i_sortDirection = "ASC" THEN COUNT(DISTINCT(thName))
			WHEN i_sortBy = "numEmployee" AND i_sortDirection = "ASC" THEN COUNT(DISTINCT(username))
		END) ASC,
		(CASE 
			WHEN i_sortBy = "comName" THEN comName
			WHEN i_sortBy = "numCityCover" THEN COUNT(DISTINCT thCity, thState)
			WHEN i_sortBy = "numTheater" THEN COUNT(DISTINCT(thName))
			WHEN i_sortBy = "numEmployee" THEN COUNT(DISTINCT(username))
			ELSE comName
		END) DESC;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS admin_filter_user;
DELIMITER $$
CREATE PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status VARCHAR(50), IN i_sortBy VARCHAR(20), IN i_sortDirection VARCHAR(4))
BEGIN
    DROP TABLE IF EXISTS AdFilterUser;
    CREATE TABLE AdFilterUser
	SELECT username, COUNT(creditcardNum) AS creditCardCount,
	CASE 
		WHEN EXISTS(SELECT username from manager where user.username = manager.username) AND EXISTS(SELECT username from customer where user.username = customer.username) then "CustomerManager"
        WHEN EXISTS(SELECT username from admin where user.username = admin.username) AND EXISTS(SELECT username from customer where user.username = customer.username) then "CustomerAdmin"
        WHEN EXISTS(SELECT username from customer where user.username = customer.username) then "Customer"
        WHEN EXISTS(SELECT username from manager where user.username = manager.username) then "Manager"
        WHEN EXISTS(SELECT username from admin where user.username = admin.username) then "Admin"
        ELSE "User"
	END AS userType, status
	FROM user LEFT JOIN customercreditcard USING(username)
	WHERE (i_username = "" OR i_username = username) AND (i_status = "ALL" or i_status = status)
	GROUP BY username
	ORDER BY 
		(CASE
			WHEN i_sortBy = "username" AND i_sortDirection = "ASC" THEN username
			WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "ASC" THEN COUNT(creditCardNum)
			WHEN i_sortBy = "userType" AND i_sortDirection = "ASC" THEN  userType
			WHEN i_sortBy = "status" AND i_sortDirection = "ASC" THEN status
			ELSE username
		END) ASC,
		(CASE 
			WHEN i_sortBy = "username" THEN username
			WHEN i_sortBy = "creditCardCount" THEN COUNT(creditCardNum)
			WHEN i_sortBy = "userType" THEN  userType
			WHEN i_sortBy = "status" THEN status
			ELSE username
		END) DESC;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS manager_filter_th;
DELIMITER $$
CREATE PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovReleaseDate DATE, IN i_maxMovReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE, i_includeNotPlayed BOOLEAN)
BEGIN
    DROP TABLE IF EXISTS ManFilterTh;
    CREATE TABLE ManFilterTh
	SELECT movie.movName, movie.movDuration, movie.movReleaseDate, movieplay.movPlayDate
	FROM manager JOIN theater ON manager.username = theater.thManagerUsername 
    JOIN movie 
    LEFT JOIN movieplay ON movieplay.thName = theater.thName AND movieplay.comName = theater.comName AND movie.movName = movieplay.movName AND movie.movReleaseDate = movieplay.movReleaseDate
	WHERE manager.username = i_manUsername 
    AND movie.movName  = i_movName
    AND (movDuration >= i_minMovDuration or i_minMovDuration is null AND movDuration <= i_maxMovDuration or i_maxMovDuration is null) 
    AND (movie.movReleaseDate >= i_minMovReleaseDate or i_minMovReleaseDate is null AND movie.movReleaseDate <= i_maxMovReleaseDate or i_maxMovReleaseDate is null) 
    AND (movPlayDate IS NULL OR (movPlayDate >= i_minMovPlayDate or i_minMovPlayDate is null AND movPlayDate <= i_maxMovPlayDate or i_maxMovPlayDate is null)) 
    AND (NOT i_includeNotPlayed OR movPlayDate IS NOT NULL);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS manager_schedule_mov;
DELIMITER $$
CREATE PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE)
BEGIN
	INSERT INTO MoviePlay (thName, comName, movName, movReleaseDate, movPlayDate)
		SELECT thName, comName, i_movName, i_movReleaseDate, i_movPlayDate
		FROM manager JOIN theater ON username = thManagerUsername
		WHERE username = i_manUsername;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS customer_filter_mov;
DELIMITER $$
CREATE PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(50), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN
    DROP TABLE IF EXISTS CosFilterMovie;
    CREATE TABLE CosFilterMovie
	SELECT movName, thName, thStreet, thCity, thState, thZipcode, theater.comName, movPlayDate, movReleaseDate
	FROM movieplay join theater using(thName)
	WHERE (i_movName = movName) AND (i_comName = comname) AND (i_city = thCity OR i_city = "") AND (i_state = thState) AND (movPlayDate >= i_minMovPlayDate) AND (movPlayDate <= i_maxMovPlayDate);
END$$
DELIMITER ;
