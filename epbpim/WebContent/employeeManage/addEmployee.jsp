<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ryxx.bpim.user.enums.EduBackgroundEnum"%>
<%@ page import="com.ryxx.bpim.user.enums.UserTitleEnum"%>
<%@ page import="com.ryxx.bpim.user.enums.UserStatusEnum"%>
<%@ page import="com.ryxx.bpim.user.enums.InsuranceTypeEnum"%>
<%@ page import="com.ryxx.bpim.user.enums.CertificationTypeEnum"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>新增员工</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/delgadoTabs.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet"
	href="../js/My97DatePicker/skin/default/datepicker.css" type="text/css"></link>
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
<script type='text/javascript' src='../js/My97DatePicker/WdatePicker.js'></script>
<script type='text/javascript' src='../js/common.js'></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/delgado.pack.js"></script>
<script type='text/javascript' src='../js/validation.js'></script>
<script type="text/javascript">
	$(function() {
		$("dl").KandyTabs({
			action : "slide",
			trigger : "click"
		});
	})
</script>
</head>
<body>
	<div id="main"><jsp:include page="../main/mainHeader.jsp" />
		<div class="content">
			<div class="content_resize">
				<div class="mainbar">
					<s:form action="saveUsers.do" method="post" onsubmit="return validate(this);">
					<h3 class="title">新增员工</h3>
					<div id="addProjectTable">
						<dl>
							<dt>
								<h4 class="title">员工基本信息</h4>
							</dt>
							<dd>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width4Lb">姓名:</label>
										<input class="width100Input" name="userInfo.realName"
										id="userInfo.realName" />*</li>
									<textValidate field="userInfo.realName" lableText="<s:text name='姓名' />" isValidate="true" min="0" max="100">
									<li class="width250Li"><label class="width4Lb">编号:</label>
										<input class="width150Input" name="userInfo.identity"
										id="userInfo.identity" /></li>
									<li class="width200Li"><label class="width4Lb">用户名:</label>
										<input class="width100Input" name="userInfo.userName"
										id="userInfo.userName" /></li>
									<textValidate field="userInfo.userName" lableText="<s:text name='用户名' />" isValidate="true" min="0" max="100">
									<li class="width200Li"><label class="width4Lb">性别:</label>
									<select	id="userInfo.sex" name="userInfo.sex">
											<option value="0">--------男--------</option>
											<option value="1">--------女--------</option>
									</select></li>
								</ul>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width4Lb">出生年月:</label><input
										class="Wdate width100Input" name="userInfo.birthdayTmp"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
									<li class="width250Li"><label class="width4Lb">身份证:</label><input
										class="width150Input" name="userInfo.idCard"
										id="userInfo.idCard" /></li>
									<textValidate field="roleCount" lableText="<s:text name='userInfo.idCard' />" isValidate="true" dataType="codeType">
									<li class="width200Li"><label class="width4Lb">人事档案:</label><input
										class="width100Input" name="userInfo.humenFile"
										id="userInfo.humenFile" /></li>
									<li class="width200Li"><label class="width4Lb">党派:</label><input
										class="width100Input" name="userInfo.party"
										id="userInfo.party" /></li>
								</ul>
								<ul class="fullScreenUl">
									<li class="width450Li"><label class="width4Lb">家庭住址:</label><input
										class="width350Input" name="userInfo.familyAddress"
										id="userInfo.familyAddress" /></li>
									<li class="width200Li"><label class="width4Lb">电话:</label><input
										class="width100Input" name="userInfo.phone"
										id="userInfo.phone" /></li>
									<li class="width200Li"><label class="width4Lb">手机:</label><input
										class="width100Input" name="userInfo.mobilePhone"
										id="userInfo.mobilePhone" /></li>

								</ul>
							</dd>
							<dt>
								<h4 class="title">教育程度信息</h4>
							</dt>
							<dd>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width4Lb">学历:</label>
									<%
										EduBackgroundEnum[] ebk = EduBackgroundEnum.values();
										request.setAttribute("ebk", ebk);
									%>
									<select id="eduBackGround" name="eduBackGround">
										<s:iterator value="#request.ebk" status="st">
											<option value="<s:property value='key'/>"><s:property value='value'/></option>
										</s:iterator>
									</select>
									</li>
									<li class="width250Li"><label class="width4Lb">学校名称:</label><input
										class="width150Input" name="userInfo.school"
										id="userInfo.school" />
									</li>
									<li class="width200Li"><label class="width4Lb">专业:</label><input
										class="width100Input" name="userInfo.major"
										id="userInfo.major" />
									</li>
									<li class="width200Li"><label class="width4Lb">毕业日期:</label><input
										class="Wdate width100Input" name="userInfo.graduateDateTmp"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
								</ul>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width6Lb">继续教育情况:</label>
										<select id="userInfo.eduCountinue" name="userInfo.eduCountinue">
											<option value="0">---请选择---</option>
											<option value="1">通过</option>
											<option value="2">不通过</option>
									</select>
									</li>
								</ul>
							</dd>
							<dt>
								<h4 class="title">
									<h4 class="title">工作信息</h4>
								</h4>
							</dt>
							<dd>
								<ul class="fullScreenUlNoHeight">
									<li class="width100Li"><label class="width4Lb">所属部门:</label>
									</li>
									<li><ul class="width800UlNoHeight">
									<s:iterator value="userInfo.depts" status="st">
										<li class="widthAutoLi"><input type="checkbox" value="<s:property value="id"/>" name="deptGroup" id="<s:property value='id'/>"><label ><s:property value='name'/></label></li>
									</s:iterator>
									</ul></li>
									
								</ul>
								<ul class="fullScreenUlNoHeight" id="role">
									<li class="width100Li"><label class="width4Lb">职务:</label></li>
									<s:iterator value="userInfo.roles" status="st">
										<li class="widthAutoLi"><input type="checkbox" name="roleGroup" value="<s:property value="id"/>" id="<s:property value='id'/>"><label ><s:property value='name'/></label></li>
									</s:iterator>
								</ul>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width4Lb">职称:</label>
									<%
									UserTitleEnum[] userTitles = UserTitleEnum.values();
										request.setAttribute("userTitles", userTitles);
									%>
									<select id="title" name="title">
										<s:iterator value="#request.userTitles" status="st">
											<option value="<s:property value='key'/>"><s:property value='value'/></option>
										</s:iterator>
									</select>
									</li>
									<li class="width200Li"><label class="width4Lb">入职日期:</label><input
										class="Wdate width100Input" name="userInfo.onboardDateTmp"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
									<li class="width200Li"><label class="width4Lb">离职日期:</label><input
										class="Wdate width100Input" name="userInfo.leaveDateTmp"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>

								</ul>
								<ul class="fullScreenUl">
									<li class="width200Li"><label class="width4Lb">关联人:</label>
										<input class="width100Input" name="userInfo.relation"
										id="userInfo.relation" /></li>
									<li class="width200Li"><label class="width4Lb">状态:</label>
									<%
									UserStatusEnum[] userStatus = UserStatusEnum.values();
										request.setAttribute("userStatus", userStatus);
									%>
									<select id="status" name="status" class="width100Select">
										<s:iterator value="#request.userStatus" status="st">
											<option value="<s:property value='key'/>"><s:property value='value'/></option>
										</s:iterator>
									</select></li>

									<li class="width200Li"><label class="width4Lb">缴纳保险:</label>
									<%
										InsuranceTypeEnum[] insuranceTypes = InsuranceTypeEnum.values();
										request.setAttribute("insuranceTypes", insuranceTypes);
									%>
									<select name="type" id="type">
										<s:iterator value="#request.insuranceTypes" status="st">
											<option value="<s:property value='key'/>"><s:property value='value'/></option>
										</s:iterator>
									</select></li>
								</ul>
								<ul class="fullScreenUl">
									<li class="width450Li"><label class="width4Lb">备注:</label><input
										class="width350Input" name="userInfo.remark"
										id="userInfo.remark" />
									</li>
								</ul>
							</dd>
							<dt>
								<h4 class="title">
									<h4 class="title">执业资格信息</h4>
								</h4>
							</dt>
							<dd>
								<div id="employeeLicences">
									<ul class="fullScreenUl" id="1">
										<li class="width250Li"><label class="width4Lb">执业资格:</label>
										<%
										CertificationTypeEnum[] certifiTypes = CertificationTypeEnum.values();
										request.setAttribute("certifiTypes", certifiTypes);
									%>
										<select id="certifies[0].selectId" name="certifies[0].selectId" class="width150Select"> 
											<s:iterator value="#request.certifiTypes" status="st">
												<option value="<s:property value='key'/>"><s:property value='value'/></option>
											</s:iterator>
										</select></li>
										<li class="width250Li"><label class="width4Lb">证书编号:</label><input
											class="width150Input" name="certifies[0].identity"
											id="certifies[0].identity" />
										</li>
										<li class="width200Li">
											<label class='width3Lb'>有效期:</label>
											<input class='Wdate width100Input' name='certifies[0].expireDateFromPage' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
										</li>
										<li class="width150Li"><label class="width2Lb">备注:</label><input
											class="width100Input" name="certifies[0].remark"
											id="certifies[0].remark" />
										</li>
										<li class="width50Li"><input type="button"
											class="mediumLeftButton" onclick="deleteLicense(1);"
											value="删除">
										</li>
									</ul>
								</div>
								<ul class="fullScreenUl">
									<li><input type="button" class="mediumLeftButton"
										onclick="addLicense();" value="新增执业资格"></li>
								</ul>

							</dd>
						</dl>
						<ul class="fullScreenUl">
							<li><input type="submit" id="addProject" class="mediumLeftButton" value="保存">
							</li>
						</ul>
					</div>

					<div></div>

				</s:form>
				</div>


				<div class="clr"></div>
			</div>
		</div>
		<!-- end #page -->
		<jsp:include page="../common/footer.jsp" /></div>
