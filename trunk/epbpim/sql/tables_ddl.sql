DROP TABLE IF EXISTS ADMIN_LOG;
DROP TABLE IF EXISTS USER_INFO;
DROP TABLE IF EXISTS ROLE_MENU_RESTRACTION;
DROP TABLE IF EXISTS ROLE_USER_RESTRACTION;
DROP TABLE IF EXISTS DEPT_USER_RESTRACTION;
DROP TABLE IF EXISTS ADMIN_MENU;
DROP TABLE IF EXISTS USER_TITLE;
DROP TABLE IF EXISTS USER_CERTIFICATION;
DROP TABLE IF EXISTS ADMIN_ROLE;
DROP TABLE IF EXISTS ADMIN_DEPT;
DROP TABLE IF EXISTS ADMIN_FILE;
DROP TABLE IF EXISTS PROJECT_INFO;

-- 菜单表。显示菜单
CREATE TABLE ADMIN_MENU (
  MENU_ID INT(5) NOT NULL,
  MENU_NAME varchar(100) NOT NULL default '',
  MENU_URL varchar(255) NOT NULL default '',
  PARENT_MENU_ID INT(5) NOT NULL default '0',
  MENU_ENABLE tinyint(1) NOT NULL default '1',
  MENU_INDEX INT(5),
  PRIMARY KEY  (MENU_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 日志表。记录用户在系统中的操作
CREATE TABLE ADMIN_LOG (
  LOG_ID BIGINT(15) NOT NULL AUTO_INCREMENT,
  USER_NAME VARCHAR(50) NOT NULL,               
  ACTION_TYPE     INT(15) NOT NULL default '0',        
  USER_IP         varchar(15),        
  LOG_TIME        TIMESTAMP DEFAULT '0000-00-00 00:00:00',      
  MODULE_ID       INT(11) NOT NULL default '0',        
  LOG_REMARK      varchar(100) default NULL,          
  PRIMARY KEY (LOG_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 角色表。也叫行政职务表
CREATE TABLE ADMIN_ROLE (
  ROLE_ID BIGINT(15) NOT NULL AUTO_INCREMENT,
  ROLE_NAME varchar(100) NOT NULL,
  ROLE_COUNT tinyint(1) NOT NULL default '0',
  ROLE_REMARK varchar(255),
  PRIMARY KEY (ROLE_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

-- 菜单角色中间表
CREATE TABLE ROLE_MENU_RESTRACTION (
  ROLE_ID BIGINT(15),
  MENU_ID BIGINT(15), 
  CONSTRAINT ADMIN_ROLE_FK1 FOREIGN KEY (ROLE_ID) REFERENCES ADMIN_ROLE(ROLE_ID),
  CONSTRAINT ADMIN_MENU_FK1 FOREIGN KEY (MENU_ID) REFERENCES ADMIN_MENU(MENU_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

-- 部门表
CREATE TABLE ADMIN_DEPT (
	DEPT_ID INT(5) NOT NULL AUTO_INCREMENT,
	DEPT_NAME VARCHAR(50) NOT NULL,
	DEPT_REMARK varchar(255),
	PRIMARY KEY (DEPT_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 执业资格表
CREATE TABLE USER_CERTIFICATION (
	CERTIFICATION_ID INT(15) NOT NULL AUTO_INCREMENT,
	CERTIFICATION_TYPE_ID INT(5),    -- 放CertificationTypeEnum的key
	CERTIFICATION_IDENTIFY VARCHAR(30),        -- 证书编号
	EXPIRE_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',  -- 有效期
	REMARK VARCHAR(255),
	USER_ID BIGINT(15),
	PRIMARY KEY (CERTIFICATION_ID),
	CONSTRAINT USER_CERTIFICATION_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_INFO(USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 员工表
CREATE TABLE USER_INFO 
(
	USER_ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_REAL_NAME VARCHAR(50),         -- 真实姓名
	USER_IDENTIFIER VARCHAR(30),     	 		 -- 编号
	USER_NAME VARCHAR(50) NOT NULL,  			 -- 用户名
	USER_SEX INT(1) DEFAULT 0,					 -- 性别
	USER_IDCARD VARCHAR(20),			 -- 身份证
	HUMEN_FILES VARCHAR(50),					 -- 人事档案
	USER_BIRTHDAY DATETIME,  -- 生日
	FAMILY_ADDRESS VARCHAR(100),				 -- 家庭住址
	PHONE  VARCHAR(50),							 -- 电话
	MOBILE_PHONE VARCHAR(50),					 -- 手机
	PARTY VARCHAR(20),							 -- 党派
	EDU_BACKGROUND INT(5),					 	 -- 学历
	SCHOOL VARCHAR(50),							 -- 学校名称
	MAJOR VARCHAR(50),							 -- 专业
	EDU_COUNTINU TINYINT(1), 					 -- 继续教育情况
	GRADUATE_DATE DATETIME,	-- 毕业日期
	ONBOARD_DATE DATETIME,	-- 入职日期
	LEAVE_DATE DATETIME,	-- 离职日期
	USER_RELATION VARCHAR(50),										-- 关联人
	USER_STATUS INT(1),					 		 -- 状态。UserStatusEnum里的key 
	INSURANCE_TYPE INT(10),					 -- 保险类型
	USER_REMARK VARCHAR(255),					 -- 备注
	USER_PASSWORD VARCHAR(200) DEFAULT '123456',		 -- 密码
	REGISTER_DATE DATETIME, -- 注册时间
	EMAIL  VARCHAR(100), 								   
	ROLE_ID INTEGER(15),						 -- 职务
	DEPT_ID INT(10),							 -- 所属部门
	CERTIFICATION_ID INT(15),					 -- 关联执业资质信息表
	USER_TITLE INT(10),					 		 -- 职称
	CONSTRAINT ADMIN_DEPT_FK1 FOREIGN KEY (DEPT_ID) REFERENCES ADMIN_DEPT(DEPT_ID),
	CONSTRAINT ADMIN_ROLE_FK2 FOREIGN KEY (ROLE_ID) REFERENCES ADMIN_ROLE(ROLE_ID),
	CONSTRAINT USER_CERTIFICATION_FK1 FOREIGN KEY (CERTIFICATION_ID) REFERENCES USER_CERTIFICATION(CERTIFICATION_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

CREATE TABLE ADMIN_FILE (
	FILE_ID BIGINT(15) NOT NULL AUTO_INCREMENT,
	FILE_MODULE VARCHAR(2) NOT NULL,
	FILE_NAME VARCHAR(50) NOT NULL,
	FILE_PATH VARCHAR(100) NOT NULL,
	FILE_TYPE VARCHAR(50),
	FILE_CONTENT TEXT(2097152),	
	UPLOAD_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (FILE_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 用户角色中间表
CREATE TABLE ROLE_USER_RESTRACTION (
  ROLE_ID BIGINT(15),
  USER_ID BIGINT(15), 
  CONSTRAINT ADMIN_ROLE_FK2 FOREIGN KEY (ROLE_ID) REFERENCES ADMIN_ROLE(ROLE_ID),
  CONSTRAINT ADMIN_USER_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_INFO(USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

-- 用户部门中间表
CREATE TABLE DEPT_USER_RESTRACTION (
  DEPT_ID INT(15),
  USER_ID BIGINT(15), 
  CONSTRAINT ADMIN_DEPT_FK2 FOREIGN KEY (DEPT_ID) REFERENCES ADMIN_DEPT(DEPT_ID),
  CONSTRAINT ADMIN_USER_FK2 FOREIGN KEY (USER_ID) REFERENCES USER_INFO(USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

-- 工程表
CREATE TABLE PROJECT_INFO 
(
	PROJECT_ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PROJECT_NAME VARCHAR(255) NOT NULL,
	NUMBER VARCHAR(30),
	MAJOR_TYPE VARCHAR(30),
	VALUATION_TYPE VARCHAR(30),
	START_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',
	QUALITY VARCHAR(50) NOT NULL,
	CUSTOMER_COMPANY VARCHAR(255),
	CUSTOMER_CONTACTOR VARCHAR(255),
	CUSTOMER_CONTACT VARCHAR(30),
	MEDIATOR_COMPANY VARCHAR(255),
	MEDIATOR_CONTACTOR VARCHAR(255),
	MEDIATOR_CONTACT VARCHAR(30),
	VENDOR_COMPANY VARCHAR(255),
	VENDOR_CONTACTOR VARCHAR(255),
	VENDOR_CONTACT VARCHAR(30),
	BIDDING_COMPANY VARCHAR(255),
	BIDDING_CONTACTOR VARCHAR(255),
	BIDDING_CONTACT VARCHAR(30),
	DEPT BIGINT(15),
	DEPT_TRANSFER_NUMBER VARCHAR(30),
	OWNER BIGINT(15) ,
	PROJECT_TYPE VARCHAR(30),
	JUDGE_PRICE1 VARCHAR(30),
	JUDGE_PRICE2 VARCHAR(30),
	JUDGE_DAYS VARCHAR(30),
	REPORT_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',
	PLUS_PRICE VARCHAR(30),
	MINUS_PRICE VARCHAR(30),
	COMMENTS VARCHAR(255),
	ACHIVE_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',
	REPORT_NUMBER VARCHAR(30),
	MASTER_JUDGE_COMMENTS VARCHAR(255),
	ACHIVE_RECEIVER VARCHAR(30),
	CONTRACT_NUMBER VARCHAR(30),
	CONTRACT_MONEY VARCHAR(50),
	CONTRACT_ABSTRACT VARCHAR(50),
	INVOICE_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',
	INVOICE_NUMBER VARCHAR(50),
	INVOICE_PRICE VARCHAR(50),
	STATUS VARCHAR(2),
	SUBMITTER BIGINT(15),	
	CONSTRAINT ADMIN_DEPT_FK3 FOREIGN KEY (DEPT) REFERENCES ADMIN_DEPT(DEPT_ID),
	CONSTRAINT ADMIN_USER_FK3 FOREIGN KEY (OWNER) REFERENCES USER_INFO(USER_ID),
	CONSTRAINT ADMIN_USER_FK4 FOREIGN KEY (SUBMITTER) REFERENCES USER_INFO(USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;

-- 用户部门中间表
CREATE TABLE PROJECT_STREAM (
  ID INT(15),
  PROJECT_ID BIGINT(15), 
  STREAM_SUBMITTER BIGINT(15),	
  STREAM_TYPE INT(2),
  MONEY NUMERIC(14,2),
  COMMENTS VARCHAR(200),
  CONSTRAINT PROJECT_STREAM_FK1 FOREIGN KEY (PROJECT_ID) REFERENCES PROJECT_INFO(PROJECT_ID),
  CONSTRAINT PROJECT_STREAM_FK2 FOREIGN KEY (STREAM_SUBMITTER) REFERENCES USER_INFO(USER_ID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;
