SET FOREIGN_KEY_CHECKS=0;
DROP table IF EXISTS ORDERS CASCADE;
CREATE TABLE ORDERS (
	ID int PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STATUS varchar(128) NOT NULL,
	REGISTRATION_DATE date NOT NULL,
    TOTAL_COST double NOT NULL,
    ORDER_NUMBER varchar(48) NOT NULL,
    MECHANIC int NOT NULL,
    FOREIGN KEY (MECHANIC) REFERENCES MECHANICS(ID),
    CLIENT int,
    FOREIGN KEY(CLIENT) REFERENCES CLIENTS(ID)
);

DROP TABLE IF EXISTS MECHANICS;
CREATE TABLE MECHANICS (
	ID int NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FIRST_NAME varchar(48) NOT NULL,
    LAST_NAME varchar (48) NOT NULL,
    EMAIL varchar(48) NOT NULL,
    PHONE_NO varchar(48) NOT NULL,
    SALARY double NOT NULL
);

DROP TABLE IF EXISTS CARS;
CREATE TABLE CARS (
	ID int PRIMARY KEY UNIQUE AUTO_INCREMENT,
    BRAND varchar(48) NOT NULL,
    MODEL varchar(48) NOT NULL,
    REGISTRATION varchar(48) NOT NULL,
    ENGINE_TYPE varchar(48) NOT NULL,
    PRODUCTION_YEAR int NOT NULL,
    ORDER_ID int,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
);

DROP TABLE IF EXISTS SERVICES;
CREATE TABLE SERVICES (
	ID int PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME varchar(48) NOT NULL,
    COST double NOT NULL,
    ORDER_ID int,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
);

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
	ID int NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FIRST_NAME varchar(48) NOT NULL,
    LAST_NAME varchar(48) NOT NULL,
    EMAIL varchar(48) NOT NULL,
    PASSWORD varchar(48) NOT NULL,
    PHONE_NUMBER varchar(48) NOT NULL,
    AUTHORITY varchar(48) NOT NULL,
    ENABLED tinyint(1) NOT NULL
    
);

DROP TABLE IF EXISTS AUTHORITIES; 
CREATE TABLE AUTHORITIES (
	ID int NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    AUTHORITY varchar(48) NOT NULL
);

DROP TABLE IF EXISTS CLIENTS;
CREATE TABLE CLIENTS (
	ID int NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FIRST_NAME varchar(48) NOT NULL,
    LAST_NAME varchar(48) NOT NULL,
    EMAIL varchar(48) NOT NULL,
    PHONE varchar(48) NOT NULL,
    ORDER_ID int,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
);
	
    
	
    