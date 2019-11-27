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
        Theater
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
	INSERT INTO theater (thName, comName, capacity, thStreet, thCity, thState, thZipcode, manUsername)
    VALUES (i_thName, i_comName, i_capacity, i_thStreet, i_thCity, i_thState, i_thZipcode, i_managerUsername);
END$$
DELIMITER ;

