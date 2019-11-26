DROP DATABASE IF EXISTS Team13;
CREATE DATABASE Team13;
USE Team13;
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
capacity INT NOT NULL,
thStreet VARCHAR(50) NOT NULL,
thCity VARCHAR(50) NOT NULL,
thState VARCHAR(3) NOT NULL,
thZipcode CHAR(5) NOT NULL,
manusername VARCHAR(50) NOT NULL,
PRIMARY KEY (thName, comName),
FOREIGN KEY (comName) REFERENCES company(comName),
FOREIGN KEY (manusername) REFERENCES manager(username)
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
duration INT NOT NULL,
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
INSERT INTO `customer` VALUES ('calcultron2'),('calcwizard'),('clarinetbeast'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('fullMetal'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customercreditcard`
--

LOCK TABLES `customercreditcard` WRITE;
/*!40000 ALTER TABLE `customercreditcard` DISABLE KEYS */;
INSERT INTO `customercreditcard` VALUES ('calcultron','1111111111000000'),('calcultron2','1111111100000000'),('calcultron2','1111111110000000'),('calcwizard','1111111111100000'),('cool_class4400','2222222222000000'),('DNAhelix','2220000000000000'),('does2Much','2222222200000000'),('eeqmcsquare','2222222222222200'),('entropyRox','2222222222200000'),('entropyRox','2222222222220000'),('fullMetal','1100000000000000'),('georgep','1111111111110000'),('georgep','1111111111111000'),('georgep','1111111111111100'),('georgep','1111111111111110'),('georgep','1111111111111111'),('ilikemoney$$','2222222222222220'),('ilikemoney$$','9000000000000000'),('imready','1111110000000000'),('isthisthekrustykrab','1110000000000000'),('isthisthekrustykrab','1111000000000000'),('isthisthekrustykrab','1111100000000000'),('notFullMetal','1000000000000000'),('programerAAL','2222222000000000'),('RitzLover28','3333333333333300'),('thePiGuy3.14','2222222220000000'),('theScienceGuy','2222222222222000');
/*!40000 ALTER TABLE `customercreditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('calcultron','123 Peachtree St','Atlanta','GA','30308','EZ theater company'),('cool_class4400',NULL,NULL,NULL,NULL,NULL),('entropyRox','200 Cool Place','San Francisco','CA','94016','4400 theater company'),('fatherAI','456 Main St','New York','NY','10001','EZ theater company'),('georgep','10 Pearl Dr','Seattle','WA','98105','4400 theater company'),('ghcghc','100 Pi St','Pallet Town','KS','31415','AI theater company'),('imbatman','800 Color Dr','Austin','TX','78653','Awesome theater company'),('manager1','123 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('manager2','456 Ferst Drive','Atlanta','GA','30332','AI theater company'),('manager3','789 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('manager4','000 Ferst Drive','Atlanta','GA','30332','4400 theater company'),('radioactivePoRa','100 Blu St','Sunnyvale','CA','94088','4400 theater company');
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

