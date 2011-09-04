DROP DATABASE IF EXISTS BPIM;
CREATE DATABASE BPIM DEFAULT CHARACTER SET utf8;
grant all privileges on *.* to cguan@'%' identified by 'cguan';
grant all privileges on *.* to yding@'%' identified by 'yding';
USE BPIM;
DROP TABLE IF EXISTS USER_PROJECT_DATA;
DROP TABLE IF EXISTS USER_GROUP_RESTRICTION;
DROP TABLE IF EXISTS USER_GROUP;
DROP TABLE IF EXISTS EXPENSE_RECORD;
DROP TABLE IF EXISTS USER_MESSAGE;
DROP TABLE IF EXISTS GOVERNMENT_GUIDE_DATA;
DROP TABLE IF EXISTS USER_CUSTOM_DATA;
DROP TABLE IF EXISTS USER_INFO;
DROP TABLE IF EXISTS SERVICE_PLAN;
DROP TABLE IF EXISTS GOVERNMENT_QUOTA_RECORD;
DROP TABLE IF EXISTS GOVERNMENT_QUOTA;
DROP TABLE IF EXISTS NEWS_ANNOUNCEMENT;
DROP TABLE IF EXISTS GOVERNMENT_FILE;
DROP TABLE IF EXISTS GOVERNMENT_INVENTORY;
DROP TABLE IF EXISTS USER_ADVINCE;


CREATE TABLE NEWS_ANNOUNCEMENT
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	NEWS_TITLE VARCHAR(100) NOT NULL,
	NEWS_CONTENT VARCHAR(800) NOT NULL, 
	ADD_TIME TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
)DEFAULT CHARSET = UTF8;

CREATE TABLE SERVICE_PLAN
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	SERVICE_NAME VARCHAR(200) NOT NULL, 
	MONEY NUMERIC(10,2) NOT NULL, 
	PAY_DATE NUMERIC(4) NOT NULL,
	REMARK  VARCHAR(400)
)DEFAULT CHARSET= UTF8;

CREATE TABLE USER_INFO 
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_NAME VARCHAR(50) NOT NULL,                        
	USER_PASSWORD VARCHAR(200) NOT NULL,                  
	REGISTER_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', 
	EXPIRE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', 								   
	EMAIL  VARCHAR(100), 								   
	COMPANY VARCHAR(100),								   
	PHONE  VARCHAR(50),									   
	LAST_PAY_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',			
	QUESTION VARCHAR(200),								   
	ANSWER VARCHAR(200), 
	SERVICE_PLAN_ID BIGINT(15), 
	CONSTRAINT USER_INFO_FK1 FOREIGN KEY (SERVICE_PLAN_ID) REFERENCES SERVICE_PLAN (ID)
)DEFAULT CHARSET=UTF8;



CREATE TABLE USER_MESSAGE 
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	RECEIVER_ID NUMERIC(10) NOT NULL, 
	SENDER_ID NUMERIC(10) NOT NULL, 
	MESSAGE_CONTENT VARCHAR(400) NOT NULL, 
	READED BOOLEAN NOT NULL, 
	USER_INFO_ID BIGINT NOT NULL,
	SENDER_NAME VARCHAR(10)NOT NULL,
	SEND_TIME TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', 
	CONSTRAINT USER_MESSAGE_FK1 FOREIGN KEY (USER_INFO_ID) REFERENCES USER_INFO (ID)
)DEFAULT CHARSET=UTF8;

CREATE TABLE USER_GROUP
( 
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	GROUP_NAME VARCHAR(200) NOT NULL, 
	GROUP_LEADER_ID NUMERIC(15) NOT NULL, 
	GROUP_DESCRIPTION VARCHAR(400)
)DEFAULT CHARSET= UTF8;

