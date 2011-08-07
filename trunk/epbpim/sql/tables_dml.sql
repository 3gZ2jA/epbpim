INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(1,'公共信息平台','',0,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(2,'营业执照','../publicInfo/businessLicense.jsp',1,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(3,'税务登记执照','../publicInfo/taxLicense.jsp',1,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(4,'ISO文件查询','../publicInfo/isoFileQuery.jsp',1,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(5,'典型工程查询','../publicInfo/historyProject.jsp',1,1,4);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(6,'ISO文件上传','../publicInfo/isoFileUpload.jsp',1,1,5);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(7,'发布通知','../publicInfo/messagePublish.jsp',1,1,6);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(8,'业务文件管理','',0,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(9,'文件上传','../businessFile/businessFileUpload.jsp',8,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(10,'业务文件查询','../businessFile/businessFileManage.jsp',8,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(11,'人力资源管理','',0,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(12,'新增员工','../employeeManage/addEmployee.jsp',11,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(13,'员工查询','../employeeManage/employeeQuery.jsp',11,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(14,'新增角色','../employeeManage/addRole.jsp',11,1,3);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(15,'角色查询','../employeeManage/roleQuery.jsp',11,1,4);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(16,'工程项目管理','',0,1,4);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(17,'项目录入','../projectManage/addProject.jsp',16,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(18,'项目查询','../projectManage/projectManage.jsp',16,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(19,'总经理文件管理','',0,1,5);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(20,'文件上传','../managerFile/managerFileUpload.jsp',19,1,1);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(21,'文件查询','../managerFile/managerFileManage.jsp',19,1,2);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(22,'日志管理','',0,1,6);
INSERT INTO ADMIN_MENU (MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU_ID,MENU_ENABLE,MENU_INDEX)
VALUES(23,'日志查询','../logManage/logQuery.jsp',22,1,1);