DROP TABLE IF EXISTS ADMIN_LOG;
DROP TABLE IF EXISTS USER_INFO;
DROP TABLE IF EXISTS ROLE_MENU_RESTRACTION;
DROP TABLE IF EXISTS ADMIN_MENU;
DROP TABLE IF EXISTS USER_TITLE;
DROP TABLE IF EXISTS USER_CERTIFICATION;
DROP TABLE IF EXISTS ADMIN_ROLE;
DROP TABLE IF EXISTS ADMIN_DEPT;

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
  LOG_TIME        TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',      
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
	CERTIFICATION_TYPE_ID INT(5) NOT NULL,    -- 放CertificationTypeEnum的key
	CERTIFICATION_IDENTIFY VARCHAR(30),        -- 证书编号
	EXPIRE_DATE TIMESTAMP DEFAULT '0000-00-00 00:00:00',  -- 有效期
	PRIMARY KEY (CERTIFICATION_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;

-- 员工表
CREATE TABLE USER_INFO 
(
	USER_ID BIGINT(15) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_REAL_NAME VARCHAR(50) NOT NULL,         -- 真实姓名
	USER_IDENTIFIER VARCHAR(30),     	 		 -- 编号
	USER_NAME VARCHAR(50) NOT NULL,  			 -- 用户名
	USER_SEX INT(1) NOT NULL,					 -- 性别
	USER_IDCARD VARCHAR(20) NOT NULL,			 -- 身份证
	HUMEN_FILES VARCHAR(50),					 -- 人事档案
	USER_BIRTHDAY TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',  -- 生日
	FAMILY_ADDRESS VARCHAR(100),				 -- 家庭住址
	PHONE  VARCHAR(50),							 -- 电话
	MOBILE_PHONE VARCHAR(50),					 -- 手机
	PARTY VARCHAR(20),							 -- 党派
	EDU_BACKGROUND VARCHAR(20),					 -- 学历
	SCHOOL VARCHAR(50),							 -- 学校名称
	MAJOR VARCHAR(50),							 -- 专业
	EDU_COUNTINU TINYINT(1), 					 -- 继续教育情况
	GRADUATE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	-- 毕业日期
	ONBOARD_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	-- 入职日期
	LEAVE_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',	-- 离职日期
	USER_RELATION VARCHAR(50),										-- 关联人
	USER_STATUS int(1),					 		 -- 状态。UserStatusEnum里的key 
	INSURANCE_TYPE VARCHAR(10),					 -- 保险类型
	USER_REMARK VARCHAR(255),					 -- 备注
	USER_PASSWORD VARCHAR(200) NOT NULL,		 -- 密码
	REGISTER_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', -- 注册时间
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
	FILE_TYPE VARCHAR(2),
	FILE_CONTENT TEXT(2097152) NOT NULL,	
	UPLOAD_DATE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (FILE_ID)
) ENGINE=MyISAM DEFAULT CHARSET = UTF8;