CREATE TABLE USER_GROUP_RESTRICTION
(
	USER_INFO_ID BIGINT(15) NOT NULL, 
	USER_GROUP_ID BIGINT(15) NOT NULL,
	CONSTRAINT USER_GROUP_RESTRICTION_FK1 FOREIGN KEY (USER_INFO_ID) REFERENCES USER_INFO (ID),
	CONSTRAINT USER_GROUP_RESTRICTION_FK2 FOREIGN KEY (USER_GROUP_ID) REFERENCES USER_GROUP (ID)
)DEFAULT CHARSET= UTF8;

CREATE TABLE EXPENSE_RECORD
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_INFO_ID BIGINT(15) NOT NULL, 
	MONEY NUMERIC(10,2) NOT NULL, 
	PAY_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', 
	EXPIRE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	CONSTRAINT EXPENSE_RECORD_FK1 FOREIGN KEY (USER_INFO_ID) REFERENCES USER_INFO (ID)
)DEFAULT CHARSET= UTF8;


CREATE TABLE USER_PROJECT_DATA 
(
	
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	DATA_TYPE VARCHAR(10) NOT NULL,
	AREA VARCHAR(10) NOT NULL, 
	PROJECT_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	USER_INFO_ID BIGINT(15) NOT NULL, 
	PROJECT_NAME VARCHAR(50)NOT NULL,
	PROJECT_SUB_NAME VARCHAR(50) NOT NULL,
	GOVERNMENT_QUOTA_NUM VARCHAR(30) NOT NULL,
	GOVERNMENT_QUOTA_NAME VARCHAR(100) NOT NULL,
	GOVERNMENT_QUOTA_TYPE VARCHAR(5) NOT NULL,
	GOVERNMENT_QUOTA_UNIT VARCHAR(10),
	GOVERNMENT_QUOTA_PRICE NUMERIC(18,5),
	GOVERNMENT_QUOTA_GROSS NUMERIC(18,5) NOT NULL,
	GOVERNMENT_QUOTA_TOTAL_PRICE NUMERIC(18,5) NOT NULL,
	RECORD_NAME VARCHAR(100) NOT NULL,
	RECORD_NUM VARCHAR(30) NOT NULL,
	RECORD_TYPE VARCHAR(5),
	RECORD_UNIT VARCHAR(10),
	RECORD_PRICE NUMERIC(18,5),
	RECORD_TOTAL_GROSS NUMERIC(18,5),
	RECORD_TOTAL_PRICE NUMERIC(15,2),
	RECORD_IMPORT_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	RECORD_MODIFY_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	CONSTRAINT USER_PROJECT_DATA_FK1 FOREIGN KEY (USER_INFO_ID) REFERENCES USER_INFO (ID)
)DEFAULT CHARSET=UTF8;

CREATE TABLE USER_CUSTOM_DATA 
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	AREA VARCHAR(10) NOT NULL, 
	USER_INFO_ID BIGINT(15) NOT NULL,
	RECORD_NAME VARCHAR(50) NOT NULL,
	RECORD_NUM VARCHAR(30) NOT NULL,
	RECORD_MODEL VARCHAR(10),
	RECORD_TYPE VARCHAR(5),
	RECORD_UNIT VARCHAR(10),
	RECORD_PRICE NUMERIC(18,5),
	RECORD_GROSS NUMERIC(18,5),
	RECORD_TOTAL_PRICE NUMERIC(18,5),
	RECORD_PERCENT NUMERIC(7,5),
	RECORD_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	RECORD_IMPORT_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	RECORD_MODIFY_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	CONSTRAINT USER_CUSTOM_DATA_FK1 FOREIGN KEY (USER_INFO_ID) REFERENCES USER_INFO (ID)
)DEFAULT CHARSET=UTF8;


