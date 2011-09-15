INSERT INTO ADMIN_USER (ADMIN_USER_ID,ADMIN_USER_REAL_NAME,ADMIN_USER_NAME,ADMIN_MOBILE_PHONE,
						ADMIN_USER_REMARK,ADMIN_USER_PASSWORD,ADMIN_REGISTER_DATE)
VALUES(1,'关琛','xxg2guan','13564793256','超级超级管理员',MD5('guan0078'),now());
INSERT INTO ADMIN_USER (ADMIN_USER_ID,ADMIN_USER_REAL_NAME,ADMIN_USER_NAME,ADMIN_MOBILE_PHONE,
						ADMIN_USER_REMARK,ADMIN_USER_PASSWORD,ADMIN_REGISTER_DATE)
VALUES(2,'丁宜人','123456','15064793256','超级超级管理员',MD5('123456'),now());
INSERT INTO ADMIN_USER (ADMIN_USER_ID,ADMIN_USER_REAL_NAME,ADMIN_USER_NAME,ADMIN_MOBILE_PHONE,
						ADMIN_USER_REMARK,ADMIN_USER_PASSWORD,ADMIN_REGISTER_DATE)
VALUES(3,'应为','yingwei','15164793256','超级超级管理员',MD5('123456'),now());


INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(1,'公共信息平台','',0,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(2,'文件管理','',0,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(3,'工程项目管理','',0,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(4,'人力资源管理','',0,1,4);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(5,'系统管理','',0,1,5);


/*INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(10,'营业执照','../publicInfo/businessLicense.jsp',1,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(11,'税务登记执照','../publicInfo/taxLicense.jsp',1,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(12,'ISO文件查询','../publicInfo/queryIsoFile.jsp',1,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(13,'典型工程查询','../publicInfo/queryHistoryProject.jsp',1,1,4);

INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(20,'文件上传','../businessFile/uploadBusinessFile.jsp',2,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(21,'文件查询','../businessFile/queryBusinessFile.jsp',2,1,2);

INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(30,'录入项目','../projectManage/addProject.jsp',3,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(31,'查询项目','../projectManage/queryProject.jsp',3,1,2);

INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(40,'新增员工','../employeeManage/newUserInfo.do',4,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(41,'查询员工','../employeeManage/listUserInfo.do',4,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(42,'新增职务','../employeeManage/addRole.jsp',4,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(43,'查询职务','../employeeManage/listRole.do',4,1,4);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(44,'新增部门','../department/addDepartment.jsp',4,1,5);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(45,'查询部门','../department/queryDepartment.jsp',4,1,6);

INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(51,'ISO文件上传','../systemManage/uploadIsoFile.jsp',5,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(52,'发布通知','../systemManage/publishMessage.jsp',5,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(53,'日志查询','../systemManage/queryLog.jsp',5,1,3);*/