</body>
<script type="text/javascript">
	var certifisCount = 0;
	function addLicense() {
		++certifisCount;
		var employeeLicences = document.getElementById("employeeLicences");
		var ul = document.createElement("ul");
		ul.className = "fullScreenUl";
		var li1 = document.createElement("li");
		li1.innerHTML = "<label class='width4Lb'>执业资格:</label>"
				+ '<select id="certifies['+certifisCount+'].selectId" name="certifies['+certifisCount+'].selectId" class="width150Select">'
				+ '<s:iterator value="#request.certifiTypes" status="st">'
				+ '<option value="<s:property value='key'/>"><s:property value='value'/></option>'
				+ '</s:iterator>'
				+ '</select>';
		var li2 = document.createElement("li");
		li2.innerHTML = "<label class='width4Lb'>证书编号:</label><input class='width150Input' name='certifies["+certifisCount+"].identity' id='certifies["+certifisCount+"].identity' />";
		var li3 = document.createElement("li");
		li3.innerHTML = "<label class='width3Lb'>有效期:</label><input class='Wdate width100Input' name='certifies["+certifisCount+"].expireDateFromPage' onfocus=WdatePicker({dateFmt:'yyyy-MM-dd'}) />";
		var li4 = document.createElement("li");
		li4.innerHTML = "<label class='width2Lb'>备注:</label><input class='width100Input' name='certifies["+certifisCount+"].remark'	 id='certifies["+certifisCount+"].remark' />";
		var li5 = document.createElement("li");
		var t = employeeLicences.children.length;
		var id = "licence" + (t + 1);
		li5.innerHTML = "<input type='button' class='mediumLeftButton' onclick='deleteLicense("
				+ id + ")' value='删除'>";
		li1.className = "width250Li";
		li2.className = "width250Li";
		li3.className = "width200Li";
		li4.className = "width150Li";
		li5.className = "width50Li";
		ul.appendChild(li1);
		ul.appendChild(li2);
		ul.appendChild(li3);
		ul.appendChild(li4);
		ul.appendChild(li5);
		ul.setAttribute("id", id);
		employeeLicences.appendChild(ul);
	}

	function deleteLicense(id) {
		if (confirm("确定删除该职业资质？")) {
			var employeeLicences = document.getElementById("employeeLicences");
			employeeLicences.removeChild(id);
		}
	}

	function addDept() {
		var ul = document.getElementById("dept");
		var li = document.createElement("li");
		var t = ul.childNodes.length;
		var id = "dept" + (t + 1);
		li.innerHTML = "<select id='projectType' name='userInfo.majorType'><option >----请选择----</option><option >咨询1部</option><option >咨询2部</option><option >咨询3部</option></select><input type='button' class='mediumRightButton' onclick='deleteDeptItem("
				+ id + ")' value='删除'>";
		li.className = "width150Li";
		li.setAttribute("id", id);
		ul.appendChild(li);
	}

	function addRole() {
		var ul = document.getElementById("role");
		var li = document.createElement("li");
		var t = ul.childNodes.length;
		var id = "role" + (t + 1);
		li.innerHTML = "<select id='projectType' name='userInfo.majorType'><option >----请选择----</option><option >咨询1部</option><option >咨询2部</option><option >咨询3部</option></select><input type='button' class='mediumRightButton' onclick='deleteRoleItem("
				+ id + ")' value='删除'>";
		li.className = "width150Li";
		li.setAttribute("id", id);
		ul.appendChild(li);
	}

	function deleteDeptItem(id) {
		if (confirm("确定删除该部门归属？")) {
			var ul = document.getElementById("dept");
			ul.removeChild(id);
		}
	}

	function deleteRoleItem(id) {
		if (confirm("确定删除该职务归属？")) {
			var ul = $("role");
			ul.removeChild(id);
		}
	}
</script>


</html>