CREATE TABLE GOVERNMENT_GUIDE_DATA 
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	AREA VARCHAR(10) NOT NULL, 
	USER_INFO_ID BIGINT(15) NOT NULL, 
	GOVERNMENT_QUOTA_CLASS VARCHAR(10) NOT NULL,
	RECORD_NAME VARCHAR(50) NOT NULL,
	RECORD_NUM VARCHAR(30),
	RECORD_MODEL VARCHAR(10),
	RECORD_TYPE VARCHAR(5),
	RECORD_UNIT VARCHAR(10),
	RECORD_PRICE NUMERIC(18,5),
	RECORD_GROSS NUMERIC(18,5),
	RECORD_TOTAL_PRICE NUMERIC(18,5),
	RECORD_PERCENT NUMERIC(7,5),
	RECORD_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	RECORD_IMPORT_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	RECORD_MODIFY_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
)DEFAULT CHARSET=UTF8;

CREATE TABLE GOVERNMENT_QUOTA
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	AREA VARCHAR(10) NOT NULL, 
	GOVERNMENT_QUOTA_CLASS VARCHAR(30) NOT NULL,
	GOVERNMENT_QUOTA_NUM VARCHAR(50) NOT NULL,
	GOVERNMENT_QUOTA_NAME VARCHAR(100) NOT NULL,
	GOVERNMENT_QUOTA_MODEL VARCHAR(50) ,
	GOVERNMENT_QUOTA_TYPE VARCHAR(50) ,
	GOVERNMENT_QUOTA_UNIT VARCHAR(100) ,
	GOVERNMENT_QUOTA_AMOUNT NUMERIC(18,7),
	GOVERNMENT_QUOTA_TOTAL_PRICE NUMERIC(18,2),
	GOVERNMENT_QUOTA_DESC VARCHAR(1000)
)DEFAULT CHARSET=UTF8;

CREATE TABLE GOVERNMENT_QUOTA_RECORD
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	GOVERNMENT_QUOTA_ID BIGINT(15) NOT NULL,
	RECORD_NAME VARCHAR(50) NOT NULL,
	RECORD_NUM VARCHAR(50) NOT NULL,
	RECORD_MODEL VARCHAR(50),
	RECORD_TYPE VARCHAR(5),
	RECORD_UNIT VARCHAR(10),
	RECORD_PRICE NUMERIC(18,2),
	RECORD_AMOUNT NUMERIC(18,7) NOT NULL,
	RECORD_TOTAL_PRICE NUMERIC(18,2),
	CONSTRAINT GOVERNMENT_QUOTA_RECORD_FK1 FOREIGN KEY (GOVERNMENT_QUOTA_ID) REFERENCES GOVERNMENT_QUOTA (ID)
)DEFAULT CHARSET=UTF8;

CREATE TABLE GOVERNMENT_FILE
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	FILE_TITLE VARCHAR(300),
	FILE_TYPE VARCHAR(10),
	FILE_SUB_TYPE VARCHAR(10),
	AREA VARCHAR(10),
	SOURCE_CODE MEDIUMTEXT,
	FILE_PUBLISH_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	FILE_EFFECTIVE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	EFFECTIVE BOOLEAN
)DEFAULT CHARSET=UTF8;

CREATE TABLE GOVERNMENT_INVENTORY
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	GOVERNMENT_INVENTORY_TYPE VARCHAR(10),
	PROJECT_CLASS_LEVEL_1_NUM VARCHAR(20),
	PROJECT_CLASS_LEVEL_2_NUM VARCHAR(20),
	PROJECT_NUM VARCHAR(20),
	PROJECT_NAME VARCHAR(40),
	PROJECT_NAME_FEATURE VARCHAR(300),
	UNIT VARCHAR(10),
	AMOUNT NUMERIC(8,2),
	DETAIL VARCHAR(200),
	COMMENTS VARCHAR(100)
)DEFAULT CHARSET=UTF8;

CREATE TABLE USER_ADVINCE
(
	ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_ID BIGINT(15),	
	ADVICE_CONTENT VARCHAR(1000),
	ADVICE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00'
)DEFAULT CHARSET=UTF8;